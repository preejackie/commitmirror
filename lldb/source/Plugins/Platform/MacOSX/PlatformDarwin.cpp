//===-- PlatformDarwin.cpp --------------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "PlatformDarwin.h"

#include <string.h>

#include <algorithm>
#include <memory>
#include <mutex>

#include "lldb/Breakpoint/BreakpointLocation.h"
#include "lldb/Breakpoint/BreakpointSite.h"
#include "lldb/Core/Debugger.h"
#include "lldb/Core/Module.h"
#include "lldb/Core/ModuleSpec.h"
#include "lldb/Host/Host.h"
#include "lldb/Host/HostInfo.h"
#include "lldb/Host/XML.h"
#include "lldb/Interpreter/CommandInterpreter.h"
#include "lldb/Symbol/LocateSymbolFile.h"
#include "lldb/Symbol/ObjectFile.h"
#include "lldb/Symbol/SymbolFile.h"
#include "lldb/Symbol/SymbolVendor.h"
#include "lldb/Target/Platform.h"
#include "lldb/Target/Process.h"
#include "lldb/Target/Target.h"
#include "lldb/Utility/Log.h"
#include "lldb/Utility/ProcessInfo.h"
#include "lldb/Utility/Status.h"
#include "lldb/Utility/Timer.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Threading.h"
#include "llvm/Support/VersionTuple.h"

#if defined(__APPLE__)
#include <TargetConditionals.h>
#endif

using namespace lldb;
using namespace lldb_private;

/// Default Constructor
PlatformDarwin::PlatformDarwin(bool is_host)
    : PlatformPOSIX(is_host), // This is the local host platform
      m_developer_directory() {}

/// Destructor.
///
/// The destructor is virtual since this class is designed to be
/// inherited from by the plug-in instance.
PlatformDarwin::~PlatformDarwin() {}

FileSpecList PlatformDarwin::LocateExecutableScriptingResources(
    Target *target, Module &module, Stream *feedback_stream) {
  FileSpecList file_list;
  if (target &&
      target->GetDebugger().GetScriptLanguage() == eScriptLanguagePython) {
    // NB some extensions might be meaningful and should not be stripped -
    // "this.binary.file"
    // should not lose ".file" but GetFileNameStrippingExtension() will do
    // precisely that. Ideally, we should have a per-platform list of
    // extensions (".exe", ".app", ".dSYM", ".framework") which should be
    // stripped while leaving "this.binary.file" as-is.

    FileSpec module_spec = module.GetFileSpec();

    if (module_spec) {
      SymbolVendor *symbols = module.GetSymbolVendor();
      if (symbols) {
        SymbolFile *symfile = symbols->GetSymbolFile();
        if (symfile) {
          ObjectFile *objfile = symfile->GetObjectFile();
          if (objfile) {
            FileSpec symfile_spec(objfile->GetFileSpec());
            if (symfile_spec && 
                strcasestr (symfile_spec.GetPath().c_str(), 
                        ".dSYM/Contents/Resources/DWARF") != nullptr &&
                FileSystem::Instance().Exists(symfile_spec)) {
              while (module_spec.GetFilename()) {
                std::string module_basename(
                    module_spec.GetFilename().GetCString());
                std::string original_module_basename(module_basename);

                bool was_keyword = false;

                // FIXME: for Python, we cannot allow certain characters in
                // module
                // filenames we import. Theoretically, different scripting
                // languages may have different sets of forbidden tokens in
                // filenames, and that should be dealt with by each
                // ScriptInterpreter. For now, we just replace dots with
                // underscores, but if we ever support anything other than
                // Python we will need to rework this
                std::replace(module_basename.begin(), module_basename.end(),
                             '.', '_');
                std::replace(module_basename.begin(), module_basename.end(),
                             ' ', '_');
                std::replace(module_basename.begin(), module_basename.end(),
                             '-', '_');
                ScriptInterpreter *script_interpreter =
                    target->GetDebugger().GetScriptInterpreter();
                if (script_interpreter &&
                    script_interpreter->IsReservedWord(
                        module_basename.c_str())) {
                  module_basename.insert(module_basename.begin(), '_');
                  was_keyword = true;
                }

                StreamString path_string;
                StreamString original_path_string;
                // for OSX we are going to be in
                // .dSYM/Contents/Resources/DWARF/<basename> let us go to
                // .dSYM/Contents/Resources/Python/<basename>.py and see if the
                // file exists
                path_string.Printf("%s/../Python/%s.py",
                                   symfile_spec.GetDirectory().GetCString(),
                                   module_basename.c_str());
                original_path_string.Printf(
                    "%s/../Python/%s.py",
                    symfile_spec.GetDirectory().GetCString(),
                    original_module_basename.c_str());
                FileSpec script_fspec(path_string.GetString());
                FileSystem::Instance().Resolve(script_fspec);
                FileSpec orig_script_fspec(original_path_string.GetString());
                FileSystem::Instance().Resolve(orig_script_fspec);

                // if we did some replacements of reserved characters, and a
                // file with the untampered name exists, then warn the user
                // that the file as-is shall not be loaded
                if (feedback_stream) {
                  if (module_basename != original_module_basename &&
                      FileSystem::Instance().Exists(orig_script_fspec)) {
                    const char *reason_for_complaint =
                        was_keyword ? "conflicts with a keyword"
                                    : "contains reserved characters";
                    if (FileSystem::Instance().Exists(script_fspec))
                      feedback_stream->Printf(
                          "warning: the symbol file '%s' contains a debug "
                          "script. However, its name"
                          " '%s' %s and as such cannot be loaded. LLDB will"
                          " load '%s' instead. Consider removing the file with "
                          "the malformed name to"
                          " eliminate this warning.\n",
                          symfile_spec.GetPath().c_str(),
                          original_path_string.GetData(), reason_for_complaint,
                          path_string.GetData());
                    else
                      feedback_stream->Printf(
                          "warning: the symbol file '%s' contains a debug "
                          "script. However, its name"
                          " %s and as such cannot be loaded. If you intend"
                          " to have this script loaded, please rename '%s' to "
                          "'%s' and retry.\n",
                          symfile_spec.GetPath().c_str(), reason_for_complaint,
                          original_path_string.GetData(),
                          path_string.GetData());
                  }
                }

                if (FileSystem::Instance().Exists(script_fspec)) {
                  file_list.Append(script_fspec);
                  break;
                }

                // If we didn't find the python file, then keep stripping the
                // extensions and try again
                ConstString filename_no_extension(
                    module_spec.GetFileNameStrippingExtension());
                if (module_spec.GetFilename() == filename_no_extension)
                  break;

                module_spec.GetFilename() = filename_no_extension;
              }
            }
          }
        }
      }
    }
  }
  return file_list;
}

Status PlatformDarwin::ResolveSymbolFile(Target &target,
                                         const ModuleSpec &sym_spec,
                                         FileSpec &sym_file) {
  sym_file = sym_spec.GetSymbolFileSpec();
  if (FileSystem::Instance().IsDirectory(sym_file)) {
    sym_file = Symbols::FindSymbolFileInBundle(sym_file, sym_spec.GetUUIDPtr(),
                                               sym_spec.GetArchitecturePtr());
  }
  return {};
}

static lldb_private::Status
MakeCacheFolderForFile(const FileSpec &module_cache_spec) {
  FileSpec module_cache_folder =
      module_cache_spec.CopyByRemovingLastPathComponent();
  return llvm::sys::fs::create_directory(module_cache_folder.GetPath());
}

static lldb_private::Status
BringInRemoteFile(Platform *platform,
                  const lldb_private::ModuleSpec &module_spec,
                  const FileSpec &module_cache_spec) {
  MakeCacheFolderForFile(module_cache_spec);
  Status err = platform->GetFile(module_spec.GetFileSpec(), module_cache_spec);
  return err;
}

lldb_private::Status PlatformDarwin::GetSharedModuleWithLocalCache(
    const lldb_private::ModuleSpec &module_spec, lldb::ModuleSP &module_sp,
    const lldb_private::FileSpecList *module_search_paths_ptr,
    lldb::ModuleSP *old_module_sp_ptr, bool *did_create_ptr) {

  Log *log(GetLogIfAnyCategoriesSet(LIBLLDB_LOG_PLATFORM));
  LLDB_LOGF(log,
            "[%s] Trying to find module %s/%s - platform path %s/%s symbol "
            "path %s/%s",
            (IsHost() ? "host" : "remote"),
            module_spec.GetFileSpec().GetDirectory().AsCString(),
            module_spec.GetFileSpec().GetFilename().AsCString(),
            module_spec.GetPlatformFileSpec().GetDirectory().AsCString(),
            module_spec.GetPlatformFileSpec().GetFilename().AsCString(),
            module_spec.GetSymbolFileSpec().GetDirectory().AsCString(),
            module_spec.GetSymbolFileSpec().GetFilename().AsCString());

  Status err;

  err = ModuleList::GetSharedModule(module_spec, module_sp,
                                    module_search_paths_ptr, old_module_sp_ptr,
                                    did_create_ptr);
  if (module_sp)
    return err;

  if (!IsHost()) {
    std::string cache_path(GetLocalCacheDirectory());
    // Only search for a locally cached file if we have a valid cache path
    if (!cache_path.empty()) {
      std::string module_path(module_spec.GetFileSpec().GetPath());
      cache_path.append(module_path);
      FileSpec module_cache_spec(cache_path);

      // if rsync is supported, always bring in the file - rsync will be very
      // efficient when files are the same on the local and remote end of the
      // connection
      if (this->GetSupportsRSync()) {
        err = BringInRemoteFile(this, module_spec, module_cache_spec);
        if (err.Fail())
          return err;
        if (FileSystem::Instance().Exists(module_cache_spec)) {
          Log *log(GetLogIfAnyCategoriesSet(LIBLLDB_LOG_PLATFORM));
          LLDB_LOGF(log, "[%s] module %s/%s was rsynced and is now there",
                    (IsHost() ? "host" : "remote"),
                    module_spec.GetFileSpec().GetDirectory().AsCString(),
                    module_spec.GetFileSpec().GetFilename().AsCString());
          ModuleSpec local_spec(module_cache_spec,
                                module_spec.GetArchitecture());
          module_sp = std::make_shared<Module>(local_spec);
          module_sp->SetPlatformFileSpec(module_spec.GetFileSpec());
          return Status();
        }
      }

      // try to find the module in the cache
      if (FileSystem::Instance().Exists(module_cache_spec)) {
        // get the local and remote MD5 and compare
        if (m_remote_platform_sp) {
          // when going over the *slow* GDB remote transfer mechanism we first
          // check the hashes of the files - and only do the actual transfer if
          // they differ
          uint64_t high_local, high_remote, low_local, low_remote;
          auto MD5 = llvm::sys::fs::md5_contents(module_cache_spec.GetPath());
          if (!MD5)
            return Status(MD5.getError());
          std::tie(high_local, low_local) = MD5->words();

          m_remote_platform_sp->CalculateMD5(module_spec.GetFileSpec(),
                                             low_remote, high_remote);
          if (low_local != low_remote || high_local != high_remote) {
            // bring in the remote file
            Log *log(GetLogIfAnyCategoriesSet(LIBLLDB_LOG_PLATFORM));
            LLDB_LOGF(log,
                      "[%s] module %s/%s needs to be replaced from remote copy",
                      (IsHost() ? "host" : "remote"),
                      module_spec.GetFileSpec().GetDirectory().AsCString(),
                      module_spec.GetFileSpec().GetFilename().AsCString());
            Status err =
                BringInRemoteFile(this, module_spec, module_cache_spec);
            if (err.Fail())
              return err;
          }
        }

        ModuleSpec local_spec(module_cache_spec, module_spec.GetArchitecture());
        module_sp = std::make_shared<Module>(local_spec);
        module_sp->SetPlatformFileSpec(module_spec.GetFileSpec());
        Log *log(GetLogIfAnyCategoriesSet(LIBLLDB_LOG_PLATFORM));
        LLDB_LOGF(log, "[%s] module %s/%s was found in the cache",
                  (IsHost() ? "host" : "remote"),
                  module_spec.GetFileSpec().GetDirectory().AsCString(),
                  module_spec.GetFileSpec().GetFilename().AsCString());
        return Status();
      }

      // bring in the remote module file
      LLDB_LOGF(log, "[%s] module %s/%s needs to come in remotely",
                (IsHost() ? "host" : "remote"),
                module_spec.GetFileSpec().GetDirectory().AsCString(),
                module_spec.GetFileSpec().GetFilename().AsCString());
      Status err = BringInRemoteFile(this, module_spec, module_cache_spec);
      if (err.Fail())
        return err;
      if (FileSystem::Instance().Exists(module_cache_spec)) {
        Log *log(GetLogIfAnyCategoriesSet(LIBLLDB_LOG_PLATFORM));
        LLDB_LOGF(log, "[%s] module %s/%s is now cached and fine",
                  (IsHost() ? "host" : "remote"),
                  module_spec.GetFileSpec().GetDirectory().AsCString(),
                  module_spec.GetFileSpec().GetFilename().AsCString());
        ModuleSpec local_spec(module_cache_spec, module_spec.GetArchitecture());
        module_sp = std::make_shared<Module>(local_spec);
        module_sp->SetPlatformFileSpec(module_spec.GetFileSpec());
        return Status();
      } else
        return Status("unable to obtain valid module file");
    } else
      return Status("no cache path");
  } else
    return Status("unable to resolve module");
}

Status PlatformDarwin::GetSharedModule(
    const ModuleSpec &module_spec, Process *process, ModuleSP &module_sp,
    const FileSpecList *module_search_paths_ptr, ModuleSP *old_module_sp_ptr,
    bool *did_create_ptr) {
  Status error;
  module_sp.reset();

  if (IsRemote()) {
    // If we have a remote platform always, let it try and locate the shared
    // module first.
    if (m_remote_platform_sp) {
      error = m_remote_platform_sp->GetSharedModule(
          module_spec, process, module_sp, module_search_paths_ptr,
          old_module_sp_ptr, did_create_ptr);
    }
  }

  if (!module_sp) {
    // Fall back to the local platform and find the file locally
    error = Platform::GetSharedModule(module_spec, process, module_sp,
                                      module_search_paths_ptr,
                                      old_module_sp_ptr, did_create_ptr);

    const FileSpec &platform_file = module_spec.GetFileSpec();
    if (!module_sp && module_search_paths_ptr && platform_file) {
      // We can try to pull off part of the file path up to the bundle
      // directory level and try any module search paths...
      FileSpec bundle_directory;
      if (Host::GetBundleDirectory(platform_file, bundle_directory)) {
        if (platform_file == bundle_directory) {
          ModuleSpec new_module_spec(module_spec);
          new_module_spec.GetFileSpec() = bundle_directory;
          if (Host::ResolveExecutableInBundle(new_module_spec.GetFileSpec())) {
            Status new_error(Platform::GetSharedModule(
                new_module_spec, process, module_sp, nullptr, old_module_sp_ptr,
                did_create_ptr));

            if (module_sp)
              return new_error;
          }
        } else {
          char platform_path[PATH_MAX];
          char bundle_dir[PATH_MAX];
          platform_file.GetPath(platform_path, sizeof(platform_path));
          const size_t bundle_directory_len =
              bundle_directory.GetPath(bundle_dir, sizeof(bundle_dir));
          char new_path[PATH_MAX];
          size_t num_module_search_paths = module_search_paths_ptr->GetSize();
          for (size_t i = 0; i < num_module_search_paths; ++i) {
            const size_t search_path_len =
                module_search_paths_ptr->GetFileSpecAtIndex(i).GetPath(
                    new_path, sizeof(new_path));
            if (search_path_len < sizeof(new_path)) {
              snprintf(new_path + search_path_len,
                       sizeof(new_path) - search_path_len, "/%s",
                       platform_path + bundle_directory_len);
              FileSpec new_file_spec(new_path);
              if (FileSystem::Instance().Exists(new_file_spec)) {
                ModuleSpec new_module_spec(module_spec);
                new_module_spec.GetFileSpec() = new_file_spec;
                Status new_error(Platform::GetSharedModule(
                    new_module_spec, process, module_sp, nullptr,
                    old_module_sp_ptr, did_create_ptr));

                if (module_sp) {
                  module_sp->SetPlatformFileSpec(new_file_spec);
                  return new_error;
                }
              }
            }
          }
        }
      }
    }
  }
  if (module_sp)
    module_sp->SetPlatformFileSpec(module_spec.GetFileSpec());
  return error;
}

size_t
PlatformDarwin::GetSoftwareBreakpointTrapOpcode(Target &target,
                                                BreakpointSite *bp_site) {
  const uint8_t *trap_opcode = nullptr;
  uint32_t trap_opcode_size = 0;
  bool bp_is_thumb = false;

  llvm::Triple::ArchType machine = target.GetArchitecture().GetMachine();
  switch (machine) {
  case llvm::Triple::aarch64: {
    // TODO: fix this with actual darwin breakpoint opcode for arm64.
    // right now debugging uses the Z packets with GDB remote so this is not
    // needed, but the size needs to be correct...
    static const uint8_t g_arm64_breakpoint_opcode[] = {0xFE, 0xDE, 0xFF, 0xE7};
    trap_opcode = g_arm64_breakpoint_opcode;
    trap_opcode_size = sizeof(g_arm64_breakpoint_opcode);
  } break;

  case llvm::Triple::thumb:
    bp_is_thumb = true;
    LLVM_FALLTHROUGH;
  case llvm::Triple::arm: {
    static const uint8_t g_arm_breakpoint_opcode[] = {0xFE, 0xDE, 0xFF, 0xE7};
    static const uint8_t g_thumb_breakpooint_opcode[] = {0xFE, 0xDE};

    // Auto detect arm/thumb if it wasn't explicitly specified
    if (!bp_is_thumb) {
      lldb::BreakpointLocationSP bp_loc_sp(bp_site->GetOwnerAtIndex(0));
      if (bp_loc_sp)
        bp_is_thumb = bp_loc_sp->GetAddress().GetAddressClass() ==
                      AddressClass::eCodeAlternateISA;
    }
    if (bp_is_thumb) {
      trap_opcode = g_thumb_breakpooint_opcode;
      trap_opcode_size = sizeof(g_thumb_breakpooint_opcode);
      break;
    }
    trap_opcode = g_arm_breakpoint_opcode;
    trap_opcode_size = sizeof(g_arm_breakpoint_opcode);
  } break;

  case llvm::Triple::ppc:
  case llvm::Triple::ppc64: {
    static const uint8_t g_ppc_breakpoint_opcode[] = {0x7F, 0xC0, 0x00, 0x08};
    trap_opcode = g_ppc_breakpoint_opcode;
    trap_opcode_size = sizeof(g_ppc_breakpoint_opcode);
  } break;

  default:
    return Platform::GetSoftwareBreakpointTrapOpcode(target, bp_site);
  }

  if (trap_opcode && trap_opcode_size) {
    if (bp_site->SetTrapOpcode(trap_opcode, trap_opcode_size))
      return trap_opcode_size;
  }
  return 0;
}

bool PlatformDarwin::ModuleIsExcludedForUnconstrainedSearches(
    lldb_private::Target &target, const lldb::ModuleSP &module_sp) {
  if (!module_sp)
    return false;

  ObjectFile *obj_file = module_sp->GetObjectFile();
  if (!obj_file)
    return false;

  ObjectFile::Type obj_type = obj_file->GetType();
  return obj_type == ObjectFile::eTypeDynamicLinker;
}

bool PlatformDarwin::x86GetSupportedArchitectureAtIndex(uint32_t idx,
                                                        ArchSpec &arch) {
  ArchSpec host_arch = HostInfo::GetArchitecture(HostInfo::eArchKindDefault);
  if (host_arch.GetCore() == ArchSpec::eCore_x86_64_x86_64h) {
    switch (idx) {
    case 0:
      arch = host_arch;
      return true;

    case 1:
      arch.SetTriple("x86_64-apple-macosx");
      return true;

    case 2:
      arch = HostInfo::GetArchitecture(HostInfo::eArchKind32);
      return true;

    default:
      return false;
    }
  } else {
    if (idx == 0) {
      arch = HostInfo::GetArchitecture(HostInfo::eArchKindDefault);
      return arch.IsValid();
    } else if (idx == 1) {
      ArchSpec platform_arch(
          HostInfo::GetArchitecture(HostInfo::eArchKindDefault));
      ArchSpec platform_arch64(
          HostInfo::GetArchitecture(HostInfo::eArchKind64));
      if (platform_arch.IsExactMatch(platform_arch64)) {
        // This macosx platform supports both 32 and 64 bit. Since we already
        // returned the 64 bit arch for idx == 0, return the 32 bit arch for
        // idx == 1
        arch = HostInfo::GetArchitecture(HostInfo::eArchKind32);
        return arch.IsValid();
      }
    }
  }
  return false;
}

// The architecture selection rules for arm processors These cpu subtypes have
// distinct names (e.g. armv7f) but armv7 binaries run fine on an armv7f
// processor.

bool PlatformDarwin::ARMGetSupportedArchitectureAtIndex(uint32_t idx,
                                                        ArchSpec &arch) {
  ArchSpec system_arch(GetSystemArchitecture());

// When lldb is running on a watch or tv, set the arch OS name appropriately.
#if defined(TARGET_OS_TV) && TARGET_OS_TV == 1
#define OSNAME "tvos"
#elif defined(TARGET_OS_WATCH) && TARGET_OS_WATCH == 1
#define OSNAME "watchos"
#elif defined(TARGET_OS_BRIDGE) && TARGET_OS_BRIDGE == 1
#define OSNAME "bridgeos"
#else
#define OSNAME "ios"
#endif

  const ArchSpec::Core system_core = system_arch.GetCore();
  switch (system_core) {
  default:
    switch (idx) {
    case 0:
      arch.SetTriple("arm64-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv7f-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv7k-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv7s-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv7m-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("armv7em-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumbv7f-apple-" OSNAME);
      return true;
    case 14:
      arch.SetTriple("thumbv7k-apple-" OSNAME);
      return true;
    case 15:
      arch.SetTriple("thumbv7s-apple-" OSNAME);
      return true;
    case 16:
      arch.SetTriple("thumbv7m-apple-" OSNAME);
      return true;
    case 17:
      arch.SetTriple("thumbv7em-apple-" OSNAME);
      return true;
    case 18:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 19:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 20:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 21:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 22:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_arm64:
    switch (idx) {
    case 0:
      arch.SetTriple("arm64-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7s-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv7f-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv7m-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv7em-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv7f-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumbv7k-apple-" OSNAME);
      return true;
    case 14:
      arch.SetTriple("thumbv7s-apple-" OSNAME);
      return true;
    case 15:
      arch.SetTriple("thumbv7m-apple-" OSNAME);
      return true;
    case 16:
      arch.SetTriple("thumbv7em-apple-" OSNAME);
      return true;
    case 17:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 18:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 19:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 20:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 21:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7f:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7f-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv7f-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7k:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7k-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv7k-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7s:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7s-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv7s-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7m:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7m-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv7m-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7em:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7em-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv7em-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 12:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 13:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv7:
    switch (idx) {
    case 0:
      arch.SetTriple("armv7-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("thumbv7-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 10:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 11:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv6m:
    switch (idx) {
    case 0:
      arch.SetTriple("armv6m-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("thumbv6m-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 8:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 9:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv6:
    switch (idx) {
    case 0:
      arch.SetTriple("armv6-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("thumbv6-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 6:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 7:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv5:
    switch (idx) {
    case 0:
      arch.SetTriple("armv5-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("thumbv5-apple-" OSNAME);
      return true;
    case 4:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 5:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;

  case ArchSpec::eCore_arm_armv4:
    switch (idx) {
    case 0:
      arch.SetTriple("armv4-apple-" OSNAME);
      return true;
    case 1:
      arch.SetTriple("arm-apple-" OSNAME);
      return true;
    case 2:
      arch.SetTriple("thumbv4t-apple-" OSNAME);
      return true;
    case 3:
      arch.SetTriple("thumb-apple-" OSNAME);
      return true;
    default:
      break;
    }
    break;
  }
  arch.Clear();
  return false;
}

// Return a directory path like /Applications/Xcode.app/Contents/Developer
const char *PlatformDarwin::GetDeveloperDirectory() {
  std::lock_guard<std::mutex> guard(m_mutex);
  if (m_developer_directory.empty()) {
    bool developer_dir_path_valid = false;
    char developer_dir_path[PATH_MAX];

    // Get the lldb framework's file path, and if it exists, truncate some
    // components to only the developer directory path.
    FileSpec temp_file_spec = HostInfo::GetShlibDir();
    if (temp_file_spec) {
      if (temp_file_spec.GetPath(developer_dir_path,
                                 sizeof(developer_dir_path))) {
        // e.g.
        // /Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework
        char *shared_frameworks =
            strstr(developer_dir_path, "/SharedFrameworks/LLDB.framework");
        if (shared_frameworks) {
          shared_frameworks[0] = '\0';  // truncate developer_dir_path at this point
          strncat (developer_dir_path, "/Developer", sizeof (developer_dir_path) - 1); // add /Developer on
          developer_dir_path_valid = true;
        } else {
          // e.g.
          // /Applications/Xcode.app/Contents/Developer/Toolchains/iOS11.2.xctoolchain/System/Library/PrivateFrameworks/LLDB.framework
          char *developer_toolchains =
            strstr(developer_dir_path, "/Contents/Developer/Toolchains/");
          if (developer_toolchains) {
            developer_toolchains += sizeof ("/Contents/Developer") - 1;
            developer_toolchains[0] = '\0'; // truncate developer_dir_path at this point
            developer_dir_path_valid = true;
          }
        }
      }
    }

    if (!developer_dir_path_valid) {
      std::string xcode_dir_path;
      const char *xcode_select_prefix_dir = getenv("XCODE_SELECT_PREFIX_DIR");
      if (xcode_select_prefix_dir)
        xcode_dir_path.append(xcode_select_prefix_dir);
      xcode_dir_path.append("/usr/share/xcode-select/xcode_dir_path");
      temp_file_spec.SetFile(xcode_dir_path, FileSpec::Style::native);
      auto dir_buffer =
          FileSystem::Instance().CreateDataBuffer(temp_file_spec.GetPath());
      if (dir_buffer && dir_buffer->GetByteSize() > 0) {
        llvm::StringRef path_ref(dir_buffer->GetChars());
        // Trim tailing newlines and make sure there is enough room for a null
        // terminator.
        path_ref =
            path_ref.rtrim("\r\n").take_front(sizeof(developer_dir_path) - 1);
        ::memcpy(developer_dir_path, path_ref.data(), path_ref.size());
        developer_dir_path[path_ref.size()] = '\0';
        developer_dir_path_valid = true;
      }
    }

    if (!developer_dir_path_valid) {
      FileSpec xcode_select_cmd("/usr/bin/xcode-select");
      if (FileSystem::Instance().Exists(xcode_select_cmd)) {
        int exit_status = -1;
        int signo = -1;
        std::string command_output;
        Status error =
            Host::RunShellCommand("/usr/bin/xcode-select --print-path",
                                  nullptr, // current working directory
                                  &exit_status, &signo, &command_output,
                                  std::chrono::seconds(2), // short timeout
                                  false); // don't run in a shell
        if (error.Success() && exit_status == 0 && !command_output.empty()) {
          const char *cmd_output_ptr = command_output.c_str();
          developer_dir_path[sizeof(developer_dir_path) - 1] = '\0';
          size_t i;
          for (i = 0; i < sizeof(developer_dir_path) - 1; i++) {
            if (cmd_output_ptr[i] == '\r' || cmd_output_ptr[i] == '\n' ||
                cmd_output_ptr[i] == '\0')
              break;
            developer_dir_path[i] = cmd_output_ptr[i];
          }
          developer_dir_path[i] = '\0';

          FileSpec devel_dir(developer_dir_path);
          if (FileSystem::Instance().IsDirectory(devel_dir)) {
            developer_dir_path_valid = true;
          }
        }
      }
    }

    if (developer_dir_path_valid) {
      temp_file_spec.SetFile(developer_dir_path, FileSpec::Style::native);
      if (FileSystem::Instance().Exists(temp_file_spec)) {
        m_developer_directory.assign(developer_dir_path);
        return m_developer_directory.c_str();
      }
    }
    // Assign a single NULL character so we know we tried to find the device
    // support directory and we don't keep trying to find it over and over.
    m_developer_directory.assign(1, '\0');
  }

  // We should have put a single NULL character into m_developer_directory or
  // it should have a valid path if the code gets here
  assert(m_developer_directory.empty() == false);
  if (m_developer_directory[0])
    return m_developer_directory.c_str();
  return nullptr;
}

BreakpointSP PlatformDarwin::SetThreadCreationBreakpoint(Target &target) {
  BreakpointSP bp_sp;
  static const char *g_bp_names[] = {
      "start_wqthread", "_pthread_wqthread", "_pthread_start",
  };

  static const char *g_bp_modules[] = {"libsystem_c.dylib",
                                       "libSystem.B.dylib"};

  FileSpecList bp_modules;
  for (size_t i = 0; i < llvm::array_lengthof(g_bp_modules); i++) {
    const char *bp_module = g_bp_modules[i];
    bp_modules.EmplaceBack(bp_module);
  }

  bool internal = true;
  bool hardware = false;
  LazyBool skip_prologue = eLazyBoolNo;
  bp_sp = target.CreateBreakpoint(&bp_modules, nullptr, g_bp_names,
                                  llvm::array_lengthof(g_bp_names),
                                  eFunctionNameTypeFull, eLanguageTypeUnknown,
                                  0, skip_prologue, internal, hardware);
  bp_sp->SetBreakpointKind("thread-creation");

  return bp_sp;
}

int32_t
PlatformDarwin::GetResumeCountForLaunchInfo(ProcessLaunchInfo &launch_info) {
  const FileSpec &shell = launch_info.GetShell();
  if (!shell)
    return 1;

  std::string shell_string = shell.GetPath();
  const char *shell_name = strrchr(shell_string.c_str(), '/');
  if (shell_name == nullptr)
    shell_name = shell_string.c_str();
  else
    shell_name++;

  if (strcmp(shell_name, "sh") == 0) {
    // /bin/sh re-exec's itself as /bin/bash requiring another resume. But it
    // only does this if the COMMAND_MODE environment variable is set to
    // "legacy".
    if (launch_info.GetEnvironment().lookup("COMMAND_MODE") == "legacy")
      return 2;
    return 1;
  } else if (strcmp(shell_name, "csh") == 0 ||
             strcmp(shell_name, "tcsh") == 0 ||
             strcmp(shell_name, "zsh") == 0) {
    // csh and tcsh always seem to re-exec themselves.
    return 2;
  } else
    return 1;
}

void PlatformDarwin::CalculateTrapHandlerSymbolNames() {
  m_trap_handlers.push_back(ConstString("_sigtramp"));
}

static const char *const sdk_strings[] = {
    "MacOSX", "iPhoneSimulator", "iPhoneOS",
};

static FileSpec CheckPathForXcode(const FileSpec &fspec) {
  if (FileSystem::Instance().Exists(fspec)) {
    const char substr[] = ".app/Contents";

    std::string path_to_shlib = fspec.GetPath();
    size_t pos = path_to_shlib.rfind(substr);
    if (pos != std::string::npos) {
      path_to_shlib.erase(pos + strlen(substr));
      FileSpec ret(path_to_shlib);

      FileSpec xcode_binary_path = ret;
      xcode_binary_path.AppendPathComponent("MacOS");
      xcode_binary_path.AppendPathComponent("Xcode");

      if (FileSystem::Instance().Exists(xcode_binary_path)) {
        return ret;
      }
    }
  }
  return FileSpec();
}

static FileSpec GetXcodeContentsPath() {
  static FileSpec g_xcode_filespec;
  static llvm::once_flag g_once_flag;
  llvm::call_once(g_once_flag, []() {

    FileSpec fspec;

    // First get the program file spec. If lldb.so or LLDB.framework is running
    // in a program and that program is Xcode, the path returned with be the
    // path to Xcode.app/Contents/MacOS/Xcode, so this will be the correct
    // Xcode to use.
    fspec = HostInfo::GetProgramFileSpec();

    if (fspec) {
      // Ignore the current binary if it is python.
      std::string basename_lower = fspec.GetFilename().GetCString();
      std::transform(basename_lower.begin(), basename_lower.end(),
                     basename_lower.begin(), tolower);
      if (basename_lower != "python") {
        g_xcode_filespec = CheckPathForXcode(fspec);
      }
    }

    // Next check DEVELOPER_DIR environment variable
    if (!g_xcode_filespec) {
      const char *developer_dir_env_var = getenv("DEVELOPER_DIR");
      if (developer_dir_env_var && developer_dir_env_var[0]) {
        FileSpec developer_dir_spec = FileSpec(developer_dir_env_var);
        FileSystem::Instance().Resolve(developer_dir_spec);
        g_xcode_filespec = CheckPathForXcode(developer_dir_spec);
      }

      // Fall back to using "xcrun" to find the selected Xcode
      if (!g_xcode_filespec) {
        int status = 0;
        int signo = 0;
        std::string output;
        const char *command = "/usr/bin/xcode-select -p";
        lldb_private::Status error = Host::RunShellCommand(
            command, // shell command to run
            nullptr, // current working directory
            &status, // Put the exit status of the process in here
            &signo,  // Put the signal that caused the process to exit in here
            &output, // Get the output from the command and place it in this
                     // string
            std::chrono::seconds(3));
        if (status == 0 && !output.empty()) {
          size_t first_non_newline = output.find_last_not_of("\r\n");
          if (first_non_newline != std::string::npos) {
            output.erase(first_non_newline + 1);
          }
          output.append("/..");

          g_xcode_filespec = CheckPathForXcode(FileSpec(output));
        }
      }
    }
  });

  return g_xcode_filespec;
}

bool PlatformDarwin::SDKSupportsModules(SDKType sdk_type,
                                        llvm::VersionTuple version) {
  switch (sdk_type) {
  case SDKType::MacOSX:
    return version >= llvm::VersionTuple(10, 10);
  case SDKType::iPhoneOS:
  case SDKType::iPhoneSimulator:
    return version >= llvm::VersionTuple(8);
  }

  return false;
}

bool PlatformDarwin::SDKSupportsModules(SDKType desired_type,
                                        const FileSpec &sdk_path) {
  ConstString last_path_component = sdk_path.GetLastPathComponent();

  if (last_path_component) {
    const llvm::StringRef sdk_name = last_path_component.GetStringRef();

    if (!sdk_name.startswith(sdk_strings[desired_type]))
      return false;
    auto version_part =
        sdk_name.drop_front(strlen(sdk_strings[desired_type]));
    version_part.consume_back(".sdk");

    llvm::VersionTuple version;
    if (version.tryParse(version_part))
      return false;
    return SDKSupportsModules(desired_type, version);
  }

  return false;
}

FileSystem::EnumerateDirectoryResult PlatformDarwin::DirectoryEnumerator(
    void *baton, llvm::sys::fs::file_type file_type, llvm::StringRef path) {
  SDKEnumeratorInfo *enumerator_info = static_cast<SDKEnumeratorInfo *>(baton);

  FileSpec spec(path);
  if (SDKSupportsModules(enumerator_info->sdk_type, spec)) {
    enumerator_info->found_path = spec;
    return FileSystem::EnumerateDirectoryResult::eEnumerateDirectoryResultNext;
  }

  return FileSystem::EnumerateDirectoryResult::eEnumerateDirectoryResultNext;
}

FileSpec PlatformDarwin::FindSDKInXcodeForModules(SDKType sdk_type,
                                                  const FileSpec &sdks_spec) {
  // Look inside Xcode for the required installed iOS SDK version

  if (!FileSystem::Instance().IsDirectory(sdks_spec)) {
    return FileSpec();
  }

  const bool find_directories = true;
  const bool find_files = false;
  const bool find_other = true; // include symlinks

  SDKEnumeratorInfo enumerator_info;

  enumerator_info.sdk_type = sdk_type;

  FileSystem::Instance().EnumerateDirectory(
      sdks_spec.GetPath(), find_directories, find_files, find_other,
      DirectoryEnumerator, &enumerator_info);

  if (FileSystem::Instance().IsDirectory(enumerator_info.found_path))
    return enumerator_info.found_path;
  else
    return FileSpec();
}

FileSpec PlatformDarwin::GetSDKDirectoryForModules(SDKType sdk_type) {
  switch (sdk_type) {
  case SDKType::MacOSX:
  case SDKType::iPhoneSimulator:
  case SDKType::iPhoneOS:
    break;
  }

  FileSpec sdks_spec = GetXcodeContentsPath();
  sdks_spec.AppendPathComponent("Developer");
  sdks_spec.AppendPathComponent("Platforms");

  switch (sdk_type) {
  case SDKType::MacOSX:
    sdks_spec.AppendPathComponent("MacOSX.platform");
    break;
  case SDKType::iPhoneSimulator:
    sdks_spec.AppendPathComponent("iPhoneSimulator.platform");
    break;
  case SDKType::iPhoneOS:
    sdks_spec.AppendPathComponent("iPhoneOS.platform");
    break;
  }

  sdks_spec.AppendPathComponent("Developer");
  sdks_spec.AppendPathComponent("SDKs");

  if (sdk_type == SDKType::MacOSX) {
    llvm::VersionTuple version = HostInfo::GetOSVersion();

    if (!version.empty()) {
      if (SDKSupportsModules(SDKType::MacOSX, version)) {
        // We slightly prefer the exact SDK for this machine.  See if it is
        // there.

        FileSpec native_sdk_spec = sdks_spec;
        StreamString native_sdk_name;
        native_sdk_name.Printf("MacOSX%u.%u.sdk", version.getMajor(),
                               version.getMinor().getValueOr(0));
        native_sdk_spec.AppendPathComponent(native_sdk_name.GetString());

        if (FileSystem::Instance().Exists(native_sdk_spec)) {
          return native_sdk_spec;
        }
      }
    }
  }

  return FindSDKInXcodeForModules(sdk_type, sdks_spec);
}

std::tuple<llvm::VersionTuple, llvm::StringRef>
PlatformDarwin::ParseVersionBuildDir(llvm::StringRef dir) {
  llvm::StringRef build;
  llvm::StringRef version_str;
  llvm::StringRef build_str;
  std::tie(version_str, build_str) = dir.split(' ');
  llvm::VersionTuple version;
  if (!version.tryParse(version_str) ||
      build_str.empty()) {
    if (build_str.consume_front("(")) {
      size_t pos = build_str.find(')');
      build = build_str.slice(0, pos);
    }
  }

  return std::make_tuple(version, build);
}

void PlatformDarwin::AddClangModuleCompilationOptionsForSDKType(
    Target *target, std::vector<std::string> &options, SDKType sdk_type) {
  const std::vector<std::string> apple_arguments = {
      "-x",       "objective-c++", "-fobjc-arc",
      "-fblocks", "-D_ISO646_H",   "-D__ISO646_H"};

  options.insert(options.end(), apple_arguments.begin(), apple_arguments.end());

  StreamString minimum_version_option;
  bool use_current_os_version = false;
  switch (sdk_type) {
  case SDKType::iPhoneOS:
#if defined(__arm__) || defined(__arm64__) || defined(__aarch64__)
    use_current_os_version = true;
#else
    use_current_os_version = false;
#endif
    break;

  case SDKType::iPhoneSimulator:
    use_current_os_version = false;
    break;

  case SDKType::MacOSX:
#if defined(__i386__) || defined(__x86_64__)
    use_current_os_version = true;
#else
    use_current_os_version = false;
#endif
    break;
  }

  llvm::VersionTuple version;
  if (use_current_os_version)
    version = GetOSVersion();
  else if (target) {
    // Our OS doesn't match our executable so we need to get the min OS version
    // from the object file
    ModuleSP exe_module_sp = target->GetExecutableModule();
    if (exe_module_sp) {
      ObjectFile *object_file = exe_module_sp->GetObjectFile();
      if (object_file)
        version = object_file->GetMinimumOSVersion();
    }
  }
  // Only add the version-min options if we got a version from somewhere
  if (!version.empty()) {
    switch (sdk_type) {
    case SDKType::iPhoneOS:
      minimum_version_option.PutCString("-mios-version-min=");
      minimum_version_option.PutCString(version.getAsString());
      break;
    case SDKType::iPhoneSimulator:
      minimum_version_option.PutCString("-mios-simulator-version-min=");
      minimum_version_option.PutCString(version.getAsString());
      break;
    case SDKType::MacOSX:
      minimum_version_option.PutCString("-mmacosx-version-min=");
      minimum_version_option.PutCString(version.getAsString());
    }
    options.push_back(minimum_version_option.GetString());
  }

  FileSpec sysroot_spec;
  // Scope for mutex locker below
  {
    std::lock_guard<std::mutex> guard(m_mutex);
    sysroot_spec = GetSDKDirectoryForModules(sdk_type);
  }

  if (FileSystem::Instance().IsDirectory(sysroot_spec.GetPath())) {
    options.push_back("-isysroot");
    options.push_back(sysroot_spec.GetPath());
  }
}

ConstString PlatformDarwin::GetFullNameForDylib(ConstString basename) {
  if (basename.IsEmpty())
    return basename;

  StreamString stream;
  stream.Printf("lib%s.dylib", basename.GetCString());
  return ConstString(stream.GetString());
}

llvm::VersionTuple PlatformDarwin::GetOSVersion(Process *process) {
  if (process && strstr(GetPluginName().GetCString(), "-simulator")) {
    lldb_private::ProcessInstanceInfo proc_info;
    if (Host::GetProcessInfo(process->GetID(), proc_info)) {
      const Environment &env = proc_info.GetEnvironment();

      llvm::VersionTuple result;
      if (!result.tryParse(env.lookup("SIMULATOR_RUNTIME_VERSION")))
        return result;

      std::string dyld_root_path = env.lookup("DYLD_ROOT_PATH");
      if (!dyld_root_path.empty()) {
        dyld_root_path += "/System/Library/CoreServices/SystemVersion.plist";
        ApplePropertyList system_version_plist(dyld_root_path.c_str());
        std::string product_version;
        if (system_version_plist.GetValueAsString("ProductVersion",
                                                  product_version)) {
          if (!result.tryParse(product_version))
            return result;
        }
      }
    }
    // For simulator platforms, do NOT call back through
    // Platform::GetOSVersion() as it might call Process::GetHostOSVersion()
    // which we don't want as it will be incorrect
    return llvm::VersionTuple();
  }

  return Platform::GetOSVersion(process);
}

lldb_private::FileSpec PlatformDarwin::LocateExecutable(const char *basename) {
  // A collection of SBFileSpec whose SBFileSpec.m_directory members are filled
  // in with
  // any executable directories that should be searched.
  static std::vector<FileSpec> g_executable_dirs;

  // Find the global list of directories that we will search for executables
  // once so we don't keep doing the work over and over.
  static llvm::once_flag g_once_flag;
  llvm::call_once(g_once_flag, []() {

    // When locating executables, trust the DEVELOPER_DIR first if it is set
    FileSpec xcode_contents_dir = GetXcodeContentsPath();
    if (xcode_contents_dir) {
      FileSpec xcode_lldb_resources = xcode_contents_dir;
      xcode_lldb_resources.AppendPathComponent("SharedFrameworks");
      xcode_lldb_resources.AppendPathComponent("LLDB.framework");
      xcode_lldb_resources.AppendPathComponent("Resources");
      if (FileSystem::Instance().Exists(xcode_lldb_resources)) {
        FileSpec dir;
        dir.GetDirectory().SetCString(xcode_lldb_resources.GetPath().c_str());
        g_executable_dirs.push_back(dir);
      }
    }
  });

  // Now search the global list of executable directories for the executable we
  // are looking for
  for (const auto &executable_dir : g_executable_dirs) {
    FileSpec executable_file;
    executable_file.GetDirectory() = executable_dir.GetDirectory();
    executable_file.GetFilename().SetCString(basename);
    if (FileSystem::Instance().Exists(executable_file))
      return executable_file;
  }

  return FileSpec();
}

lldb_private::Status
PlatformDarwin::LaunchProcess(lldb_private::ProcessLaunchInfo &launch_info) {
  // Starting in Fall 2016 OSes, NSLog messages only get mirrored to stderr if
  // the OS_ACTIVITY_DT_MODE environment variable is set.  (It doesn't require
  // any specific value; rather, it just needs to exist). We will set it here
  // as long as the IDE_DISABLED_OS_ACTIVITY_DT_MODE flag is not set.  Xcode
  // makes use of IDE_DISABLED_OS_ACTIVITY_DT_MODE to tell
  // LLDB *not* to muck with the OS_ACTIVITY_DT_MODE flag when they
  // specifically want it unset.
  const char *disable_env_var = "IDE_DISABLED_OS_ACTIVITY_DT_MODE";
  auto &env_vars = launch_info.GetEnvironment();
  if (!env_vars.count(disable_env_var)) {
    // We want to make sure that OS_ACTIVITY_DT_MODE is set so that we get
    // os_log and NSLog messages mirrored to the target process stderr.
    env_vars.try_emplace("OS_ACTIVITY_DT_MODE", "enable");
  }

  // Let our parent class do the real launching.
  return PlatformPOSIX::LaunchProcess(launch_info);
}

lldb_private::Status
PlatformDarwin::FindBundleBinaryInExecSearchPaths (const ModuleSpec &module_spec, Process *process, 
                                                   ModuleSP &module_sp, 
                                                   const FileSpecList *module_search_paths_ptr, 
                                                   ModuleSP *old_module_sp_ptr, bool *did_create_ptr)
{
  const FileSpec &platform_file = module_spec.GetFileSpec();
  // See if the file is present in any of the module_search_paths_ptr
  // directories.
  if (!module_sp && module_search_paths_ptr && platform_file) {
    // create a vector of all the file / directory names in platform_file e.g.
    // this might be
    // /System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation
    //
    // We'll need to look in the module_search_paths_ptr directories for both
    // "UIFoundation" and "UIFoundation.framework" -- most likely the latter
    // will be the one we find there.

    FileSpec platform_pull_upart(platform_file);
    std::vector<std::string> path_parts;
    path_parts.push_back(
        platform_pull_upart.GetLastPathComponent().AsCString());
    while (platform_pull_upart.RemoveLastPathComponent()) {
      ConstString part = platform_pull_upart.GetLastPathComponent();
      path_parts.push_back(part.AsCString());
    }
    const size_t path_parts_size = path_parts.size();

    size_t num_module_search_paths = module_search_paths_ptr->GetSize();
    for (size_t i = 0; i < num_module_search_paths; ++i) {
      Log *log_verbose = lldb_private::GetLogIfAllCategoriesSet(LIBLLDB_LOG_HOST);
      LLDB_LOGF(
          log_verbose,
          "PlatformRemoteDarwinDevice::GetSharedModule searching for binary in "
          "search-path %s",
          module_search_paths_ptr->GetFileSpecAtIndex(i).GetPath().c_str());
      // Create a new FileSpec with this module_search_paths_ptr plus just the
      // filename ("UIFoundation"), then the parent dir plus filename
      // ("UIFoundation.framework/UIFoundation") etc - up to four names (to
      // handle "Foo.framework/Contents/MacOS/Foo")

      for (size_t j = 0; j < 4 && j < path_parts_size - 1; ++j) {
        FileSpec path_to_try(module_search_paths_ptr->GetFileSpecAtIndex(i));

        // Add the components backwards.  For
        // .../PrivateFrameworks/UIFoundation.framework/UIFoundation path_parts
        // is
        //   [0] UIFoundation
        //   [1] UIFoundation.framework
        //   [2] PrivateFrameworks
        //
        // and if 'j' is 2, we want to append path_parts[1] and then
        // path_parts[0], aka 'UIFoundation.framework/UIFoundation', to the
        // module_search_paths_ptr path.

        for (int k = j; k >= 0; --k) {
          path_to_try.AppendPathComponent(path_parts[k]);
        }

        if (FileSystem::Instance().Exists(path_to_try)) {
          ModuleSpec new_module_spec(module_spec);
          new_module_spec.GetFileSpec() = path_to_try;
          Status new_error(Platform::GetSharedModule(
              new_module_spec, process, module_sp, nullptr, old_module_sp_ptr,
              did_create_ptr));

          if (module_sp) {
            module_sp->SetPlatformFileSpec(path_to_try);
            return new_error;
          }
        }
      }
    }
  }
  return Status();
}
