; ModuleID = 'pathfinder.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.StatsStruct = type { %struct.IntVectorStruct*, i32, i32, double, double, i32* }
%struct.IntVectorStruct = type { i32, i32, i32* }
%struct.BitfieldStruct = type { i32, i8* }
%struct.NodeStruct = type { i32, i32, i8*, i32, i32, %struct.NodeStruct*, %struct.NodeListStruct*, %struct.EdgeListStruct*, i32, i32 }
%struct.NodeListStruct = type { %struct.NodeStruct*, %struct.NodeListStruct* }
%struct.EdgeListStruct = type { i32, %struct.NodeStruct*, %struct.EdgeListStruct* }
%struct.SearchOptionsStruct = type { i32, i8, i8, i8, i8*, i32 }
%struct.ConfigurationStruct = type { %struct.GraphStruct**, i8***, %struct.SearchOptionsStruct*, i32 }
%struct.GraphStruct = type { i8*, i32, %struct.NodeListStruct*, %struct.EdgeReferencesStruct*, %struct.SystemCallMapStruct* }
%struct.EdgeReferencesStruct = type { %struct.NodeStruct*, %struct.EdgeReferencesStruct* }
%struct.SystemCallMapStruct = type { i32, i32, %struct.SystemCallMapElementStruct** }
%struct.SystemCallMapElementStruct = type { i8*, i32, %struct.NodePtrVecStruct* }
%struct.NodePtrVecStruct = type { i32, i32, %struct.NodeStruct** }
%struct.NodeVecVecStruct = type { i32, i32, %struct.NodePtrVecStruct** }
%struct.CharVectorStruct = type { i32, i32, i8* }
%struct.HistogramElementStruct = type { i32, i32, %struct.HistogramElementStruct* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Functions: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Basic blocks: %d\0A\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"0 \0A\00", align 1
@.str.6 = private unnamed_addr constant [62 x i8] c"-------------------------------------------- \0ASYSTEM CALLS \0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"%d %s \0A\00", align 1
@__const.main.defaultFile = private unnamed_addr constant [23 x i8] c"MicroTestData.adj_list\00", align 16
@.str.9 = private unnamed_addr constant [633 x i8] c"\0A\0A        PathFinder: finding a series of labeled nodes within a\0A                two-layer directed, cyclic graph.\0A               Copyright (2013) Sandia Corporation\0A\0A Sandia National Laboratories is a multi-program laboratory managed and\0A operated by Sandia Corporation, a wholly owned subsidiary of Lockheed\0A Martin Corporation, for the U.S. Department of Energy's National Nuclear\0A Security Administration under terms of Contract DE-AC04-94AL85000,\0A there is a non-exclusive license for use of this work by or on behalf\0A of the U.S. Government. Export of this program may require a license \0A from the United States Government.\0A\0A\0A\00", align 1
@.str.1.10 = private unnamed_addr constant [68 x i8] c"Error: Could not allocation configuration structure.\0A\0A\09---Exiting\0A\0A\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"c:i:x:o:q:huy\00", align 1
@optopt = external dso_local global i32, align 4
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.3.12 = private unnamed_addr constant [38 x i8] c"\09Please specify configuration file.\0A\0A\00", align 1
@.str.4.13 = private unnamed_addr constant [29 x i8] c"\09Please specify data file.\0A\0A\00", align 1
@.str.5.14 = private unnamed_addr constant [42 x i8] c"\09Please specify output graph data file.\0A\0A\00", align 1
@.str.6.15 = private unnamed_addr constant [58 x i8] c"\09Please specify recursion depth to keep spawning tasks.\0A\0A\00", align 1
@.str.7.16 = private unnamed_addr constant [6 x i8] c"\0A%s\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [625 x i8] c"\0AUsage: PathFinder.exe [OPTIONS] [<fileName>]\0A\0A  Operation:\0A    -c  <config file>   use configuration file\0A    -i  <data file>     interactive search of specified data file\0A    -x  <data file>     exhaustive leg search (any label to any label) of data file\0A\0A  Other:\0A    -o  <output file>   save optimized graph to file\0A    -h,u                prints this help message.\0A    -q  <depth>         use qthread parallelism (config file only). The depth value\0A                        specifies how deep in recursion to continue spawning new tasks\0A                        during searches\0A    -y                  create YAML output\0A\00", align 1
@optarg = external dso_local global i8*, align 8
@.str.9.17 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"Command\00", align 1
@.str.11 = private unnamed_addr constant [76 x i8] c"-c -i and -x are mutually exclusive, PathFinder can only do one of those.\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [74 x i8] c"-c (config file) -i (interactive) or -x (exhaustive) must be specified.\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [80 x i8] c"-o (optimized graph output) is only compatible with -x (exhaustive searches).\0A\0A\00", align 1
@__const.runInteractively.fullIntSignature = private unnamed_addr constant [3 x i32] [i32 0, i32 0, i32 -1], align 4
@.str.17 = private unnamed_addr constant [82 x i8] c"\0APlease insert a node label for this signature (\22\22 to complete, \22bail\22 to exit):\0A\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"bail\00", align 1
@.str.19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.20 = private unnamed_addr constant [13 x i8] c"\0ASignature: \00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"'%s'\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c" -> \00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.24 = private unnamed_addr constant [37 x i8] c"Found, resultant path has %d steps.\0A\00", align 1
@.str.25 = private unnamed_addr constant [33 x i8] c"\0A\09Path not found for signature.\0A\00", align 1
@.str.14 = private unnamed_addr constant [47 x i8] c"Error: No config file entered.\0A\0A\09---Exiting---\00", align 1
@.str.15 = private unnamed_addr constant [40 x i8] c"\0A\0AOverall Parse Time: %02d:%02d:%02.3f\0A\00", align 1
@.str.16 = private unnamed_addr constant [22 x i8] c"\0A\0ASearches complete.\0A\00", align 1
@.str.26 = private unnamed_addr constant [24 x i8] c"\0A\0ATotal %d legs found\0A\0A\00", align 1
@.str.28 = private unnamed_addr constant [70 x i8] c"Specified entrance edge length does not match data size for node: %d\0A\00", align 1
@.str.1.29 = private unnamed_addr constant [61 x i8] c"Specified edge length does not match data size for node: %d\0A\00", align 1
@.str.2.30 = private unnamed_addr constant [64 x i8] c"resolveNodeEdges: Outer node %d edge to non-contained node: %d\0A\00", align 1
@.str.4.31 = private unnamed_addr constant [9 x i8] c"interior\00", align 1
@.str.5.32 = private unnamed_addr constant [9 x i8] c"entrance\00", align 1
@.str.3.33 = private unnamed_addr constant [22 x i8] c"\09%d is type: %s (%d)\0A\00", align 1
@.str.6.34 = private unnamed_addr constant [74 x i8] c"resolveNodeEdges: Outer node %d has edge reference to undefined node: %d\0A\00", align 1
@.str.7.35 = private unnamed_addr constant [77 x i8] c"resolveNodeEdges: Interior node %d has edge reference to undefined node: %d\0A\00", align 1
@.str.8.38 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.9.39 = private unnamed_addr constant [52 x i8] c"Could not open data file: %s (parsing.c:parseFile)\0A\00", align 1
@.str.10.40 = private unnamed_addr constant [11 x i8] c"Functions:\00", align 1
@.str.11.41 = private unnamed_addr constant [25 x i8] c"\09%d functions specified\0A\00", align 1
@.str.12.42 = private unnamed_addr constant [10 x i8] c"Functions\00", align 1
@.str.13.43 = private unnamed_addr constant [60 x i8] c"Malformed file, Function count not specified in first line\0A\00", align 1
@.str.14.44 = private unnamed_addr constant [14 x i8] c"Basic blocks:\00", align 1
@.str.15.45 = private unnamed_addr constant [28 x i8] c"\09%d basic blocks specified\0A\00", align 1
@.str.16.46 = private unnamed_addr constant [13 x i8] c"Basic Blocks\00", align 1
@.str.17.47 = private unnamed_addr constant [11 x i8] c"----------\00", align 1
@.str.18.48 = private unnamed_addr constant [13 x i8] c"SYSTEM CALLS\00", align 1
@.str.19.49 = private unnamed_addr constant [56 x i8] c"Error in parseFile: Node %d undefined as an outer node\0A\00", align 1
@.str.20.50 = private unnamed_addr constant [36 x i8] c"\09%d total System Call Map elements\0A\00", align 1
@.str.21.51 = private unnamed_addr constant [13 x i8] c"System Calls\00", align 1
@.str.22.52 = private unnamed_addr constant [23 x i8] c"\09...parsing complete.\0A\00", align 1
@.str.23.55 = private unnamed_addr constant [19 x i8] c"Could not open %s\0A\00", align 1
@.str.24.56 = private unnamed_addr constant [12 x i8] c"Opened %s\0A\0A\00", align 1
@.str.25.57 = private unnamed_addr constant [25 x i8] c"Pathfinder Configuration\00", align 1
@.str.26.58 = private unnamed_addr constant [69 x i8] c"Error in config file: doesn't start with \22Pathfinder Configuration\22\0A\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"files\00", align 1
@.str.28.59 = private unnamed_addr constant [53 x i8] c"Error in config file: second line is not file count\0A\00", align 1
@.str.29 = private unnamed_addr constant [29 x i8] c"No files to parse, exiting.\0A\00", align 1
@.str.30 = private unnamed_addr constant [11 x i8] c"signatures\00", align 1
@.str.31 = private unnamed_addr constant [57 x i8] c"Error in config file: third line is not signature count\0A\00", align 1
@.str.32 = private unnamed_addr constant [35 x i8] c"No signatures to search, exiting.\0A\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"search type\00", align 1
@.str.34 = private unnamed_addr constant [5 x i8] c"tree\00", align 1
@.str.35 = private unnamed_addr constant [43 x i8] c"Could not allocate graph storage. Exiting\0A\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"file \00", align 1
@.str.37 = private unnamed_addr constant [46 x i8] c"Error in config file: mismatch of file count\0A\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"Error parsing %s\00", align 1
@.str.39 = private unnamed_addr constant [47 x i8] c"Could not allocate signature storage. Exiting\0A\00", align 1
@.str.40 = private unnamed_addr constant [11 x i8] c"signature \00", align 1
@.str.41 = private unnamed_addr constant [51 x i8] c"Error in config file: mismatch of signature count\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.64 = private unnamed_addr constant [41 x i8] c"\0A\0AOverall Search Time: %02d:02%d:%05.2f\0A\00", align 1
@.str.8.65 = private unnamed_addr constant [18 x i8] c"CrashAndBURN!!!\0A\0A\00", align 1
@globalStats = internal global %struct.StatsStruct* null, align 8
@.str.1.68 = private unnamed_addr constant [29 x i8] c"Immediately before parallel\0A\00", align 1
@__const.findAllPossibleLegs.fullIntSignature = private unnamed_addr constant [3 x i32] [i32 0, i32 0, i32 -1], align 4
@.str.2.69 = private unnamed_addr constant [58 x i8] c"\0A\0A%d found out of %d searches. Overall Time: %d:%d:%2.3f\0A\00", align 1
@.str.3.70 = private unnamed_addr constant [17 x i8] c"%02d:%02d:%02.3f\00", align 1
@.str.4.71 = private unnamed_addr constant [17 x i8] c"Signatures Found\00", align 1
@.str.5.72 = private unnamed_addr constant [12 x i8] c"Search Time\00", align 1
@.str.6.75 = private unnamed_addr constant [33 x i8] c"Immediately before nested for's\0A\00", align 1
@__const.findAndLogAllPossibleLegs.fullIntSignature = private unnamed_addr constant [3 x i32] [i32 0, i32 0, i32 -1], align 4
@.str.7.76 = private unnamed_addr constant [55 x i8] c"\0A\0A%d found for %d searches. Overall Time: %d:%d:%2.3f\0A\00", align 1
@.str.9.77 = private unnamed_addr constant [91 x i8] c"\0AThis graph has %f average nodes between labels.\0AStandard deviation: %f, total paths: %d\0A\0A\00", align 1
@.str.10.78 = private unnamed_addr constant [38 x i8] c"\09Shortest Path: %d, Longest Path: %d\0A\00", align 1
@.str.11.79 = private unnamed_addr constant [30 x i8] c"\09length %d appeared %d times\0A\00", align 1
@.str.84 = private unnamed_addr constant [52 x i8] c"Bummer. outerIdx: %d, innerIdx: %d, node count: %d\0A\00", align 1
@.str.93 = private unnamed_addr constant [21 x i8] c"avg: %f\0Astd dev: %f\0A\00", align 1
@.str.1.94 = private unnamed_addr constant [12 x i8] c"Histogram:\0A\00", align 1
@.str.2.95 = private unnamed_addr constant [30 x i8] c"\09length %d appeared %d times\0A\00", align 1
@.str.102 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.1.103 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.2.104 = private unnamed_addr constant [5 x i8] c" %d,\00", align 1
@.str.3.105 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4.106 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5.107 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.6.108 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8.109 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.7.110 = private unnamed_addr constant [41 x i8] c"Outer Node: %d, idx: %d, label: %s (%d)\0A\00", align 1
@.str.9.111 = private unnamed_addr constant [6 x i8] c"Edges\00", align 1
@.str.10.112 = private unnamed_addr constant [17 x i8] c"\09Inner Node: %d\0A\00", align 1
@.str.11.113 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.12.114 = private unnamed_addr constant [8 x i8] c"'%s'\0A\09:\00", align 1
@.str.13.115 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.14.116 = private unnamed_addr constant [36 x i8] c"\09%d total System Call Map elements\0A\00", align 1
@.str.15.117 = private unnamed_addr constant [5 x i8] c"(%s)\00", align 1
@.str.16.118 = private unnamed_addr constant [4 x i8] c" : \00", align 1
@.str.125 = private unnamed_addr constant [48 x i8] c"\0A\0AIntVector_insertEnd failed realloc size = %d\0A\00", align 1
@.str.1.136 = private unnamed_addr constant [39 x i8] c"Malloc failure in NodePtrVec creation\0A\00", align 1
@.str.2.137 = private unnamed_addr constant [47 x i8] c"Malloc failure in NodePtrVec storage creation\0A\00", align 1
@.str.3.142 = private unnamed_addr constant [46 x i8] c"\0A\0ANodePtrVec_push failed malloc(%d). Node: %d\00", align 1
@.str.4.143 = private unnamed_addr constant [13 x i8] c", label: %s\0A\00", align 1
@.str.5.144 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.6.151 = private unnamed_addr constant [47 x i8] c"Malloc failure in NodeVecVec storage creation\0A\00", align 1
@.str.7.152 = private unnamed_addr constant [39 x i8] c"Malloc failure in NodeVecVec creation\0A\00", align 1
@.str.8.155 = private unnamed_addr constant [33 x i8] c"\0A\0ANodeVecVec_push failed malloc\0A\00", align 1
@output = internal global %struct._IO_FILE* null, align 8
@.str.158 = private unnamed_addr constant [34 x i8] c"PathFinder_%d-%d-%d_%d-%d-%d.yaml\00", align 1
@.str.1.159 = private unnamed_addr constant [19 x i8] c"%d/%d/%d, %d:%d:%d\00", align 1
@.str.2.160 = private unnamed_addr constant [20 x i8] c"\0AWriting YAML: %s\0A\0A\00", align 1
@.str.3.161 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4.162 = private unnamed_addr constant [22 x i8] c"Mini-Application Name\00", align 1
@.str.5.163 = private unnamed_addr constant [11 x i8] c"PathFinder\00", align 1
@.str.6.166 = private unnamed_addr constant [25 x i8] c"Mini-Application Version\00", align 1
@.str.7.167 = private unnamed_addr constant [6 x i8] c"1.0.0\00", align 1
@.str.8.168 = private unnamed_addr constant [14 x i8] c"Run Date/Time\00", align 1
@.str.9.169 = private unnamed_addr constant [17 x i8] c"Compiler Version\00", align 1
@.str.10.170 = private unnamed_addr constant [8 x i8] c"unknown\00", align 1
@.str.11.171 = private unnamed_addr constant [15 x i8] c"Compiler Flags\00", align 1
@.str.12.172 = private unnamed_addr constant [4 x i8] c"MPI\00", align 1
@.str.13.173 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str.14.174 = private unnamed_addr constant [7 x i8] c"OpenMP\00", align 1
@.str.15.175 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str.16.180 = private unnamed_addr constant [8 x i8] c"%s: %i\0A\00", align 1
@.str.17.181 = private unnamed_addr constant [9 x i8] c"%s: %lf\0A\00", align 1
@.str.18.182 = private unnamed_addr constant [8 x i8] c"%s: %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.BitfieldStruct* @Bitfield_new(i32 %bitsNeeded) #0 {
entry:
  %retval = alloca %struct.BitfieldStruct*, align 8
  %bitsNeeded.addr = alloca i32, align 4
  %size = alloca i32, align 4
  %new = alloca %struct.BitfieldStruct*, align 8
  store i32 %bitsNeeded, i32* %bitsNeeded.addr, align 4
  %0 = load i32, i32* %bitsNeeded.addr, align 4
  %add = add nsw i32 %0, 7
  %div = sdiv i32 %add, 8
  store i32 %div, i32* %size, align 4
  %call = call noalias i8* @malloc(i64 16) #7
  %1 = bitcast i8* %call to %struct.BitfieldStruct*
  store %struct.BitfieldStruct* %1, %struct.BitfieldStruct** %new, align 8
  %2 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %tobool = icmp ne %struct.BitfieldStruct* %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %size, align 4
  %conv = sext i32 %3 to i64
  %call1 = call noalias i8* @calloc(i64 %conv, i64 1) #7
  %4 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %bitfield = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %4, i32 0, i32 1
  store i8* %call1, i8** %bitfield, align 8
  %5 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %bitfield2 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %5, i32 0, i32 1
  %6 = load i8*, i8** %bitfield2, align 8
  %tobool3 = icmp ne i8* %6, null
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  %7 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %8 = bitcast %struct.BitfieldStruct* %7 to i8*
  call void @free(i8* %8) #7
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.end
  %9 = load i32, i32* %bitsNeeded.addr, align 4
  %10 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %bitsNeeded6 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %10, i32 0, i32 0
  store i32 %9, i32* %bitsNeeded6, align 8
  %11 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  store %struct.BitfieldStruct* %11, %struct.BitfieldStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %12 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %retval, align 8
  ret %struct.BitfieldStruct* %12
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Bitfield_delete(%struct.BitfieldStruct* %this) #0 {
entry:
  %this.addr = alloca %struct.BitfieldStruct*, align 8
  store %struct.BitfieldStruct* %this, %struct.BitfieldStruct** %this.addr, align 8
  %0 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %tobool = icmp ne %struct.BitfieldStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitfield = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %1, i32 0, i32 1
  %2 = load i8*, i8** %bitfield, align 8
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitfield3 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %3, i32 0, i32 1
  %4 = load i8*, i8** %bitfield3, align 8
  call void @free(i8* %4) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %6 = bitcast %struct.BitfieldStruct* %5 to i8*
  call void @free(i8* %6) #7
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @Bitfield_nodeVisited(%struct.BitfieldStruct* %this, %struct.NodeStruct* %node) #0 {
entry:
  %this.addr = alloca %struct.BitfieldStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %index = alloca i32, align 4
  %byte = alloca i8, align 1
  %bit = alloca i8, align 1
  %set = alloca i8, align 1
  store %struct.BitfieldStruct* %this, %struct.BitfieldStruct** %this.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %nodeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %0, i32 0, i32 1
  %1 = load i32, i32* %nodeCount, align 4
  %shr = ashr i32 %1, 3
  store i32 %shr, i32* %index, align 4
  %2 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitfield = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %2, i32 0, i32 1
  %3 = load i8*, i8** %bitfield, align 8
  %4 = load i32, i32* %index, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom
  %5 = load i8, i8* %arrayidx, align 1
  store i8 %5, i8* %byte, align 1
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %nodeCount1 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %6, i32 0, i32 1
  %7 = load i32, i32* %nodeCount1, align 4
  %and = and i32 %7, 7
  %shl = shl i32 1, %and
  %conv = trunc i32 %shl to i8
  store i8 %conv, i8* %bit, align 1
  %8 = load i8, i8* %byte, align 1
  %conv2 = sext i8 %8 to i32
  %9 = load i8, i8* %bit, align 1
  %conv3 = sext i8 %9 to i32
  %and4 = and i32 %conv2, %conv3
  %tobool = icmp ne i32 %and4, 0
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %set, align 1
  %10 = load i8, i8* %bit, align 1
  %conv5 = sext i8 %10 to i32
  %11 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitfield6 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %11, i32 0, i32 1
  %12 = load i8*, i8** %bitfield6, align 8
  %13 = load i32, i32* %index, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 %idxprom7
  %14 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %14 to i32
  %or = or i32 %conv9, %conv5
  %conv10 = trunc i32 %or to i8
  store i8 %conv10, i8* %arrayidx8, align 1
  %15 = load i8, i8* %set, align 1
  %tobool11 = trunc i8 %15 to i1
  ret i1 %tobool11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.BitfieldStruct* @Bitfield_copy(%struct.BitfieldStruct* %from) #0 {
entry:
  %retval = alloca %struct.BitfieldStruct*, align 8
  %from.addr = alloca %struct.BitfieldStruct*, align 8
  %i = alloca i32, align 4
  %new = alloca %struct.BitfieldStruct*, align 8
  store %struct.BitfieldStruct* %from, %struct.BitfieldStruct** %from.addr, align 8
  %0 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %from.addr, align 8
  %tobool = icmp ne %struct.BitfieldStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %from.addr, align 8
  %bitsNeeded = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %bitsNeeded, align 8
  %call = call %struct.BitfieldStruct* @Bitfield_new(i32 %2)
  store %struct.BitfieldStruct* %call, %struct.BitfieldStruct** %new, align 8
  %3 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %tobool1 = icmp ne %struct.BitfieldStruct* %3, null
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %4 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %4, 8
  %5 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %from.addr, align 8
  %bitsNeeded3 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %5, i32 0, i32 0
  %6 = load i32, i32* %bitsNeeded3, align 8
  %cmp = icmp slt i32 %mul, %6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %from.addr, align 8
  %bitfield = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %7, i32 0, i32 1
  %8 = load i8*, i8** %bitfield, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %idxprom
  %10 = load i8, i8* %arrayidx, align 1
  %11 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  %bitfield4 = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %11, i32 0, i32 1
  %12 = load i8*, i8** %bitfield4, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %12, i64 %idxprom5
  store i8 %10, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %new, align 8
  store %struct.BitfieldStruct* %15, %struct.BitfieldStruct** %retval, align 8
  br label %return

if.else:                                          ; preds = %if.end
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %for.end, %if.then
  %16 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %retval, align 8
  ret %struct.BitfieldStruct* %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Bitfield_clear(%struct.BitfieldStruct* %this) #0 {
entry:
  %this.addr = alloca %struct.BitfieldStruct*, align 8
  %size = alloca i32, align 4
  store %struct.BitfieldStruct* %this, %struct.BitfieldStruct** %this.addr, align 8
  %0 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitsNeeded = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %0, i32 0, i32 0
  %1 = load i32, i32* %bitsNeeded, align 8
  %add = add nsw i32 %1, 7
  %div = sdiv i32 %add, 8
  store i32 %div, i32* %size, align 4
  %2 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %this.addr, align 8
  %bitfield = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %2, i32 0, i32 1
  %3 = load i8*, i8** %bitfield, align 8
  %4 = load i32, i32* %size, align 4
  %conv = sext i32 %4 to i64
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 0, i64 %conv, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.SearchOptionsStruct* @SearchOptions_new() #0 {
entry:
  %retval = alloca %struct.SearchOptionsStruct*, align 8
  %options = alloca %struct.SearchOptionsStruct*, align 8
  %call = call noalias i8* @malloc(i64 24) #7
  %0 = bitcast i8* %call to %struct.SearchOptionsStruct*
  store %struct.SearchOptionsStruct* %0, %struct.SearchOptionsStruct** %options, align 8
  %1 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %tobool = icmp ne %struct.SearchOptionsStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.SearchOptionsStruct* null, %struct.SearchOptionsStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %searchType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %2, i32 0, i32 0
  store i32 0, i32* %searchType, align 8
  %3 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %multiThreaded = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %3, i32 0, i32 1
  store i8 0, i8* %multiThreaded, align 4
  %4 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %doStatistics = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %4, i32 0, i32 2
  store i8 0, i8* %doStatistics, align 1
  %5 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %writeOutputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %5, i32 0, i32 3
  store i8 0, i8* %writeOutputFile, align 2
  %6 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %outputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %6, i32 0, i32 4
  store i8* null, i8** %outputFile, align 8
  %7 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %buildType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %7, i32 0, i32 5
  store i32 0, i32* %buildType, align 8
  %8 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  store %struct.SearchOptionsStruct* %8, %struct.SearchOptionsStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %retval, align 8
  ret %struct.SearchOptionsStruct* %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.ConfigurationStruct* @Configuration_new() #0 {
entry:
  %retval = alloca %struct.ConfigurationStruct*, align 8
  %new = alloca %struct.ConfigurationStruct*, align 8
  %options = alloca %struct.SearchOptionsStruct*, align 8
  %call = call noalias i8* @malloc(i64 32) #7
  %0 = bitcast i8* %call to %struct.ConfigurationStruct*
  store %struct.ConfigurationStruct* %0, %struct.ConfigurationStruct** %new, align 8
  %call1 = call %struct.SearchOptionsStruct* @SearchOptions_new()
  store %struct.SearchOptionsStruct* %call1, %struct.SearchOptionsStruct** %options, align 8
  %1 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %tobool = icmp ne %struct.ConfigurationStruct* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %tobool2 = icmp ne %struct.SearchOptionsStruct* %2, null
  br i1 %tobool2, label %if.end8, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %tobool3 = icmp ne %struct.ConfigurationStruct* %3, null
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %4 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %5 = bitcast %struct.ConfigurationStruct* %4 to i8*
  call void @free(i8* %5) #7
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %6 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %tobool5 = icmp ne %struct.SearchOptionsStruct* %6, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %7 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %8 = bitcast %struct.SearchOptionsStruct* %7 to i8*
  call void @free(i8* %8) #7
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  store %struct.ConfigurationStruct* null, %struct.ConfigurationStruct** %retval, align 8
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  %9 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %graphs = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %9, i32 0, i32 0
  store %struct.GraphStruct** null, %struct.GraphStruct*** %graphs, align 8
  %10 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %signatures = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %10, i32 0, i32 1
  store i8*** null, i8**** %signatures, align 8
  %11 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options, align 8
  %12 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %12, i32 0, i32 2
  store %struct.SearchOptionsStruct* %11, %struct.SearchOptionsStruct** %searchOptions, align 8
  %13 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  %qThreadCount = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %13, i32 0, i32 3
  store i32 0, i32* %qThreadCount, align 8
  %14 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %new, align 8
  store %struct.ConfigurationStruct* %14, %struct.ConfigurationStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.end7
  %15 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %retval, align 8
  ret %struct.ConfigurationStruct* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @currentTime() #0 {
entry:
  ret double 0.000000e+00
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.GraphStruct* @buildGraphFromPaths(%struct.NodeVecVecStruct** %pathList, i32 %build) #0 {
entry:
  %retval = alloca %struct.GraphStruct*, align 8
  %pathList.addr = alloca %struct.NodeVecVecStruct**, align 8
  %build.addr = alloca i32, align 4
  %newGraph = alloca %struct.GraphStruct*, align 8
  %pathNode = alloca %struct.NodeStruct*, align 8
  %currentNode = alloca %struct.NodeStruct*, align 8
  %nextNode = alloca %struct.NodeStruct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store %struct.NodeVecVecStruct** %pathList, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  store i32 %build, i32* %build.addr, align 4
  %call = call %struct.GraphStruct* (...) bitcast (%struct.GraphStruct* ()* @Graph_new to %struct.GraphStruct* (...)*)()
  store %struct.GraphStruct* %call, %struct.GraphStruct** %newGraph, align 8
  %0 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %tobool = icmp ne %struct.NodeVecVecStruct** %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %tobool1 = icmp ne %struct.GraphStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc64, %if.end
  %2 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %2, i64 %idxprom
  %4 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx, align 8
  %tobool2 = icmp ne %struct.NodeVecVecStruct* %4, null
  br i1 %tobool2, label %for.body, label %for.end66

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc61, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %6, i64 %idxprom4
  %8 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx5, align 8
  %contentSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %8, i32 0, i32 0
  %9 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %5, %9
  br i1 %cmp, label %for.body6, label %for.end63

for.body6:                                        ; preds = %for.cond3
  %10 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %10, i64 %idxprom7
  %12 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx8, align 8
  %vector = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %12, i32 0, i32 2
  %13 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector, align 8
  %14 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %13, i64 %idxprom9
  %15 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx10, align 8
  %vector11 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %15, i32 0, i32 2
  %16 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector11, align 8
  %arrayidx12 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %16, i64 0
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx12, align 8
  store %struct.NodeStruct* %17, %struct.NodeStruct** %pathNode, align 8
  %18 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %pathNode, align 8
  %call13 = call %struct.NodeStruct* @getDuplicateNodeForGraph(%struct.GraphStruct* %18, %struct.NodeStruct* %19)
  store %struct.NodeStruct* %call13, %struct.NodeStruct** %currentNode, align 8
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %currentNode, align 8
  %tobool14 = icmp ne %struct.NodeStruct* %20, null
  br i1 %tobool14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %for.body6
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end16:                                         ; preds = %for.body6
  store i32 1, i32* %k, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc, %if.end16
  %21 = load i32, i32* %k, align 4
  %22 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %23 to i64
  %arrayidx19 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %22, i64 %idxprom18
  %24 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx19, align 8
  %vector20 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %24, i32 0, i32 2
  %25 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector20, align 8
  %26 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %26 to i64
  %arrayidx22 = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %25, i64 %idxprom21
  %27 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx22, align 8
  %contentSize23 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %27, i32 0, i32 0
  %28 = load i32, i32* %contentSize23, align 8
  %cmp24 = icmp slt i32 %21, %28
  br i1 %cmp24, label %for.body25, label %for.end

for.body25:                                       ; preds = %for.cond17
  %29 = load i32, i32* %build.addr, align 4
  %cmp26 = icmp eq i32 %29, 0
  br i1 %cmp26, label %if.then27, label %if.else

if.then27:                                        ; preds = %for.body25
  %30 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom28 = sext i32 %31 to i64
  %arrayidx29 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %30, i64 %idxprom28
  %32 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx29, align 8
  %vector30 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %32, i32 0, i32 2
  %33 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector30, align 8
  %34 = load i32, i32* %j, align 4
  %idxprom31 = sext i32 %34 to i64
  %arrayidx32 = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %33, i64 %idxprom31
  %35 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx32, align 8
  %contentSize33 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %35, i32 0, i32 0
  %36 = load i32, i32* %contentSize33, align 8
  %sub = sub nsw i32 %36, 1
  store i32 %sub, i32* %k, align 4
  br label %if.end46

if.else:                                          ; preds = %for.body25
  %37 = load i32, i32* %build.addr, align 4
  %cmp34 = icmp eq i32 %37, 1
  br i1 %cmp34, label %if.then35, label %if.end45

if.then35:                                        ; preds = %if.else
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then35
  %38 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %39 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %39 to i64
  %arrayidx37 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %38, i64 %idxprom36
  %40 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx37, align 8
  %vector38 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %40, i32 0, i32 2
  %41 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector38, align 8
  %42 = load i32, i32* %j, align 4
  %idxprom39 = sext i32 %42 to i64
  %arrayidx40 = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %41, i64 %idxprom39
  %43 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx40, align 8
  %vector41 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %43, i32 0, i32 2
  %44 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector41, align 8
  %45 = load i32, i32* %k, align 4
  %idxprom42 = sext i32 %45 to i64
  %arrayidx43 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %44, i64 %idxprom42
  %46 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx43, align 8
  %labelIdx = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %46, i32 0, i32 3
  %47 = load i32, i32* %labelIdx, align 8
  %cmp44 = icmp slt i32 %47, 0
  br i1 %cmp44, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %48 = load i32, i32* %k, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %k, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end45

if.end45:                                         ; preds = %while.end, %if.else
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then27
  %49 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %pathList.addr, align 8
  %50 = load i32, i32* %i, align 4
  %idxprom47 = sext i32 %50 to i64
  %arrayidx48 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %49, i64 %idxprom47
  %51 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx48, align 8
  %vector49 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %51, i32 0, i32 2
  %52 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector49, align 8
  %53 = load i32, i32* %j, align 4
  %idxprom50 = sext i32 %53 to i64
  %arrayidx51 = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %52, i64 %idxprom50
  %54 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx51, align 8
  %vector52 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %54, i32 0, i32 2
  %55 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector52, align 8
  %56 = load i32, i32* %k, align 4
  %idxprom53 = sext i32 %56 to i64
  %arrayidx54 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %55, i64 %idxprom53
  %57 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx54, align 8
  store %struct.NodeStruct* %57, %struct.NodeStruct** %pathNode, align 8
  %58 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %59 = load %struct.NodeStruct*, %struct.NodeStruct** %pathNode, align 8
  %call55 = call %struct.NodeStruct* @getDuplicateNodeForGraph(%struct.GraphStruct* %58, %struct.NodeStruct* %59)
  store %struct.NodeStruct* %call55, %struct.NodeStruct** %nextNode, align 8
  %60 = load %struct.NodeStruct*, %struct.NodeStruct** %nextNode, align 8
  %tobool56 = icmp ne %struct.NodeStruct* %60, null
  br i1 %tobool56, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end46
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end58:                                         ; preds = %if.end46
  %61 = load %struct.NodeStruct*, %struct.NodeStruct** %currentNode, align 8
  %62 = load %struct.NodeStruct*, %struct.NodeStruct** %nextNode, align 8
  %call59 = call zeroext i1 @Node_addEdgeToNode(%struct.NodeStruct* %61, %struct.NodeStruct* %62)
  %63 = load %struct.NodeStruct*, %struct.NodeStruct** %nextNode, align 8
  store %struct.NodeStruct* %63, %struct.NodeStruct** %currentNode, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end58
  %64 = load i32, i32* %k, align 4
  %inc60 = add nsw i32 %64, 1
  store i32 %inc60, i32* %k, align 4
  br label %for.cond17

for.end:                                          ; preds = %for.cond17
  br label %for.inc61

for.inc61:                                        ; preds = %for.end
  %65 = load i32, i32* %j, align 4
  %inc62 = add nsw i32 %65, 1
  store i32 %inc62, i32* %j, align 4
  br label %for.cond3

for.end63:                                        ; preds = %for.cond3
  br label %for.inc64

for.inc64:                                        ; preds = %for.end63
  %66 = load i32, i32* %i, align 4
  %inc65 = add nsw i32 %66, 1
  store i32 %inc65, i32* %i, align 4
  br label %for.cond

for.end66:                                        ; preds = %for.cond
  %67 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  store %struct.GraphStruct* %67, %struct.GraphStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end66, %if.then57, %if.then15, %if.then
  %68 = load %struct.GraphStruct*, %struct.GraphStruct** %retval, align 8
  ret %struct.GraphStruct* %68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.NodeStruct* @getDuplicateNodeForGraph(%struct.GraphStruct* %graph, %struct.NodeStruct* %from) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %from.addr = alloca %struct.NodeStruct*, align 8
  %newNode = alloca %struct.NodeStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store %struct.NodeStruct* %from, %struct.NodeStruct** %from.addr, align 8
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %id, align 8
  %call = call %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %0, i32 %2, i1 zeroext true)
  store %struct.NodeStruct* %call, %struct.NodeStruct** %newNode, align 8
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %tobool = icmp ne %struct.NodeStruct* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  store %struct.NodeStruct* %4, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %6 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %6, i32 0, i32 1
  %7 = load i32, i32* %totalNodes, align 8
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %totalNodes, align 8
  %call1 = call %struct.NodeStruct* @Node_duplicate(%struct.NodeStruct* %5, i32 %7)
  store %struct.NodeStruct* %call1, %struct.NodeStruct** %newNode, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %tobool2 = icmp ne %struct.NodeStruct* %8, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %9 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %call4 = call zeroext i1 @Graph_addOuterNode(%struct.GraphStruct* %9, %struct.NodeStruct* %10)
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %11, i32 0, i32 4
  store i32 0, i32* %type, align 4
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  store %struct.NodeStruct* %12, %struct.NodeStruct** %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.end
  %13 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  call void @Graph_delete(%struct.GraphStruct* %13)
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @exportGraph(%struct.GraphStruct* %graph, i8* %fileName) #0 {
entry:
  %retval = alloca i1, align 1
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %fileName.addr = alloca i8*, align 8
  %out = alloca %struct._IO_FILE*, align 8
  %nodes = alloca %struct.NodeListStruct*, align 8
  %edges = alloca %struct.EdgeListStruct*, align 8
  %nodeCount = alloca i32, align 4
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store i8* %fileName, i8** %fileName.addr, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %out, align 8
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %nodes, align 8
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %edges, align 8
  store i32 0, i32* %nodeCount, align 4
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %tobool = icmp ne %struct.GraphStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %fileName.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %fileName.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %out, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %tobool2 = icmp ne %struct._IO_FILE* %3, null
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %4, i32 0, i32 2
  %5 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  store %struct.NodeListStruct* %5, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %cmp = icmp ne %struct.NodeListStruct* %6, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %nodeCount, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %nodeCount, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %8, i32 0, i32 1
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %9, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %11 = load i32, i32* %nodeCount, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 %11)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %13 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %13, i32 0, i32 1
  %14 = load i32, i32* %totalNodes, align 8
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i32 %14)
  %15 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes7 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %15, i32 0, i32 2
  %16 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes7, align 8
  store %struct.NodeListStruct* %16, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc45, %for.end
  %17 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %cmp9 = icmp ne %struct.NodeListStruct* %17, null
  br i1 %cmp9, label %for.body10, label %for.end47

for.body10:                                       ; preds = %for.cond8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %19 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %19, i32 0, i32 0
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %20, i32 0, i32 0
  %21 = load i32, i32* %id, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %21)
  %22 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node12 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %22, i32 0, i32 0
  %23 = load %struct.NodeStruct*, %struct.NodeStruct** %node12, align 8
  %edges13 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %23, i32 0, i32 7
  %24 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges13, align 8
  %tobool14 = icmp ne %struct.EdgeListStruct* %24, null
  br i1 %tobool14, label %if.then15, label %if.else

if.then15:                                        ; preds = %for.body10
  store i32 0, i32* %nodeCount, align 4
  %25 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node16 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %25, i32 0, i32 0
  %26 = load %struct.NodeStruct*, %struct.NodeStruct** %node16, align 8
  %edges17 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %26, i32 0, i32 7
  %27 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges17, align 8
  store %struct.EdgeListStruct* %27, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc25, %if.then15
  %28 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %cmp19 = icmp ne %struct.EdgeListStruct* %28, null
  br i1 %cmp19, label %for.body20, label %for.end26

for.body20:                                       ; preds = %for.cond18
  %29 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %29, i32 0, i32 1
  %30 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %30, i32 0, i32 4
  %31 = load i32, i32* %type, align 4
  %cmp21 = icmp eq i32 %31, 0
  br i1 %cmp21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %for.body20
  %32 = load i32, i32* %nodeCount, align 4
  %inc23 = add nsw i32 %32, 1
  store i32 %inc23, i32* %nodeCount, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %for.body20
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %33 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %33, i32 0, i32 2
  %34 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %34, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond18

for.end26:                                        ; preds = %for.cond18
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %36 = load i32, i32* %nodeCount, align 4
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %36)
  %37 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node28 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %37, i32 0, i32 0
  %38 = load %struct.NodeStruct*, %struct.NodeStruct** %node28, align 8
  %edges29 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %38, i32 0, i32 7
  %39 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges29, align 8
  store %struct.EdgeListStruct* %39, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc39, %for.end26
  %40 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %cmp31 = icmp ne %struct.EdgeListStruct* %40, null
  br i1 %cmp31, label %for.body32, label %for.end41

for.body32:                                       ; preds = %for.cond30
  %41 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode33 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %41, i32 0, i32 1
  %42 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode33, align 8
  %type34 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %42, i32 0, i32 4
  %43 = load i32, i32* %type34, align 4
  %cmp35 = icmp eq i32 %43, 0
  br i1 %cmp35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %for.body32
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %45 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %45, i32 0, i32 0
  %46 = load i32, i32* %targetNodeId, align 8
  %call37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %46)
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %for.body32
  br label %for.inc39

for.inc39:                                        ; preds = %if.end38
  %47 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %nextEdge40 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %47, i32 0, i32 2
  %48 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge40, align 8
  store %struct.EdgeListStruct* %48, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond30

for.end41:                                        ; preds = %for.cond30
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %call42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  br label %if.end44

if.else:                                          ; preds = %for.body10
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %call43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0))
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end41
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %51 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %nextNode46 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %51, i32 0, i32 1
  %52 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode46, align 8
  store %struct.NodeListStruct* %52, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond8

for.end47:                                        ; preds = %for.cond8
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.6, i64 0, i64 0))
  %54 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes49 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %54, i32 0, i32 2
  %55 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes49, align 8
  store %struct.NodeListStruct* %55, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc62, %for.end47
  %56 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %cmp51 = icmp ne %struct.NodeListStruct* %56, null
  br i1 %cmp51, label %for.body52, label %for.end64

for.body52:                                       ; preds = %for.cond50
  %57 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node53 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %57, i32 0, i32 0
  %58 = load %struct.NodeStruct*, %struct.NodeStruct** %node53, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %58, i32 0, i32 2
  %59 = load i8*, i8** %label, align 8
  %cmp54 = icmp ne i8* %59, null
  br i1 %cmp54, label %if.then55, label %if.end61

if.then55:                                        ; preds = %for.body52
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %61 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node56 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %61, i32 0, i32 0
  %62 = load %struct.NodeStruct*, %struct.NodeStruct** %node56, align 8
  %id57 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %62, i32 0, i32 0
  %63 = load i32, i32* %id57, align 8
  %64 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node58 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %64, i32 0, i32 0
  %65 = load %struct.NodeStruct*, %struct.NodeStruct** %node58, align 8
  %label59 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %65, i32 0, i32 2
  %66 = load i8*, i8** %label59, align 8
  %call60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 %63, i8* %66)
  br label %if.end61

if.end61:                                         ; preds = %if.then55, %for.body52
  br label %for.inc62

for.inc62:                                        ; preds = %if.end61
  %67 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %nextNode63 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %67, i32 0, i32 1
  %68 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode63, align 8
  store %struct.NodeListStruct* %68, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond50

for.end64:                                        ; preds = %for.cond50
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end64, %if.then3, %if.then
  %69 = load i1, i1* %retval, align 1
  ret i1 %69
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.GraphStruct* @Graph_new() #0 {
entry:
  %graph = alloca %struct.GraphStruct*, align 8
  store %struct.GraphStruct* null, %struct.GraphStruct** %graph, align 8
  %call = call noalias i8* @malloc(i64 40) #7
  %0 = bitcast i8* %call to %struct.GraphStruct*
  store %struct.GraphStruct* %0, %struct.GraphStruct** %graph, align 8
  %1 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %tobool = icmp ne %struct.GraphStruct* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %fileName = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %2, i32 0, i32 0
  store i8* null, i8** %fileName, align 8
  %3 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %3, i32 0, i32 1
  store i32 0, i32* %totalNodes, align 8
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %4, i32 0, i32 2
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %outerNodes, align 8
  %5 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %searchDiagram = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %5, i32 0, i32 3
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %searchDiagram, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  ret %struct.GraphStruct* %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Graph_delete(%struct.GraphStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.GraphStruct*, align 8
  %element = alloca %struct.EdgeReferencesStruct*, align 8
  store %struct.GraphStruct* %trash, %struct.GraphStruct** %trash.addr, align 8
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.GraphStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %1 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %fileName = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %1, i32 0, i32 0
  %2 = load i8*, i8** %fileName, align 8
  call void @free(i8* %2) #7
  %3 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %3, i32 0, i32 2
  %4 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  call void @NodeList_clear(%struct.NodeListStruct* %4, i1 zeroext true)
  %5 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %searchDiagram = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %5, i32 0, i32 3
  %6 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %searchDiagram, align 8
  %tobool1 = icmp ne %struct.EdgeReferencesStruct* %6, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %7 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %searchDiagram3 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %7, i32 0, i32 3
  %8 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %searchDiagram3, align 8
  store %struct.EdgeReferencesStruct* %8, %struct.EdgeReferencesStruct** %element, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %9 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %node = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %9, i32 0, i32 0
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %cmp = icmp ne %struct.NodeStruct* %10, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %edgeReferenceArray = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %11, i32 0, i32 1
  %12 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray, align 8
  %13 = bitcast %struct.EdgeReferencesStruct* %12 to i8*
  call void @free(i8* %13) #7
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %incdec.ptr = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %14, i32 1
  store %struct.EdgeReferencesStruct* %incdec.ptr, %struct.EdgeReferencesStruct** %element, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %searchDiagram4 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %15, i32 0, i32 3
  %16 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %searchDiagram4, align 8
  %17 = bitcast %struct.EdgeReferencesStruct* %16 to i8*
  call void @free(i8* %17) #7
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  %18 = load %struct.GraphStruct*, %struct.GraphStruct** %trash.addr, align 8
  %19 = bitcast %struct.GraphStruct* %18 to i8*
  call void @free(i8* %19) #7
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @Graph_addOuterNode(%struct.GraphStruct* %graph, %struct.NodeStruct* %newOuterNode) #0 {
entry:
  %retval = alloca i1, align 1
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %newOuterNode.addr = alloca %struct.NodeStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store %struct.NodeStruct* %newOuterNode, %struct.NodeStruct** %newOuterNode.addr, align 8
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %tobool = icmp ne %struct.GraphStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %newOuterNode.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %2, i32 0, i32 2
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %cmp = icmp eq %struct.NodeListStruct* %3, null
  br i1 %cmp, label %if.then2, label %if.end9

if.then2:                                         ; preds = %if.end
  %call = call %struct.NodeListStruct* (...) bitcast (%struct.NodeListStruct* ()* @NodeList_new to %struct.NodeListStruct* (...)*)()
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes3 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %4, i32 0, i32 2
  store %struct.NodeListStruct* %call, %struct.NodeListStruct** %outerNodes3, align 8
  %5 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes4 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %5, i32 0, i32 2
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes4, align 8
  %tobool5 = icmp ne %struct.NodeListStruct* %6, null
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.then2
  store i1 false, i1* %retval, align 1
  br label %return

if.end7:                                          ; preds = %if.then2
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %newOuterNode.addr, align 8
  %8 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes8 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %8, i32 0, i32 2
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes8, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %9, i32 0, i32 0
  store %struct.NodeStruct* %7, %struct.NodeStruct** %node, align 8
  store i1 true, i1* %retval, align 1
  br label %return

if.end9:                                          ; preds = %if.end
  %10 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes10 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %10, i32 0, i32 2
  %11 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes10, align 8
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %newOuterNode.addr, align 8
  %call11 = call zeroext i1 @NodeList_insertBack(%struct.NodeListStruct* %11, %struct.NodeStruct* %12)
  store i1 %call11, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end9, %if.end7, %if.then6, %if.then
  %13 = load i1, i1* %retval, align 1
  ret i1 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %graph, i32 %id, i1 zeroext %deep) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %id.addr = alloca i32, align 4
  %deep.addr = alloca i8, align 1
  %nodes = alloca %struct.NodeListStruct*, align 8
  %node = alloca %struct.NodeStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store i32 %id, i32* %id.addr, align 4
  %frombool = zext i1 %deep to i8
  store i8 %frombool, i8* %deep.addr, align 1
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %0, i32 0, i32 2
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  store %struct.NodeListStruct* %1, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %cmp = icmp ne %struct.NodeListStruct* %2, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node1 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 0
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %node1, align 8
  %id2 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %id2, align 8
  %6 = load i32, i32* %id.addr, align 4
  %cmp3 = icmp eq i32 %5, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node4 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %7, i32 0, i32 0
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node4, align 8
  store %struct.NodeStruct* %8, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %for.body
  %9 = load i8, i8* %deep.addr, align 1
  %tobool = trunc i8 %9 to i1
  br i1 %tobool, label %if.then5, label %if.end10

if.then5:                                         ; preds = %if.end
  %10 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node6 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %10, i32 0, i32 0
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %node6, align 8
  %12 = load i32, i32* %id.addr, align 4
  %call = call %struct.NodeStruct* @Graph_findContainedNode(%struct.NodeStruct* %11, i32 %12)
  store %struct.NodeStruct* %call, %struct.NodeStruct** %node, align 8
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool7 = icmp ne %struct.NodeStruct* %13, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then5
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  store %struct.NodeStruct* %14, %struct.NodeStruct** %retval, align 8
  br label %return

if.end9:                                          ; preds = %if.then5
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %15 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %15, i32 0, i32 1
  %16 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %16, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then8, %if.then
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @Graph_findContainedNode(%struct.NodeStruct* %node, i32 %id) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %id.addr = alloca i32, align 4
  %nodes = alloca %struct.NodeListStruct*, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store i32 %id, i32* %id.addr, align 4
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %0, i32 0, i32 6
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  store %struct.NodeListStruct* %1, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %cmp = icmp ne %struct.NodeListStruct* %2, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node1 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 0
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %node1, align 8
  %id2 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %id2, align 8
  %6 = load i32, i32* %id.addr, align 4
  %cmp3 = icmp eq i32 %5, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %node4 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %7, i32 0, i32 0
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node4, align 8
  store %struct.NodeStruct* %8, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %9, i32 0, i32 1
  %10 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %10, %struct.NodeListStruct** %nodes, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %defaultFile = alloca [23 x i8], align 16
  %fileName = alloca i8*, align 8
  %config = alloca %struct.ConfigurationStruct*, align 8
  %c = alloca i8, align 1
  %cFlag = alloca i32, align 4
  %iFlag = alloca i32, align 4
  %xFlag = alloca i32, align 4
  %tFlag = alloca i32, align 4
  %dFlag = alloca i32, align 4
  %oFlag = alloca i32, align 4
  %qFlag = alloca i8, align 1
  %qCount = alloca i32, align 4
  %commandLine = alloca [200 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast [23 x i8]* %defaultFile to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([23 x i8], [23 x i8]* @__const.main.defaultFile, i32 0, i32 0), i64 23, i1 false)
  store i8* null, i8** %fileName, align 8
  %call = call %struct.ConfigurationStruct* (...) bitcast (%struct.ConfigurationStruct* ()* @Configuration_new to %struct.ConfigurationStruct* (...)*)()
  store %struct.ConfigurationStruct* %call, %struct.ConfigurationStruct** %config, align 8
  store i32 0, i32* %cFlag, align 4
  store i32 0, i32* %iFlag, align 4
  store i32 0, i32* %xFlag, align 4
  store i32 0, i32* %tFlag, align 4
  store i32 0, i32* %dFlag, align 4
  store i32 0, i32* %oFlag, align 4
  store i8 0, i8* %qFlag, align 1
  store i32 0, i32* %qCount, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([633 x i8], [633 x i8]* @.str.9, i64 0, i64 0))
  %1 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  %tobool = icmp ne %struct.ConfigurationStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1.10, i64 0, i64 0))
  call void @exit(i32 0) #8
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %2, 2
  br i1 %cmp, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %arraydecay = getelementptr inbounds [23 x i8], [23 x i8]* %defaultFile, i64 0, i64 0
  %3 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  call void @exhaustiveLegSearch(i8* %arraydecay, %struct.ConfigurationStruct* %3)
  br label %if.end83

if.else:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.else
  %4 = load i32, i32* %argc.addr, align 4
  %5 = load i8**, i8*** %argv.addr, align 8
  %call4 = call i32 @getopt(i32 %4, i8** %5, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #7
  %conv = trunc i32 %call4 to i8
  store i8 %conv, i8* %c, align 1
  %conv5 = sext i8 %conv to i32
  %cmp6 = icmp ne i32 %conv5, -1
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i8, i8* %c, align 1
  %conv8 = sext i8 %6 to i32
  switch i32 %conv8, label %sw.default [
    i32 63, label %sw.bb
    i32 104, label %sw.bb34
    i32 117, label %sw.bb34
    i32 99, label %sw.bb36
    i32 105, label %sw.bb37
    i32 120, label %sw.bb38
    i32 111, label %sw.bb39
    i32 115, label %sw.bb41
    i32 113, label %sw.bb43
    i32 121, label %sw.bb49
  ]

sw.bb:                                            ; preds = %while.body
  %7 = load i32, i32* @optopt, align 4
  %cmp9 = icmp eq i32 %7, 99
  br i1 %cmp9, label %if.then11, label %if.else13

if.then11:                                        ; preds = %sw.bb
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3.12, i64 0, i64 0))
  br label %if.end33

if.else13:                                        ; preds = %sw.bb
  %9 = load i32, i32* @optopt, align 4
  %cmp14 = icmp eq i32 %9, 105
  br i1 %cmp14, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else13
  %10 = load i32, i32* @optopt, align 4
  %cmp16 = icmp eq i32 %10, 120
  br i1 %cmp16, label %if.then18, label %if.else20

if.then18:                                        ; preds = %lor.lhs.false, %if.else13
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4.13, i64 0, i64 0))
  br label %if.end32

if.else20:                                        ; preds = %lor.lhs.false
  %12 = load i32, i32* @optopt, align 4
  %cmp21 = icmp eq i32 %12, 111
  br i1 %cmp21, label %if.then23, label %if.else25

if.then23:                                        ; preds = %if.else20
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5.14, i64 0, i64 0))
  br label %if.end31

if.else25:                                        ; preds = %if.else20
  %14 = load i32, i32* @optopt, align 4
  %cmp26 = icmp eq i32 %14, 113
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.else25
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.6.15, i64 0, i64 0))
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.else25
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then23
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then18
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then11
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb34:                                          ; preds = %while.body, %while.body
  %call35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7.16, i64 0, i64 0), i8* getelementptr inbounds ([625 x i8], [625 x i8]* @.str.8, i64 0, i64 0))
  store i32 0, i32* %retval, align 4
  br label %return

sw.bb36:                                          ; preds = %while.body
  %16 = load i8*, i8** @optarg, align 8
  store i8* %16, i8** %fileName, align 8
  store i32 1, i32* %cFlag, align 4
  br label %sw.epilog

sw.bb37:                                          ; preds = %while.body
  %17 = load i8*, i8** @optarg, align 8
  store i8* %17, i8** %fileName, align 8
  store i32 1, i32* %iFlag, align 4
  br label %sw.epilog

sw.bb38:                                          ; preds = %while.body
  %18 = load i8*, i8** @optarg, align 8
  store i8* %18, i8** %fileName, align 8
  store i32 1, i32* %xFlag, align 4
  br label %sw.epilog

sw.bb39:                                          ; preds = %while.body
  %19 = load i8*, i8** @optarg, align 8
  %20 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %20, i32 0, i32 2
  %21 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions, align 8
  %outputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %21, i32 0, i32 4
  store i8* %19, i8** %outputFile, align 8
  %22 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  %searchOptions40 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %22, i32 0, i32 2
  %23 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions40, align 8
  %writeOutputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %23, i32 0, i32 3
  store i8 1, i8* %writeOutputFile, align 2
  store i32 1, i32* %oFlag, align 4
  br label %sw.epilog

sw.bb41:                                          ; preds = %while.body
  %24 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  %searchOptions42 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %24, i32 0, i32 2
  %25 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions42, align 8
  %doStatistics = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %25, i32 0, i32 2
  store i8 1, i8* %doStatistics, align 1
  br label %sw.epilog

sw.bb43:                                          ; preds = %while.body
  %26 = load i8*, i8** @optarg, align 8
  %call44 = call i32 @atoi(i8* %26) #9
  store i32 %call44, i32* %qCount, align 4
  %27 = load i32, i32* %qCount, align 4
  %cmp45 = icmp slt i32 %27, 1
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %sw.bb43
  store i32 1, i32* %qCount, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %sw.bb43
  %28 = load i32, i32* %qCount, align 4
  %29 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  %qThreadCount = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %29, i32 0, i32 3
  store i32 %28, i32* %qThreadCount, align 8
  br label %sw.epilog

sw.bb49:                                          ; preds = %while.body
  call void (...) bitcast (void ()* @YAMLOpen to void (...)*)()
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %commandLine, i64 0, i64 0
  store i8 0, i8* %arrayidx, align 16
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb49
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %argc.addr, align 4
  %cmp50 = icmp slt i32 %30, %31
  br i1 %cmp50, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay52 = getelementptr inbounds [200 x i8], [200 x i8]* %commandLine, i64 0, i64 0
  %arraydecay53 = getelementptr inbounds [200 x i8], [200 x i8]* %commandLine, i64 0, i64 0
  %32 = load i8**, i8*** %argv.addr, align 8
  %33 = load i32, i32* %i, align 4
  %idxprom = sext i32 %33 to i64
  %arrayidx54 = getelementptr inbounds i8*, i8** %32, i64 %idxprom
  %34 = load i8*, i8** %arrayidx54, align 8
  %call55 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay52, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9.17, i64 0, i64 0), i8* %arraydecay53, i8* %34) #7
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %35 = load i32, i32* %i, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay56 = getelementptr inbounds [200 x i8], [200 x i8]* %commandLine, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay56, i64 1
  call void @YAMLWriteString(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i64 0, i64 0), i8* %add.ptr)
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %for.end, %if.end48, %sw.bb41, %sw.bb39, %sw.bb38, %sw.bb37, %sw.bb36
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %36 = load i32, i32* %cFlag, align 4
  %37 = load i32, i32* %iFlag, align 4
  %add = add nsw i32 %36, %37
  %38 = load i32, i32* %xFlag, align 4
  %add57 = add nsw i32 %add, %38
  %cmp58 = icmp sgt i32 %add57, 1
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %while.end
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.11, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end62:                                         ; preds = %while.end
  %40 = load i32, i32* %cFlag, align 4
  %41 = load i32, i32* %iFlag, align 4
  %add63 = add nsw i32 %40, %41
  %42 = load i32, i32* %xFlag, align 4
  %add64 = add nsw i32 %add63, %42
  %cmp65 = icmp eq i32 %add64, 0
  br i1 %cmp65, label %if.then67, label %if.end69

if.then67:                                        ; preds = %if.end62
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.12, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end69:                                         ; preds = %if.end62
  %44 = load i32, i32* %oFlag, align 4
  %tobool70 = icmp ne i32 %44, 0
  br i1 %tobool70, label %land.lhs.true, label %if.end74

land.lhs.true:                                    ; preds = %if.end69
  %45 = load i32, i32* %xFlag, align 4
  %tobool71 = icmp ne i32 %45, 0
  br i1 %tobool71, label %if.end74, label %if.then72

if.then72:                                        ; preds = %land.lhs.true
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @.str.13, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end74:                                         ; preds = %land.lhs.true, %if.end69
  %47 = load i32, i32* %cFlag, align 4
  %tobool75 = icmp ne i32 %47, 0
  br i1 %tobool75, label %if.then76, label %if.else77

if.then76:                                        ; preds = %if.end74
  %48 = load i8*, i8** %fileName, align 8
  %49 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  call void @runBatch(i8* %48, %struct.ConfigurationStruct* %49)
  br label %if.end82

if.else77:                                        ; preds = %if.end74
  %50 = load i32, i32* %iFlag, align 4
  %tobool78 = icmp ne i32 %50, 0
  br i1 %tobool78, label %if.then79, label %if.else80

if.then79:                                        ; preds = %if.else77
  %51 = load i8*, i8** %fileName, align 8
  %52 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  call void @runInteractively(i8* %51, %struct.ConfigurationStruct* %52)
  br label %if.end81

if.else80:                                        ; preds = %if.else77
  %53 = load i8*, i8** %fileName, align 8
  %54 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config, align 8
  call void @exhaustiveLegSearch(i8* %53, %struct.ConfigurationStruct* %54)
  br label %if.end81

if.end81:                                         ; preds = %if.else80, %if.then79
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.then76
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.then3
  call void (...) bitcast (void ()* @YAMLClose to void (...)*)()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end83, %if.then72, %if.then67, %if.then60, %sw.bb34, %if.end33
  %55 = load i32, i32* %retval, align 4
  ret i32 %55
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @exhaustiveLegSearch(i8* %fileName, %struct.ConfigurationStruct* %config) #0 {
entry:
  %fileName.addr = alloca i8*, align 8
  %config.addr = alloca %struct.ConfigurationStruct*, align 8
  %graph = alloca %struct.GraphStruct*, align 8
  %found = alloca i32, align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  store %struct.ConfigurationStruct* %config, %struct.ConfigurationStruct** %config.addr, align 8
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call %struct.GraphStruct* @parseFile(i8* %0)
  store %struct.GraphStruct* %call, %struct.GraphStruct** %graph, align 8
  %1 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %tobool = icmp ne %struct.GraphStruct* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %tobool1 = icmp ne %struct.ConfigurationStruct* %2, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %3, i32 0, i32 2
  %4 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions, align 8
  %outputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %4, i32 0, i32 4
  %5 = load i8*, i8** %outputFile, align 8
  %cmp = icmp eq i8* %5, null
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %6 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %7 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions3 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %7, i32 0, i32 2
  %8 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions3, align 8
  %searchType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %8, i32 0, i32 0
  %9 = load i32, i32* %searchType, align 8
  %call4 = call i32 @findAllPossibleLegs(%struct.GraphStruct* %6, i32 %9)
  store i32 %call4, i32* %found, align 4
  br label %if.end7

if.else:                                          ; preds = %if.end
  %10 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %11 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions5 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %11, i32 0, i32 2
  %12 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions5, align 8
  %call6 = call i32 @findAndLogAllPossibleLegs(%struct.GraphStruct* %10, %struct.SearchOptionsStruct* %12)
  store i32 %call6, i32* %found, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then2
  %13 = load i32, i32* %found, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.26, i64 0, i64 0), i32 %13)
  %14 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  call void @Graph_delete(%struct.GraphStruct* %14)
  br label %return

return:                                           ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @runBatch(i8* %configFile, %struct.ConfigurationStruct* %config) #0 {
entry:
  %configFile.addr = alloca i8*, align 8
  %config.addr = alloca %struct.ConfigurationStruct*, align 8
  %success = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tick = alloca double, align 8
  %tock = alloca double, align 8
  %hours = alloca i32, align 4
  %min = alloca i32, align 4
  %sec = alloca double, align 8
  store i8* %configFile, i8** %configFile.addr, align 8
  store %struct.ConfigurationStruct* %config, %struct.ConfigurationStruct** %config.addr, align 8
  %0 = load i8*, i8** %configFile.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.14, i64 0, i64 0))
  call void @exit(i32 0) #8
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call1, double* %tick, align 8
  %1 = load i8*, i8** %configFile.addr, align 8
  %2 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %call2 = call zeroext i1 @parseConfigFile(i8* %1, %struct.ConfigurationStruct* %2)
  %frombool = zext i1 %call2 to i8
  store i8 %frombool, i8* %success, align 1
  %call3 = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call3, double* %tock, align 8
  %3 = load double, double* %tock, align 8
  %4 = load double, double* %tick, align 8
  %sub = fsub double %3, %4
  store double %sub, double* %sec, align 8
  %5 = load double, double* %sec, align 8
  %conv = fptosi double %5 to i32
  %div = sdiv i32 %conv, 3600
  store i32 %div, i32* %hours, align 4
  %6 = load double, double* %sec, align 8
  %call4 = call double @fmod(double %6, double 3.600000e+03) #7
  store double %call4, double* %sec, align 8
  %7 = load double, double* %sec, align 8
  %conv5 = fptosi double %7 to i32
  %div6 = sdiv i32 %conv5, 60
  store i32 %div6, i32* %min, align 4
  %8 = load double, double* %sec, align 8
  %call7 = call double @fmod(double %8, double 6.000000e+01) #7
  store double %call7, double* %sec, align 8
  %9 = load i32, i32* %hours, align 4
  %10 = load i32, i32* %min, align 4
  %11 = load double, double* %sec, align 8
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.15, i64 0, i64 0), i32 %9, i32 %10, double %11)
  %12 = load i8, i8* %success, align 1
  %tobool9 = trunc i8 %12 to i1
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  %13 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  call void @doMultiSearches(%struct.ConfigurationStruct* %13)
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @runInteractively(i8* %fileName, %struct.ConfigurationStruct* %config) #0 {
entry:
  %fileName.addr = alloca i8*, align 8
  %config.addr = alloca %struct.ConfigurationStruct*, align 8
  %stringBuffer = alloca [200 x i8], align 16
  %graph = alloca %struct.GraphStruct*, align 8
  %labels = alloca [25 x i8*], align 16
  %path = alloca %struct.NodePtrVecStruct*, align 8
  %success = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %fullIntSignature = alloca [3 x i32], align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  store %struct.ConfigurationStruct* %config, %struct.ConfigurationStruct** %config.addr, align 8
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %path, align 8
  store i8 0, i8* %success, align 1
  %0 = bitcast [3 x i32]* %fullIntSignature to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.runInteractively.fullIntSignature to i8*), i64 12, i1 false)
  %1 = load i8*, i8** %fileName.addr, align 8
  %call = call %struct.GraphStruct* @parseFile(i8* %1)
  store %struct.GraphStruct* %call, %struct.GraphStruct** %graph, align 8
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %tobool = icmp ne %struct.GraphStruct* %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  ret void

if.end:                                           ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %if.end39, %if.end
  store i32 0, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %land.end, %while.body
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.17, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %stringBuffer, i64 0, i64 0
  %call2 = call i32 (i8*, ...) bitcast (i32 (...)* @gets to i32 (i8*, ...)*)(i8* %arraydecay)
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %stringBuffer, i64 0, i64 0
  %call4 = call i32 @strcmp(i8* %arraydecay3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i64 0, i64 0)) #9
  %cmp = icmp eq i32 %call4, 0
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %do.body
  call void @exit(i32 1) #8
  unreachable

if.end6:                                          ; preds = %do.body
  %arraydecay7 = getelementptr inbounds [200 x i8], [200 x i8]* %stringBuffer, i64 0, i64 0
  %call8 = call i32 @strcmp(i8* %arraydecay7, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i64 0, i64 0)) #9
  %cmp9 = icmp ne i32 %call8, 0
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end6
  %arraydecay11 = getelementptr inbounds [200 x i8], [200 x i8]* %stringBuffer, i64 0, i64 0
  %call12 = call noalias i8* @strdup(i8* %arraydecay11) #7
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [25 x i8*], [25 x i8*]* %labels, i64 0, i64 %idxprom
  store i8* %call12, i8** %arrayidx, align 8
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end6
  br label %do.cond

do.cond:                                          ; preds = %if.end13
  %5 = load i32, i32* %i, align 4
  %cmp14 = icmp slt i32 %5, 25
  br i1 %cmp14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %arraydecay15 = getelementptr inbounds [200 x i8], [200 x i8]* %stringBuffer, i64 0, i64 0
  %call16 = call i32 @strcmp(i8* %arraydecay15, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i64 0, i64 0)) #9
  %cmp17 = icmp ne i32 %call16, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %6 = phi i1 [ false, %do.cond ], [ %cmp17, %land.rhs ]
  br i1 %6, label %do.body, label %do.end

do.end:                                           ; preds = %land.end
  %7 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %7 to i64
  %arrayidx19 = getelementptr inbounds [25 x i8*], [25 x i8*]* %labels, i64 0, i64 %idxprom18
  store i8* null, i8** %arrayidx19, align 8
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.20, i64 0, i64 0))
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end
  %8 = load i32, i32* %j, align 4
  %9 = load i32, i32* %i, align 4
  %cmp21 = icmp slt i32 %8, %9
  br i1 %cmp21, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %j, align 4
  %idxprom22 = sext i32 %10 to i64
  %arrayidx23 = getelementptr inbounds [25 x i8*], [25 x i8*]* %labels, i64 0, i64 %idxprom22
  %11 = load i8*, i8** %arrayidx23, align 8
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i64 0, i64 0), i8* %11)
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %13, 1
  %cmp25 = icmp slt i32 %12, %sub
  br i1 %cmp25, label %if.then26, label %if.else

if.then26:                                        ; preds = %for.body
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0))
  br label %if.end29

if.else:                                          ; preds = %for.body
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i64 0, i64 0))
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then26
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %14 = load i32, i32* %j, align 4
  %inc30 = add nsw i32 %14, 1
  store i32 %inc30, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call31 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 50)
  store %struct.NodePtrVecStruct* %call31, %struct.NodePtrVecStruct** %path, align 8
  %15 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %arraydecay32 = getelementptr inbounds [25 x i8*], [25 x i8*]* %labels, i64 0, i64 0
  %16 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path, align 8
  %17 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %17, i32 0, i32 2
  %18 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions, align 8
  %searchType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %18, i32 0, i32 0
  %19 = load i32, i32* %searchType, align 8
  %call33 = call zeroext i1 @findLabelPath(%struct.GraphStruct* %15, i8** %arraydecay32, %struct.NodePtrVecStruct* %16, i32 %19)
  %frombool = zext i1 %call33 to i8
  store i8 %frombool, i8* %success, align 1
  %20 = load i8, i8* %success, align 1
  %tobool34 = trunc i8 %20 to i1
  br i1 %tobool34, label %if.then35, label %if.else37

if.then35:                                        ; preds = %for.end
  %21 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %21, i32 0, i32 0
  %22 = load i32, i32* %contentSize, align 8
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.24, i64 0, i64 0), i32 %22)
  br label %if.end39

if.else37:                                        ; preds = %for.end
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.25, i64 0, i64 0))
  br label %if.end39

if.end39:                                         ; preds = %if.else37, %if.then35
  %23 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %23)
  br label %while.body
}

declare dso_local i32 @gets(...) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @strdup(i8*) #1

; Function Attrs: nounwind
declare dso_local double @fmod(double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @Node_new(i32 %id, i32 %nodeCount) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %id.addr = alloca i32, align 4
  %nodeCount.addr = alloca i32, align 4
  %node = alloca %struct.NodeStruct*, align 8
  store i32 %id, i32* %id.addr, align 4
  store i32 %nodeCount, i32* %nodeCount.addr, align 4
  %call = call noalias i8* @malloc(i64 56) #7
  %0 = bitcast i8* %call to %struct.NodeStruct*
  store %struct.NodeStruct* %0, %struct.NodeStruct** %node, align 8
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %id.addr, align 4
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %id1 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %3, i32 0, i32 0
  store i32 %2, i32* %id1, align 8
  %4 = load i32, i32* %nodeCount.addr, align 4
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %nodeCount2 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %5, i32 0, i32 1
  store i32 %4, i32* %nodeCount2, align 4
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %6, i32 0, i32 2
  store i8* null, i8** %label, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %labelIdx = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %7, i32 0, i32 3
  store i32 -1, i32* %labelIdx, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %8, i32 0, i32 4
  store i32 0, i32* %type, align 4
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %container = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %9, i32 0, i32 5
  store %struct.NodeStruct* null, %struct.NodeStruct** %container, align 8
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 6
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %interiorNodes, align 8
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %11, i32 0, i32 7
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %edges, align 8
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edgeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %12, i32 0, i32 8
  store i32 0, i32* %edgeCount, align 8
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %entranceCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 9
  store i32 0, i32* %entranceCount, align 4
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  store %struct.NodeStruct* %14, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %15 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Node_delete(%struct.NodeStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.NodeStruct*, align 8
  store %struct.NodeStruct* %trash, %struct.NodeStruct** %trash.addr, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %1, i32 0, i32 6
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  %tobool1 = icmp ne %struct.NodeListStruct* %2, null
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %interiorNodes3 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %3, i32 0, i32 6
  %4 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes3, align 8
  call void @NodeList_clear(%struct.NodeListStruct* %4, i1 zeroext true)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %5, i32 0, i32 7
  %6 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %tobool5 = icmp ne %struct.EdgeListStruct* %6, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end4
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %edges7 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %7, i32 0, i32 7
  %8 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges7, align 8
  call void @EdgeList_clear(%struct.EdgeListStruct* %8)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end4
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %trash.addr, align 8
  %10 = bitcast %struct.NodeStruct* %9 to i8*
  call void @free(i8* %10) #7
  br label %return

return:                                           ; preds = %if.end8, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @NodeList_clear(%struct.NodeListStruct* %trash, i1 zeroext %deleteNodes) #0 {
entry:
  %trash.addr = alloca %struct.NodeListStruct*, align 8
  %deleteNodes.addr = alloca i8, align 1
  store %struct.NodeListStruct* %trash, %struct.NodeListStruct** %trash.addr, align 8
  %frombool = zext i1 %deleteNodes to i8
  store i8 %frombool, i8* %deleteNodes.addr, align 1
  %0 = load %struct.NodeListStruct*, %struct.NodeListStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.NodeListStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %trash.addr, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %1, i32 0, i32 1
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  %tobool1 = icmp ne %struct.NodeListStruct* %2, null
  br i1 %tobool1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %trash.addr, align 8
  %nextNode3 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 1
  %4 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode3, align 8
  %5 = load i8, i8* %deleteNodes.addr, align 1
  %tobool4 = trunc i8 %5 to i1
  call void @NodeList_clear(%struct.NodeListStruct* %4, i1 zeroext %tobool4)
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %6 = load i8, i8* %deleteNodes.addr, align 1
  %tobool6 = trunc i8 %6 to i1
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %trash.addr, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %7, i32 0, i32 0
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  call void @Node_delete(%struct.NodeStruct* %8)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %trash.addr, align 8
  %10 = bitcast %struct.NodeListStruct* %9 to i8*
  call void @free(i8* %10) #7
  br label %return

return:                                           ; preds = %if.end8, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @EdgeList_clear(%struct.EdgeListStruct* %this) #0 {
entry:
  %this.addr = alloca %struct.EdgeListStruct*, align 8
  store %struct.EdgeListStruct* %this, %struct.EdgeListStruct** %this.addr, align 8
  %0 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %tobool = icmp ne %struct.EdgeListStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %1, i32 0, i32 2
  %2 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  %tobool1 = icmp ne %struct.EdgeListStruct* %2, null
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %nextEdge3 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %3, i32 0, i32 2
  %4 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge3, align 8
  call void @EdgeList_clear(%struct.EdgeListStruct* %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %6 = bitcast %struct.EdgeListStruct* %5 to i8*
  call void @free(i8* %6) #7
  br label %return

return:                                           ; preds = %if.end4, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @Node_duplicate(%struct.NodeStruct* %from, i32 %newIndex) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %from.addr = alloca %struct.NodeStruct*, align 8
  %newIndex.addr = alloca i32, align 4
  %copy = alloca %struct.NodeStruct*, align 8
  store %struct.NodeStruct* %from, %struct.NodeStruct** %from.addr, align 8
  store i32 %newIndex, i32* %newIndex.addr, align 4
  %call = call noalias i8* @malloc(i64 56) #7
  %0 = bitcast i8* %call to %struct.NodeStruct*
  store %struct.NodeStruct* %0, %struct.NodeStruct** %copy, align 8
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %tobool = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %2, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %3, i32 0, i32 0
  %4 = load i32, i32* %id, align 8
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %id2 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %5, i32 0, i32 0
  store i32 %4, i32* %id2, align 8
  %6 = load i32, i32* %newIndex.addr, align 4
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %nodeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %7, i32 0, i32 1
  store i32 %6, i32* %nodeCount, align 4
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %8, i32 0, i32 2
  %9 = load i8*, i8** %label, align 8
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %label3 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 2
  store i8* %9, i8** %label3, align 8
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %labelIdx = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %11, i32 0, i32 3
  %12 = load i32, i32* %labelIdx, align 8
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %labelIdx4 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 3
  store i32 %12, i32* %labelIdx4, align 8
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %from.addr, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %14, i32 0, i32 4
  %15 = load i32, i32* %type, align 4
  %16 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %type5 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %16, i32 0, i32 4
  store i32 %15, i32* %type5, align 4
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %container = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %17, i32 0, i32 5
  store %struct.NodeStruct* null, %struct.NodeStruct** %container, align 8
  %18 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %18, i32 0, i32 6
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %interiorNodes, align 8
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %19, i32 0, i32 7
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %edges, align 8
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %edgeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %20, i32 0, i32 8
  store i32 0, i32* %edgeCount, align 8
  %21 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  %entranceCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %21, i32 0, i32 9
  store i32 0, i32* %entranceCount, align 4
  %22 = load %struct.NodeStruct*, %struct.NodeStruct** %copy, align 8
  store %struct.NodeStruct* %22, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %23 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Node_setParent(%struct.NodeStruct* %this, %struct.NodeStruct* %parent) #0 {
entry:
  %this.addr = alloca %struct.NodeStruct*, align 8
  %parent.addr = alloca %struct.NodeStruct*, align 8
  store %struct.NodeStruct* %this, %struct.NodeStruct** %this.addr, align 8
  store %struct.NodeStruct* %parent, %struct.NodeStruct** %parent.addr, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %parent.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %parent.addr, align 8
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %container = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %3, i32 0, i32 5
  store %struct.NodeStruct* %2, %struct.NodeStruct** %container, align 8
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 4
  store i32 1, i32* %type, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Node_addInteriorNode(%struct.NodeStruct* %this, %struct.NodeStruct* %interior) #0 {
entry:
  %this.addr = alloca %struct.NodeStruct*, align 8
  %interior.addr = alloca %struct.NodeStruct*, align 8
  store %struct.NodeStruct* %this, %struct.NodeStruct** %this.addr, align 8
  store %struct.NodeStruct* %interior, %struct.NodeStruct** %interior.addr, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %interior.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %2, i32 0, i32 6
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  %cmp = icmp eq %struct.NodeListStruct* %3, null
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %call = call %struct.NodeListStruct* @NodeList_new()
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %interiorNodes3 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 6
  store %struct.NodeListStruct* %call, %struct.NodeListStruct** %interiorNodes3, align 8
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %interiorNodes4 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %5, i32 0, i32 6
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes4, align 8
  %cmp5 = icmp eq %struct.NodeListStruct* %6, null
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.then2
  br label %return

if.end7:                                          ; preds = %if.then2
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %interior.addr, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %interiorNodes8 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %8, i32 0, i32 6
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes8, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %9, i32 0, i32 0
  store %struct.NodeStruct* %7, %struct.NodeStruct** %node, align 8
  br label %if.end11

if.else:                                          ; preds = %if.end
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %interiorNodes9 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 6
  %11 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes9, align 8
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %interior.addr, align 8
  %call10 = call zeroext i1 @NodeList_insertBack(%struct.NodeListStruct* %11, %struct.NodeStruct* %12)
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.end7
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %interior.addr, align 8
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  call void @Node_setParent(%struct.NodeStruct* %13, %struct.NodeStruct* %14)
  br label %return

return:                                           ; preds = %if.end11, %if.then6, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeListStruct* @NodeList_new() #0 {
entry:
  %retval = alloca %struct.NodeListStruct*, align 8
  %list = alloca %struct.NodeListStruct*, align 8
  %call = call noalias i8* @malloc(i64 16) #7
  %0 = bitcast i8* %call to %struct.NodeListStruct*
  store %struct.NodeListStruct* %0, %struct.NodeListStruct** %list, align 8
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %list, align 8
  %tobool = icmp ne %struct.NodeListStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %list, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %2, i32 0, i32 0
  store %struct.NodeStruct* null, %struct.NodeStruct** %node, align 8
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %list, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 1
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %nextNode, align 8
  %4 = load %struct.NodeListStruct*, %struct.NodeListStruct** %list, align 8
  store %struct.NodeListStruct* %4, %struct.NodeListStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load %struct.NodeListStruct*, %struct.NodeListStruct** %retval, align 8
  ret %struct.NodeListStruct* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodeList_insertBack(%struct.NodeListStruct* %this, %struct.NodeStruct* %newBack) #0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca %struct.NodeListStruct*, align 8
  %newBack.addr = alloca %struct.NodeStruct*, align 8
  %end = alloca %struct.NodeListStruct*, align 8
  %newElement = alloca %struct.NodeListStruct*, align 8
  store %struct.NodeListStruct* %this, %struct.NodeListStruct** %this.addr, align 8
  store %struct.NodeStruct* %newBack, %struct.NodeStruct** %newBack.addr, align 8
  %0 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %tobool = icmp ne %struct.NodeListStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %newBack.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %2, i32 0, i32 0
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %cmp = icmp eq %struct.NodeStruct* %3, null
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %newBack.addr, align 8
  %5 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %node3 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %5, i32 0, i32 0
  store %struct.NodeStruct* %4, %struct.NodeStruct** %node3, align 8
  store i1 true, i1* %retval, align 1
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  store %struct.NodeListStruct* %6, %struct.NodeListStruct** %end, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %end, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %7, i32 0, i32 1
  %8 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  %cmp5 = icmp ne %struct.NodeListStruct* %8, null
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %end, align 8
  %nextNode6 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %9, i32 0, i32 1
  %10 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode6, align 8
  store %struct.NodeListStruct* %10, %struct.NodeListStruct** %end, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call %struct.NodeListStruct* @NodeList_new()
  store %struct.NodeListStruct* %call, %struct.NodeListStruct** %newElement, align 8
  %11 = load %struct.NodeListStruct*, %struct.NodeListStruct** %newElement, align 8
  %tobool7 = icmp ne %struct.NodeListStruct* %11, null
  br i1 %tobool7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %for.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end9:                                          ; preds = %for.end
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %newBack.addr, align 8
  %13 = load %struct.NodeListStruct*, %struct.NodeListStruct** %newElement, align 8
  %node10 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %13, i32 0, i32 0
  store %struct.NodeStruct* %12, %struct.NodeStruct** %node10, align 8
  %14 = load %struct.NodeListStruct*, %struct.NodeListStruct** %newElement, align 8
  %15 = load %struct.NodeListStruct*, %struct.NodeListStruct** %end, align 8
  %nextNode11 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %15, i32 0, i32 1
  store %struct.NodeListStruct* %14, %struct.NodeListStruct** %nextNode11, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then2, %if.then
  %16 = load i1, i1* %retval, align 1
  ret i1 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @Node_addEdgeToNode(%struct.NodeStruct* %this, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca %struct.NodeStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %end = alloca %struct.EdgeListStruct*, align 8
  %newEdge = alloca %struct.EdgeListStruct*, align 8
  store %struct.NodeStruct* %this, %struct.NodeStruct** %this.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %end, align 8
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %newEdge, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %2, i32 0, i32 7
  %3 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  store %struct.EdgeListStruct* %3, %struct.EdgeListStruct** %end, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %cmp = icmp ne %struct.EdgeListStruct* %4, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %5, i32 0, i32 1
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %cmp2 = icmp eq %struct.NodeStruct* %6, %7
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.body
  store i1 true, i1* %retval, align 1
  br label %return

if.end4:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end4
  %8 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %8, i32 0, i32 2
  %9 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %9, %struct.EdgeListStruct** %end, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call %struct.EdgeListStruct* @EdgeList_new()
  store %struct.EdgeListStruct* %call, %struct.EdgeListStruct** %newEdge, align 8
  %10 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newEdge, align 8
  %tobool5 = icmp ne %struct.EdgeListStruct* %10, null
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %for.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end7:                                          ; preds = %for.end
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %12 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newEdge, align 8
  %targetNode8 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %12, i32 0, i32 1
  store %struct.NodeStruct* %11, %struct.NodeStruct** %targetNode8, align 8
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 0
  %14 = load i32, i32* %id, align 8
  %15 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newEdge, align 8
  %targetNodeId = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %15, i32 0, i32 0
  store i32 %14, i32* %targetNodeId, align 8
  %16 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %edges9 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %16, i32 0, i32 7
  %17 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges9, align 8
  %18 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newEdge, align 8
  %nextEdge10 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %18, i32 0, i32 2
  store %struct.EdgeListStruct* %17, %struct.EdgeListStruct** %nextEdge10, align 8
  %19 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newEdge, align 8
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %edges11 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %20, i32 0, i32 7
  store %struct.EdgeListStruct* %19, %struct.EdgeListStruct** %edges11, align 8
  %21 = load %struct.NodeStruct*, %struct.NodeStruct** %this.addr, align 8
  %edgeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %21, i32 0, i32 8
  %22 = load i32, i32* %edgeCount, align 8
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %edgeCount, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end7, %if.then6, %if.then3, %if.then
  %23 = load i1, i1* %retval, align 1
  ret i1 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.EdgeListStruct* @EdgeList_new() #0 {
entry:
  %newNode = alloca %struct.EdgeListStruct*, align 8
  %call = call noalias i8* @malloc(i64 24) #7
  %0 = bitcast i8* %call to %struct.EdgeListStruct*
  store %struct.EdgeListStruct* %0, %struct.EdgeListStruct** %newNode, align 8
  %1 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newNode, align 8
  %tobool = icmp ne %struct.EdgeListStruct* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newNode, align 8
  %targetNodeId = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %2, i32 0, i32 0
  store i32 -1, i32* %targetNodeId, align 8
  %3 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newNode, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %3, i32 0, i32 1
  store %struct.NodeStruct* null, %struct.NodeStruct** %targetNode, align 8
  %4 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newNode, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %4, i32 0, i32 2
  store %struct.EdgeListStruct* null, %struct.EdgeListStruct** %nextEdge, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newNode, align 8
  ret %struct.EdgeListStruct* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodeList_insertFront(%struct.NodeListStruct* %this, %struct.NodeStruct* %newFront) #0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca %struct.NodeListStruct*, align 8
  %newFront.addr = alloca %struct.NodeStruct*, align 8
  %oldFront = alloca %struct.NodeListStruct*, align 8
  store %struct.NodeListStruct* %this, %struct.NodeListStruct** %this.addr, align 8
  store %struct.NodeStruct* %newFront, %struct.NodeStruct** %newFront.addr, align 8
  %call = call %struct.NodeListStruct* @NodeList_new()
  store %struct.NodeListStruct* %call, %struct.NodeListStruct** %oldFront, align 8
  %0 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %tobool = icmp ne %struct.NodeListStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodeStruct*, %struct.NodeStruct** %newFront.addr, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %oldFront, align 8
  %tobool3 = icmp ne %struct.NodeListStruct* %2, null
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 0
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %5 = load %struct.NodeListStruct*, %struct.NodeListStruct** %oldFront, align 8
  %node4 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %5, i32 0, i32 0
  store %struct.NodeStruct* %4, %struct.NodeStruct** %node4, align 8
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %6, i32 0, i32 1
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  %8 = load %struct.NodeListStruct*, %struct.NodeListStruct** %oldFront, align 8
  %nextNode5 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %8, i32 0, i32 1
  store %struct.NodeListStruct* %7, %struct.NodeListStruct** %nextNode5, align 8
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %newFront.addr, align 8
  %10 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %node6 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %10, i32 0, i32 0
  store %struct.NodeStruct* %9, %struct.NodeStruct** %node6, align 8
  %11 = load %struct.NodeListStruct*, %struct.NodeListStruct** %oldFront, align 8
  %12 = load %struct.NodeListStruct*, %struct.NodeListStruct** %this.addr, align 8
  %nextNode7 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %12, i32 0, i32 1
  store %struct.NodeListStruct* %11, %struct.NodeListStruct** %nextNode7, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  %13 = load i1, i1* %retval, align 1
  ret i1 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @EdgeList_insertNodeId(%struct.EdgeListStruct* %this, i32 %targetNodeId) #0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca %struct.EdgeListStruct*, align 8
  %targetNodeId.addr = alloca i32, align 4
  %end = alloca %struct.EdgeListStruct*, align 8
  %newElement = alloca %struct.EdgeListStruct*, align 8
  store %struct.EdgeListStruct* %this, %struct.EdgeListStruct** %this.addr, align 8
  store i32 %targetNodeId, i32* %targetNodeId.addr, align 4
  %0 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %tobool = icmp ne %struct.EdgeListStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %targetNodeId1 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %targetNodeId1, align 8
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %targetNodeId.addr, align 4
  %4 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  %targetNodeId3 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %4, i32 0, i32 0
  store i32 %3, i32* %targetNodeId3, align 8
  store i1 true, i1* %retval, align 1
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %this.addr, align 8
  store %struct.EdgeListStruct* %5, %struct.EdgeListStruct** %end, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %6, i32 0, i32 2
  %7 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  %cmp5 = icmp ne %struct.EdgeListStruct* %7, null
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %nextEdge6 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %8, i32 0, i32 2
  %9 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge6, align 8
  store %struct.EdgeListStruct* %9, %struct.EdgeListStruct** %end, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call %struct.EdgeListStruct* @EdgeList_new()
  store %struct.EdgeListStruct* %call, %struct.EdgeListStruct** %newElement, align 8
  %10 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newElement, align 8
  %tobool7 = icmp ne %struct.EdgeListStruct* %10, null
  br i1 %tobool7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %for.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end9:                                          ; preds = %for.end
  %11 = load i32, i32* %targetNodeId.addr, align 4
  %12 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newElement, align 8
  %targetNodeId10 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %12, i32 0, i32 0
  store i32 %11, i32* %targetNodeId10, align 8
  %13 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %newElement, align 8
  %14 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %end, align 8
  %nextEdge11 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %14, i32 0, i32 2
  store %struct.EdgeListStruct* %13, %struct.EdgeListStruct** %nextEdge11, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then2, %if.then
  %15 = load i1, i1* %retval, align 1
  ret i1 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @buildEntranceList(%struct.NodeStruct* %outerNode, %struct.IntVectorStruct* %nodeData) #0 {
entry:
  %outerNode.addr = alloca %struct.NodeStruct*, align 8
  %nodeData.addr = alloca %struct.IntVectorStruct*, align 8
  %i = alloca i32, align 4
  %entranceCount = alloca i32, align 4
  store %struct.NodeStruct* %outerNode, %struct.NodeStruct** %outerNode.addr, align 8
  store %struct.IntVectorStruct* %nodeData, %struct.IntVectorStruct** %nodeData.addr, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %tobool1 = icmp ne %struct.IntVectorStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end23

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %2, i32 0, i32 2
  %3 = load i32*, i32** %vector, align 8
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 1
  %4 = load i32, i32* %arrayidx, align 4
  store i32 %4, i32* %entranceCount, align 4
  %5 = load i32, i32* %entranceCount, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %if.end23

if.end3:                                          ; preds = %if.end
  %6 = load i32, i32* %entranceCount, align 4
  %7 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %7, i32 0, i32 0
  %8 = load i32, i32* %size, align 8
  %sub = sub nsw i32 %8, 2
  %cmp4 = icmp ne i32 %6, %sub
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 0
  %11 = load i32, i32* %id, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.28, i64 0, i64 0), i32 %11)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %12, i32 0, i32 7
  %13 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %tobool7 = icmp ne %struct.EdgeListStruct* %13, null
  br i1 %tobool7, label %if.end11, label %if.then8

if.then8:                                         ; preds = %if.end6
  %call9 = call %struct.EdgeListStruct* (...) bitcast (%struct.EdgeListStruct* ()* @EdgeList_new to %struct.EdgeListStruct* (...)*)()
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %edges10 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %14, i32 0, i32 7
  store %struct.EdgeListStruct* %call9, %struct.EdgeListStruct** %edges10, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.end6
  %15 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %edges12 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %15, i32 0, i32 7
  %16 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges12, align 8
  %tobool13 = icmp ne %struct.EdgeListStruct* %16, null
  br i1 %tobool13, label %if.then14, label %if.end23

if.then14:                                        ; preds = %if.end11
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then14
  %17 = load i32, i32* %i, align 4
  %18 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %size15 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %18, i32 0, i32 0
  %19 = load i32, i32* %size15, align 8
  %cmp16 = icmp slt i32 %17, %19
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %edges17 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %20, i32 0, i32 7
  %21 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges17, align 8
  %22 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector18 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %22, i32 0, i32 2
  %23 = load i32*, i32** %vector18, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom = sext i32 %24 to i64
  %arrayidx19 = getelementptr inbounds i32, i32* %23, i64 %idxprom
  %25 = load i32, i32* %arrayidx19, align 4
  %call20 = call zeroext i1 @EdgeList_insertNodeId(%struct.EdgeListStruct* %21, i32 %25)
  %26 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode.addr, align 8
  %entranceCount21 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %26, i32 0, i32 9
  %27 = load i32, i32* %entranceCount21, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %entranceCount21, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %28, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end23

if.end23:                                         ; preds = %for.end, %if.end11, %if.then2, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @buildNodeFromData(%struct.IntVectorStruct* %nodeData) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %nodeData.addr = alloca %struct.IntVectorStruct*, align 8
  %i = alloca i32, align 4
  %edgeCount = alloca i32, align 4
  %node = alloca %struct.NodeStruct*, align 8
  store %struct.IntVectorStruct* %nodeData, %struct.IntVectorStruct** %nodeData.addr, align 8
  %0 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %cmp = icmp eq %struct.IntVectorStruct* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %size, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %3, i32 0, i32 2
  %4 = load i32*, i32** %vector, align 8
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0
  %5 = load i32, i32* %arrayidx, align 4
  %call = call %struct.NodeStruct* @Node_new(i32 %5, i32 -1)
  store %struct.NodeStruct* %call, %struct.NodeStruct** %node, align 8
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool = icmp ne %struct.NodeStruct* %6, null
  br i1 %tobool, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %7 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector4 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %7, i32 0, i32 2
  %8 = load i32*, i32** %vector4, align 8
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 1
  %9 = load i32, i32* %arrayidx5, align 4
  store i32 %9, i32* %edgeCount, align 4
  %10 = load i32, i32* %edgeCount, align 4
  %11 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %size6 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %11, i32 0, i32 0
  %12 = load i32, i32* %size6, align 8
  %sub = sub nsw i32 %12, 2
  %cmp7 = icmp ne i32 %10, %sub
  br i1 %cmp7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector9 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %14, i32 0, i32 2
  %15 = load i32*, i32** %vector9, align 8
  %arrayidx10 = getelementptr inbounds i32, i32* %15, i64 0
  %16 = load i32, i32* %arrayidx10, align 4
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.1.29, i64 0, i64 0), i32 %16)
  br label %if.end12

if.end12:                                         ; preds = %if.then8, %if.end3
  %17 = load i32, i32* %edgeCount, align 4
  %cmp13 = icmp sgt i32 %17, 0
  br i1 %cmp13, label %if.then14, label %if.end28

if.then14:                                        ; preds = %if.end12
  %call15 = call %struct.EdgeListStruct* (...) bitcast (%struct.EdgeListStruct* ()* @EdgeList_new to %struct.EdgeListStruct* (...)*)()
  %18 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %18, i32 0, i32 7
  store %struct.EdgeListStruct* %call15, %struct.EdgeListStruct** %edges, align 8
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges16 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %19, i32 0, i32 7
  %20 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges16, align 8
  %tobool17 = icmp ne %struct.EdgeListStruct* %20, null
  br i1 %tobool17, label %if.then18, label %if.end27

if.then18:                                        ; preds = %if.then14
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then18
  %21 = load i32, i32* %i, align 4
  %22 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %size19 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %22, i32 0, i32 0
  %23 = load i32, i32* %size19, align 8
  %cmp20 = icmp slt i32 %21, %23
  br i1 %cmp20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges21 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %24, i32 0, i32 7
  %25 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges21, align 8
  %26 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %nodeData.addr, align 8
  %vector22 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %26, i32 0, i32 2
  %27 = load i32*, i32** %vector22, align 8
  %28 = load i32, i32* %i, align 4
  %idxprom = sext i32 %28 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %27, i64 %idxprom
  %29 = load i32, i32* %arrayidx23, align 4
  %call24 = call zeroext i1 @EdgeList_insertNodeId(%struct.EdgeListStruct* %25, i32 %29)
  %30 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edgeCount25 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %30, i32 0, i32 8
  %31 = load i32, i32* %edgeCount25, align 8
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %edgeCount25, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %i, align 4
  %inc26 = add nsw i32 %32, 1
  store i32 %inc26, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end27

if.end27:                                         ; preds = %for.end, %if.then14
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end12
  %33 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  store %struct.NodeStruct* %33, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end28, %if.then2, %if.then
  %34 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @resolveNodeEdges(%struct.GraphStruct* %graph, %struct.NodeStruct* %sourceNode, i1 zeroext %outerNode) #0 {
entry:
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %sourceNode.addr = alloca %struct.NodeStruct*, align 8
  %outerNode.addr = alloca i8, align 1
  %edges = alloca %struct.EdgeListStruct*, align 8
  %node = alloca %struct.NodeStruct*, align 8
  %okSoFar = alloca i8, align 1
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store %struct.NodeStruct* %sourceNode, %struct.NodeStruct** %sourceNode.addr, align 8
  %frombool = zext i1 %outerNode to i8
  store i8 %frombool, i8* %outerNode.addr, align 1
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %edges1 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %0, i32 0, i32 7
  %1 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges1, align 8
  store %struct.EdgeListStruct* %1, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %cmp = icmp ne %struct.EdgeListStruct* %2, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8, i8* %outerNode.addr, align 1
  %tobool = trunc i8 %3 to i1
  br i1 %tobool, label %if.then, label %if.else25

if.then:                                          ; preds = %for.body
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %5, i32 0, i32 0
  %6 = load i32, i32* %targetNodeId, align 8
  %call = call %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %4, i32 %6, i1 zeroext true)
  store %struct.NodeStruct* %call, %struct.NodeStruct** %node, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool2 = icmp ne %struct.NodeStruct* %7, null
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  store i8 1, i8* %okSoFar, align 1
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %type = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %8, i32 0, i32 4
  %9 = load i32, i32* %type, align 4
  %cmp4 = icmp eq i32 %9, 2
  br i1 %cmp4, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then3
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %type5 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 4
  %11 = load i32, i32* %type5, align 4
  %cmp6 = icmp eq i32 %11, 1
  br i1 %cmp6, label %if.then7, label %if.end17

if.then7:                                         ; preds = %lor.lhs.false, %if.then3
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %container = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %12, i32 0, i32 5
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %container, align 8
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %cmp8 = icmp ne %struct.NodeStruct* %13, %14
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %16, i32 0, i32 0
  %17 = load i32, i32* %id, align 8
  %18 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId10 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %18, i32 0, i32 0
  %19 = load i32, i32* %targetNodeId10, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.2.30, i64 0, i64 0), i32 %17, i32 %19)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %id12 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %21, i32 0, i32 0
  %22 = load i32, i32* %id12, align 8
  %23 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %type13 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %23, i32 0, i32 4
  %24 = load i32, i32* %type13, align 4
  %cmp14 = icmp eq i32 %24, 1
  %25 = zext i1 %cmp14 to i64
  %cond = select i1 %cmp14, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4.31, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5.32, i64 0, i64 0)
  %26 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %type15 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %26, i32 0, i32 4
  %27 = load i32, i32* %type15, align 4
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3.33, i64 0, i64 0), i32 %22, i8* %cond, i32 %27)
  store i8 0, i8* %okSoFar, align 1
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then7
  br label %if.end17

if.end17:                                         ; preds = %if.end, %lor.lhs.false
  %28 = load i8, i8* %okSoFar, align 1
  %tobool18 = trunc i8 %28 to i1
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end17
  %29 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %30 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %30, i32 0, i32 1
  store %struct.NodeStruct* %29, %struct.NodeStruct** %targetNode, align 8
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end17
  br label %if.end24

if.else:                                          ; preds = %if.then
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %id21 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %32, i32 0, i32 0
  %33 = load i32, i32* %id21, align 8
  %34 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId22 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %34, i32 0, i32 0
  %35 = load i32, i32* %targetNodeId22, align 8
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.6.34, i64 0, i64 0), i32 %33, i32 %35)
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.end20
  br label %if.end44

if.else25:                                        ; preds = %for.body
  %36 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %37 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId26 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %37, i32 0, i32 0
  %38 = load i32, i32* %targetNodeId26, align 8
  %call27 = call %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %36, i32 %38, i1 zeroext false)
  store %struct.NodeStruct* %call27, %struct.NodeStruct** %node, align 8
  %39 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool28 = icmp ne %struct.NodeStruct* %39, null
  br i1 %tobool28, label %if.then29, label %if.else31

if.then29:                                        ; preds = %if.else25
  %40 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %41 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode30 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %41, i32 0, i32 1
  store %struct.NodeStruct* %40, %struct.NodeStruct** %targetNode30, align 8
  br label %if.end43

if.else31:                                        ; preds = %if.else25
  %42 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %container32 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %42, i32 0, i32 5
  %43 = load %struct.NodeStruct*, %struct.NodeStruct** %container32, align 8
  %44 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId33 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %44, i32 0, i32 0
  %45 = load i32, i32* %targetNodeId33, align 8
  %call34 = call %struct.NodeStruct* @Graph_findContainedNode(%struct.NodeStruct* %43, i32 %45)
  store %struct.NodeStruct* %call34, %struct.NodeStruct** %node, align 8
  %46 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool35 = icmp ne %struct.NodeStruct* %46, null
  br i1 %tobool35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.else31
  %47 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %48 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode37 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %48, i32 0, i32 1
  store %struct.NodeStruct* %47, %struct.NodeStruct** %targetNode37, align 8
  br label %if.end42

if.else38:                                        ; preds = %if.else31
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load %struct.NodeStruct*, %struct.NodeStruct** %sourceNode.addr, align 8
  %id39 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %50, i32 0, i32 0
  %51 = load i32, i32* %id39, align 8
  %52 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNodeId40 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %52, i32 0, i32 0
  %53 = load i32, i32* %targetNodeId40, align 8
  %call41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.7.35, i64 0, i64 0), i32 %51, i32 %53)
  br label %if.end42

if.end42:                                         ; preds = %if.else38, %if.then36
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.then29
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end24
  br label %for.inc

for.inc:                                          ; preds = %if.end44
  %54 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %54, i32 0, i32 2
  %55 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %55, %struct.EdgeListStruct** %edges, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.GraphStruct* @parseFile(i8* %fileName) #0 {
entry:
  %retval = alloca %struct.GraphStruct*, align 8
  %fileName.addr = alloca i8*, align 8
  %inFile = alloca %struct._IO_FILE*, align 8
  %fileData = alloca %struct.IntVectorStruct*, align 8
  %fileString = alloca %struct.CharVectorStruct*, align 8
  %newNode = alloca %struct.NodeStruct*, align 8
  %outerNode = alloca %struct.NodeStruct*, align 8
  %findNode = alloca %struct.NodeStruct*, align 8
  %temp = alloca i32, align 4
  %count = alloca i32, align 4
  %outerNodeList = alloca %struct.NodeListStruct*, align 8
  %innerNodeList = alloca %struct.NodeListStruct*, align 8
  %newGraph = alloca %struct.GraphStruct*, align 8
  %funcCount = alloca i32, align 4
  %blockCount = alloca i32, align 4
  %systemCallSection = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  store %struct.IntVectorStruct* null, %struct.IntVectorStruct** %fileData, align 8
  store %struct.CharVectorStruct* null, %struct.CharVectorStruct** %fileString, align 8
  store %struct.NodeStruct* null, %struct.NodeStruct** %newNode, align 8
  store %struct.NodeStruct* null, %struct.NodeStruct** %outerNode, align 8
  store %struct.NodeStruct* null, %struct.NodeStruct** %findNode, align 8
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %outerNodeList, align 8
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %innerNodeList, align 8
  store %struct.GraphStruct* null, %struct.GraphStruct** %newGraph, align 8
  store i32 50, i32* %funcCount, align 4
  store i32 0, i32* %blockCount, align 4
  store i8 0, i8* %systemCallSection, align 1
  %0 = load i8*, i8** %fileName.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %fileName.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.38, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %inFile, align 8
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %tobool1 = icmp ne %struct._IO_FILE* %2, null
  br i1 %tobool1, label %if.end4, label %if.then2

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** %fileName.addr, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9.39, i64 0, i64 0), i8* %3)
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %call5 = call %struct.GraphStruct* (...) bitcast (%struct.GraphStruct* ()* @Graph_new to %struct.GraphStruct* (...)*)()
  store %struct.GraphStruct* %call5, %struct.GraphStruct** %newGraph, align 8
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %tobool6 = icmp ne %struct.GraphStruct* %4, null
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end8:                                          ; preds = %if.end4
  %5 = load i8*, i8** %fileName.addr, align 8
  %call9 = call noalias i8* @strdup(i8* %5) #7
  %6 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %fileName10 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %6, i32 0, i32 0
  store i8* %call9, i8** %fileName10, align 8
  %call11 = call %struct.CharVectorStruct* @CharVector_new(i32 1024)
  store %struct.CharVectorStruct* %call11, %struct.CharVectorStruct** %fileString, align 8
  store i32 0, i32* %i, align 4
  %7 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call12 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %7, %struct._IO_FILE* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call13 = call i32 @feof(%struct._IO_FILE* %9) #7
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.else, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end8
  %10 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %10, i32 0, i32 2
  %11 = load i8*, i8** %string, align 8
  %call15 = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10.40, i64 0, i64 0), i8* %11, i64 10) #9
  %cmp = icmp eq i32 %call15, 0
  br i1 %cmp, label %if.then16, label %if.else

if.then16:                                        ; preds = %land.lhs.true
  %12 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string17 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %12, i32 0, i32 2
  %13 = load i8*, i8** %string17, align 8
  %add.ptr = getelementptr inbounds i8, i8* %13, i64 10
  %call18 = call i32 @atoi(i8* %add.ptr) #9
  store i32 %call18, i32* %funcCount, align 4
  %14 = load i32, i32* %funcCount, align 4
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11.41, i64 0, i64 0), i32 %14)
  %15 = load i32, i32* %funcCount, align 4
  call void @YAMLWriteInt(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12.42, i64 0, i64 0), i32 %15)
  br label %if.end21

if.else:                                          ; preds = %land.lhs.true, %if.end8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13.43, i64 0, i64 0))
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end21:                                         ; preds = %if.then16
  %17 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call22 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %17, %struct._IO_FILE* %18)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call23 = call i32 @feof(%struct._IO_FILE* %19) #7
  %tobool24 = icmp ne i32 %call23, 0
  br i1 %tobool24, label %if.else34, label %land.lhs.true25

land.lhs.true25:                                  ; preds = %if.end21
  %20 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string26 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %20, i32 0, i32 2
  %21 = load i8*, i8** %string26, align 8
  %call27 = call i32 @strncmp(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14.44, i64 0, i64 0), i8* %21, i64 13) #9
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.else34

if.then29:                                        ; preds = %land.lhs.true25
  %22 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string30 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %22, i32 0, i32 2
  %23 = load i8*, i8** %string30, align 8
  %add.ptr31 = getelementptr inbounds i8, i8* %23, i64 13
  %call32 = call i32 @atoi(i8* %add.ptr31) #9
  store i32 %call32, i32* %blockCount, align 4
  %24 = load i32, i32* %blockCount, align 4
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15.45, i64 0, i64 0), i32 %24)
  %25 = load i32, i32* %blockCount, align 4
  call void @YAMLWriteInt(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16.46, i64 0, i64 0), i32 %25)
  br label %if.end36

if.else34:                                        ; preds = %land.lhs.true25, %if.end21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13.43, i64 0, i64 0))
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end36:                                         ; preds = %if.then29
  %call37 = call %struct.IntVectorStruct* @IntVector_new(i32 8)
  store %struct.IntVectorStruct* %call37, %struct.IntVectorStruct** %fileData, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end60, %if.end36
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call38 = call i32 @feof(%struct._IO_FILE* %27) #7
  %tobool39 = icmp ne i32 %call38, 0
  %lnot = xor i1 %tobool39, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %28 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call40 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %28, %struct._IO_FILE* %29)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call41 = call i32 @feof(%struct._IO_FILE* %30) #7
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %while.body
  br label %while.end

if.end44:                                         ; preds = %while.body
  %31 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string45 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %31, i32 0, i32 2
  %32 = load i8*, i8** %string45, align 8
  %call46 = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17.47, i64 0, i64 0), i8* %32, i64 10) #9
  %cmp47 = icmp eq i32 %call46, 0
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end44
  br label %while.end

if.end49:                                         ; preds = %if.end44
  %33 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %34 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string50 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %34, i32 0, i32 2
  %35 = load i8*, i8** %string50, align 8
  %call51 = call i32 @IntVector_createFromString(%struct.IntVectorStruct* %33, i8* %35)
  store i32 %call51, i32* %count, align 4
  %36 = load i32, i32* %count, align 4
  %cmp52 = icmp sgt i32 %36, 0
  br i1 %cmp52, label %if.then53, label %if.end60

if.then53:                                        ; preds = %if.end49
  %37 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %call54 = call %struct.NodeStruct* @buildNodeFromData(%struct.IntVectorStruct* %37)
  store %struct.NodeStruct* %call54, %struct.NodeStruct** %newNode, align 8
  %38 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %tobool55 = icmp ne %struct.NodeStruct* %38, null
  br i1 %tobool55, label %if.then56, label %if.end59

if.then56:                                        ; preds = %if.then53
  %39 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %40 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %call57 = call zeroext i1 @Graph_addOuterNode(%struct.GraphStruct* %39, %struct.NodeStruct* %40)
  %41 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %41, i32 0, i32 1
  %42 = load i32, i32* %totalNodes, align 8
  %43 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %nodeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %43, i32 0, i32 1
  store i32 %42, i32* %nodeCount, align 4
  %44 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %totalNodes58 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %44, i32 0, i32 1
  %45 = load i32, i32* %totalNodes58, align 8
  %add = add nsw i32 %45, 1
  store i32 %add, i32* %totalNodes58, align 8
  br label %if.end59

if.end59:                                         ; preds = %if.then56, %if.then53
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %if.end49
  %46 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %46, i32 0, i32 0
  store i32 0, i32* %size, align 8
  br label %while.cond

while.end:                                        ; preds = %if.then48, %if.then43, %while.cond
  br label %while.cond61

while.cond61:                                     ; preds = %while.end126, %while.end
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call62 = call i32 @feof(%struct._IO_FILE* %47) #7
  %tobool63 = icmp ne i32 %call62, 0
  %lnot64 = xor i1 %tobool63, true
  br i1 %lnot64, label %while.body65, label %while.end127

while.body65:                                     ; preds = %while.cond61
  %48 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call66 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %48, %struct._IO_FILE* %49)
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call67 = call i32 @feof(%struct._IO_FILE* %50) #7
  %tobool68 = icmp ne i32 %call67, 0
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %while.body65
  br label %while.end127

if.end70:                                         ; preds = %while.body65
  %51 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string71 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %51, i32 0, i32 2
  %52 = load i8*, i8** %string71, align 8
  %call72 = call i32 @strncmp(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18.48, i64 0, i64 0), i8* %52, i64 12) #9
  %cmp73 = icmp eq i32 %call72, 0
  %frombool = zext i1 %cmp73 to i8
  store i8 %frombool, i8* %systemCallSection, align 1
  %53 = load i8, i8* %systemCallSection, align 1
  %tobool74 = trunc i8 %53 to i1
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end70
  br label %while.end127

if.end76:                                         ; preds = %if.end70
  %call77 = call i16** @__ctype_b_loc() #10
  %54 = load i16*, i16** %call77, align 8
  %55 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string78 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %55, i32 0, i32 2
  %56 = load i8*, i8** %string78, align 8
  %arrayidx = getelementptr inbounds i8, i8* %56, i64 0
  %57 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %57 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx79 = getelementptr inbounds i16, i16* %54, i64 %idxprom
  %58 = load i16, i16* %arrayidx79, align 2
  %conv80 = zext i16 %58 to i32
  %and = and i32 %conv80, 2048
  %tobool81 = icmp ne i32 %and, 0
  br i1 %tobool81, label %if.then82, label %if.else85

if.then82:                                        ; preds = %if.end76
  %59 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string83 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %59, i32 0, i32 2
  %60 = load i8*, i8** %string83, align 8
  %call84 = call i32 @atoi(i8* %60) #9
  store i32 %call84, i32* %temp, align 4
  br label %if.end86

if.else85:                                        ; preds = %if.end76
  store i32 -1, i32* %temp, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.else85, %if.then82
  %61 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %62 = load i32, i32* %temp, align 4
  %call87 = call %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %61, i32 %62, i1 zeroext false)
  store %struct.NodeStruct* %call87, %struct.NodeStruct** %outerNode, align 8
  %63 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode, align 8
  %cmp88 = icmp eq %struct.NodeStruct* %63, null
  br i1 %cmp88, label %if.then90, label %if.end92

if.then90:                                        ; preds = %if.end86
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = load i32, i32* %temp, align 4
  %call91 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.19.49, i64 0, i64 0), i32 %65)
  br label %while.end127

if.end92:                                         ; preds = %if.end86
  br label %while.cond93

while.cond93:                                     ; preds = %if.end124, %if.end92
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call94 = call i32 @feof(%struct._IO_FILE* %66) #7
  %tobool95 = icmp ne i32 %call94, 0
  %lnot96 = xor i1 %tobool95, true
  br i1 %lnot96, label %while.body97, label %while.end126

while.body97:                                     ; preds = %while.cond93
  %67 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call98 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %67, %struct._IO_FILE* %68)
  %69 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string99 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %69, i32 0, i32 2
  %70 = load i8*, i8** %string99, align 8
  %call100 = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17.47, i64 0, i64 0), i8* %70, i64 10) #9
  %cmp101 = icmp eq i32 %call100, 0
  br i1 %cmp101, label %if.then103, label %if.end104

if.then103:                                       ; preds = %while.body97
  br label %while.end126

if.end104:                                        ; preds = %while.body97
  %71 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %72 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string105 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %72, i32 0, i32 2
  %73 = load i8*, i8** %string105, align 8
  %call106 = call i32 @IntVector_createFromString(%struct.IntVectorStruct* %71, i8* %73)
  store i32 %call106, i32* %count, align 4
  %74 = load i32, i32* %count, align 4
  %cmp107 = icmp sgt i32 %74, 0
  br i1 %cmp107, label %if.then109, label %if.end124

if.then109:                                       ; preds = %if.end104
  %75 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %vector = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %75, i32 0, i32 2
  %76 = load i32*, i32** %vector, align 8
  %arrayidx110 = getelementptr inbounds i32, i32* %76, i64 0
  %77 = load i32, i32* %arrayidx110, align 4
  %78 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %78, i32 0, i32 0
  %79 = load i32, i32* %id, align 8
  %cmp111 = icmp eq i32 %77, %79
  br i1 %cmp111, label %if.then113, label %if.else114

if.then113:                                       ; preds = %if.then109
  %80 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode, align 8
  %81 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  call void @buildEntranceList(%struct.NodeStruct* %80, %struct.IntVectorStruct* %81)
  br label %if.end123

if.else114:                                       ; preds = %if.then109
  %82 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %call115 = call %struct.NodeStruct* @buildNodeFromData(%struct.IntVectorStruct* %82)
  store %struct.NodeStruct* %call115, %struct.NodeStruct** %newNode, align 8
  %83 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %tobool116 = icmp ne %struct.NodeStruct* %83, null
  br i1 %tobool116, label %if.then117, label %if.end122

if.then117:                                       ; preds = %if.else114
  %84 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode, align 8
  %85 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %84, %struct.NodeStruct* %85)
  %86 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %totalNodes118 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %86, i32 0, i32 1
  %87 = load i32, i32* %totalNodes118, align 8
  %88 = load %struct.NodeStruct*, %struct.NodeStruct** %newNode, align 8
  %nodeCount119 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %88, i32 0, i32 1
  store i32 %87, i32* %nodeCount119, align 4
  %89 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %totalNodes120 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %89, i32 0, i32 1
  %90 = load i32, i32* %totalNodes120, align 8
  %add121 = add nsw i32 %90, 1
  store i32 %add121, i32* %totalNodes120, align 8
  br label %if.end122

if.end122:                                        ; preds = %if.then117, %if.else114
  br label %if.end123

if.end123:                                        ; preds = %if.end122, %if.then113
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %if.end104
  %91 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  %size125 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %91, i32 0, i32 0
  store i32 0, i32* %size125, align 8
  br label %while.cond93

while.end126:                                     ; preds = %if.then103, %while.cond93
  br label %while.cond61

while.end127:                                     ; preds = %if.then90, %if.then75, %if.then69, %while.cond61
  %92 = load i32, i32* %funcCount, align 4
  %call128 = call %struct.SystemCallMapStruct* @SystemCallMap_new(i32 %92)
  %93 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %systemCallMap = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %93, i32 0, i32 4
  store %struct.SystemCallMapStruct* %call128, %struct.SystemCallMapStruct** %systemCallMap, align 8
  %94 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %systemCallMap129 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %94, i32 0, i32 4
  %95 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap129, align 8
  %cmp130 = icmp eq %struct.SystemCallMapStruct* %95, null
  br i1 %cmp130, label %if.then132, label %if.end133

if.then132:                                       ; preds = %while.end127
  %96 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %fileData, align 8
  call void @IntVector_delete(%struct.IntVectorStruct* %96)
  store %struct.GraphStruct* null, %struct.GraphStruct** %retval, align 8
  br label %return

if.end133:                                        ; preds = %while.end127
  %97 = load i8, i8* %systemCallSection, align 1
  %tobool134 = trunc i8 %97 to i1
  br i1 %tobool134, label %if.then135, label %if.end194

if.then135:                                       ; preds = %if.end133
  br label %while.cond136

while.cond136:                                    ; preds = %if.end192, %if.then135
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call137 = call i32 @feof(%struct._IO_FILE* %98) #7
  %tobool138 = icmp ne i32 %call137, 0
  %lnot139 = xor i1 %tobool138, true
  br i1 %lnot139, label %while.body140, label %while.end193

while.body140:                                    ; preds = %while.cond136
  %99 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call141 = call i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %99, %struct._IO_FILE* %100)
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8
  %call142 = call i32 @feof(%struct._IO_FILE* %101) #7
  %tobool143 = icmp ne i32 %call142, 0
  br i1 %tobool143, label %if.then144, label %if.end145

if.then144:                                       ; preds = %while.body140
  br label %while.end193

if.end145:                                        ; preds = %while.body140
  %call146 = call i16** @__ctype_b_loc() #10
  %102 = load i16*, i16** %call146, align 8
  %103 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string147 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %103, i32 0, i32 2
  %104 = load i8*, i8** %string147, align 8
  %arrayidx148 = getelementptr inbounds i8, i8* %104, i64 0
  %105 = load i8, i8* %arrayidx148, align 1
  %conv149 = sext i8 %105 to i32
  %idxprom150 = sext i32 %conv149 to i64
  %arrayidx151 = getelementptr inbounds i16, i16* %102, i64 %idxprom150
  %106 = load i16, i16* %arrayidx151, align 2
  %conv152 = zext i16 %106 to i32
  %and153 = and i32 %conv152, 2048
  %tobool154 = icmp ne i32 %and153, 0
  br i1 %tobool154, label %if.then155, label %if.else158

if.then155:                                       ; preds = %if.end145
  %107 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string156 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %107, i32 0, i32 2
  %108 = load i8*, i8** %string156, align 8
  %call157 = call i32 @atoi(i8* %108) #9
  store i32 %call157, i32* %temp, align 4
  br label %if.end159

if.else158:                                       ; preds = %if.end145
  store i32 -1, i32* %temp, align 4
  br label %if.end159

if.end159:                                        ; preds = %if.else158, %if.then155
  %109 = load i32, i32* %temp, align 4
  %cmp160 = icmp sge i32 %109, 0
  br i1 %cmp160, label %if.then162, label %if.end192

if.then162:                                       ; preds = %if.end159
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then162
  %110 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string163 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %110, i32 0, i32 2
  %111 = load i8*, i8** %string163, align 8
  %112 = load i32, i32* %i, align 4
  %idxprom164 = sext i32 %112 to i64
  %arrayidx165 = getelementptr inbounds i8, i8* %111, i64 %idxprom164
  %113 = load i8, i8* %arrayidx165, align 1
  %conv166 = sext i8 %113 to i32
  %cmp167 = icmp ne i32 %conv166, 0
  br i1 %cmp167, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %114 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string169 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %114, i32 0, i32 2
  %115 = load i8*, i8** %string169, align 8
  %116 = load i32, i32* %i, align 4
  %idxprom170 = sext i32 %116 to i64
  %arrayidx171 = getelementptr inbounds i8, i8* %115, i64 %idxprom170
  %117 = load i8, i8* %arrayidx171, align 1
  %conv172 = sext i8 %117 to i32
  %cmp173 = icmp ne i32 %conv172, 32
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %118 = phi i1 [ false, %for.cond ], [ %cmp173, %land.rhs ]
  br i1 %118, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %119 = load i32, i32* %i, align 4
  %inc = add nsw i32 %119, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %120 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string175 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %120, i32 0, i32 2
  %121 = load i8*, i8** %string175, align 8
  %122 = load i32, i32* %i, align 4
  %idxprom176 = sext i32 %122 to i64
  %arrayidx177 = getelementptr inbounds i8, i8* %121, i64 %idxprom176
  %123 = load i8, i8* %arrayidx177, align 1
  %conv178 = sext i8 %123 to i32
  %cmp179 = icmp eq i32 %conv178, 32
  br i1 %cmp179, label %if.then181, label %if.end191

if.then181:                                       ; preds = %for.end
  %124 = load i32, i32* %i, align 4
  %inc182 = add nsw i32 %124, 1
  store i32 %inc182, i32* %i, align 4
  %125 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %126 = load i32, i32* %temp, align 4
  %call183 = call %struct.NodeStruct* @Graph_findNode(%struct.GraphStruct* %125, i32 %126, i1 zeroext true)
  store %struct.NodeStruct* %call183, %struct.NodeStruct** %findNode, align 8
  %127 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string184 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %127, i32 0, i32 2
  %128 = load i8*, i8** %string184, align 8
  %129 = load i32, i32* %i, align 4
  %idx.ext = sext i32 %129 to i64
  %add.ptr185 = getelementptr inbounds i8, i8* %128, i64 %idx.ext
  call void @pruneLine(i8* %add.ptr185)
  %130 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %systemCallMap186 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %130, i32 0, i32 4
  %131 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap186, align 8
  %132 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  %string187 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %132, i32 0, i32 2
  %133 = load i8*, i8** %string187, align 8
  %134 = load i32, i32* %i, align 4
  %idx.ext188 = sext i32 %134 to i64
  %add.ptr189 = getelementptr inbounds i8, i8* %133, i64 %idx.ext188
  %135 = load %struct.NodeStruct*, %struct.NodeStruct** %findNode, align 8
  %call190 = call zeroext i1 @SystemCallMap_insert(%struct.SystemCallMapStruct* %131, i8* %add.ptr189, %struct.NodeStruct* %135)
  br label %if.end191

if.end191:                                        ; preds = %if.then181, %for.end
  br label %if.end192

if.end192:                                        ; preds = %if.end191, %if.end159
  br label %while.cond136

while.end193:                                     ; preds = %if.then144, %while.cond136
  br label %if.end194

if.end194:                                        ; preds = %while.end193, %if.end133
  %136 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %fileString, align 8
  call void @CharVector_delete(%struct.CharVectorStruct* %136)
  %137 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %137, i32 0, i32 2
  %138 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  store %struct.NodeListStruct* %138, %struct.NodeListStruct** %outerNodeList, align 8
  br label %for.cond195

for.cond195:                                      ; preds = %for.inc207, %if.end194
  %139 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodeList, align 8
  %cmp196 = icmp ne %struct.NodeListStruct* %139, null
  br i1 %cmp196, label %for.body198, label %for.end209

for.body198:                                      ; preds = %for.cond195
  %140 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %141 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodeList, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %141, i32 0, i32 0
  %142 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  call void @resolveNodeEdges(%struct.GraphStruct* %140, %struct.NodeStruct* %142, i1 zeroext true)
  %143 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodeList, align 8
  %node199 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %143, i32 0, i32 0
  %144 = load %struct.NodeStruct*, %struct.NodeStruct** %node199, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %144, i32 0, i32 6
  %145 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  store %struct.NodeListStruct* %145, %struct.NodeListStruct** %innerNodeList, align 8
  br label %for.cond200

for.cond200:                                      ; preds = %for.inc205, %for.body198
  %146 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodeList, align 8
  %cmp201 = icmp ne %struct.NodeListStruct* %146, null
  br i1 %cmp201, label %for.body203, label %for.end206

for.body203:                                      ; preds = %for.cond200
  %147 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %148 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodeList, align 8
  %node204 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %148, i32 0, i32 0
  %149 = load %struct.NodeStruct*, %struct.NodeStruct** %node204, align 8
  call void @resolveNodeEdges(%struct.GraphStruct* %147, %struct.NodeStruct* %149, i1 zeroext false)
  br label %for.inc205

for.inc205:                                       ; preds = %for.body203
  %150 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodeList, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %150, i32 0, i32 1
  %151 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %151, %struct.NodeListStruct** %innerNodeList, align 8
  br label %for.cond200

for.end206:                                       ; preds = %for.cond200
  br label %for.inc207

for.inc207:                                       ; preds = %for.end206
  %152 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodeList, align 8
  %nextNode208 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %152, i32 0, i32 1
  %153 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode208, align 8
  store %struct.NodeListStruct* %153, %struct.NodeListStruct** %outerNodeList, align 8
  br label %for.cond195

for.end209:                                       ; preds = %for.cond195
  %154 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %systemCallMap210 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %154, i32 0, i32 4
  %155 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap210, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %155, i32 0, i32 0
  %156 = load i32, i32* %contentSize, align 8
  %call211 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.20.50, i64 0, i64 0), i32 %156)
  %157 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %systemCallMap212 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %157, i32 0, i32 4
  %158 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap212, align 8
  %contentSize213 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %158, i32 0, i32 0
  %159 = load i32, i32* %contentSize213, align 8
  call void @YAMLWriteInt(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21.51, i64 0, i64 0), i32 %159)
  %160 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %outerNodes214 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %160, i32 0, i32 2
  %161 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes214, align 8
  %162 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %totalNodes215 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %162, i32 0, i32 1
  %163 = load i32, i32* %totalNodes215, align 8
  %call216 = call %struct.EdgeReferencesStruct* @SearchDiagram_build(%struct.NodeListStruct* %161, i32 %163)
  %164 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  %searchDiagram = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %164, i32 0, i32 3
  store %struct.EdgeReferencesStruct* %call216, %struct.EdgeReferencesStruct** %searchDiagram, align 8
  %call217 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.22.52, i64 0, i64 0))
  %165 = load %struct.GraphStruct*, %struct.GraphStruct** %newGraph, align 8
  store %struct.GraphStruct* %165, %struct.GraphStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end209, %if.then132, %if.else34, %if.else, %if.then7, %if.then2, %if.then
  %166 = load %struct.GraphStruct*, %struct.GraphStruct** %retval, align 8
  ret %struct.GraphStruct* %166
}

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @strncmp(i8*, i8*, i64) #5

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @pruneLine(i8* %label) #0 {
entry:
  %label.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %label, i8** %label.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %label.addr, align 8
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %label.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %idxprom2
  %5 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp eq i32 %conv4, 13
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i8*, i8** %label.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 %idxprom7
  store i8 0, i8* %arrayidx8, align 1
  br label %for.end

if.end:                                           ; preds = %for.body
  %8 = load i8*, i8** %label.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds i8, i8* %8, i64 %idxprom9
  %10 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %10 to i32
  %cmp12 = icmp eq i32 %conv11, 10
  br i1 %cmp12, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.end
  %11 = load i8*, i8** %label.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %12 to i64
  %arrayidx16 = getelementptr inbounds i8, i8* %11, i64 %idxprom15
  store i8 0, i8* %arrayidx16, align 1
  br label %for.end

if.end17:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then14, %if.then, %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8** @parseSignature(i8* %data) #0 {
entry:
  %retval = alloca i8**, align 8
  %data.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %labelCount = alloca i32, align 4
  %copiedLabels = alloca i32, align 4
  %labels = alloca i8**, align 8
  %debug = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  store i32 0, i32* %i, align 4
  store i32 0, i32* %labelCount, align 4
  store i32 0, i32* %copiedLabels, align 4
  store i8** null, i8*** %labels, align 8
  store i8* null, i8** %debug, align 8
  %0 = load i8*, i8** %data.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8** null, i8*** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8*, i8** %data.addr, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 %idxprom2
  %6 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 32
  br i1 %cmp5, label %if.then7, label %if.end10

if.then7:                                         ; preds = %for.body
  %7 = load i32, i32* %labelCount, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %labelCount, align 4
  %8 = load i8*, i8** %data.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds i8, i8* %8, i64 %idxprom8
  store i8 0, i8* %arrayidx9, align 1
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %10 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %labelCount, align 4
  %add = add nsw i32 %11, 1
  %conv12 = sext i32 %add to i64
  %mul = mul i64 %conv12, 8
  %call = call noalias i8* @malloc(i64 %mul) #7
  %12 = bitcast i8* %call to i8**
  store i8** %12, i8*** %labels, align 8
  store i32 0, i32* %i, align 4
  %13 = load i8**, i8*** %labels, align 8
  %tobool13 = icmp ne i8** %13, null
  br i1 %tobool13, label %if.then14, label %if.end38

if.then14:                                        ; preds = %for.end
  store i32 0, i32* %copiedLabels, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc33, %if.then14
  %14 = load i32, i32* %copiedLabels, align 4
  %15 = load i32, i32* %labelCount, align 4
  %cmp16 = icmp slt i32 %14, %15
  br i1 %cmp16, label %for.body18, label %for.end35

for.body18:                                       ; preds = %for.cond15
  %16 = load i8*, i8** %data.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %17 to i64
  %arrayidx20 = getelementptr inbounds i8, i8* %16, i64 %idxprom19
  store i8* %arrayidx20, i8** %debug, align 8
  %18 = load i8*, i8** %data.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %19 to i64
  %arrayidx22 = getelementptr inbounds i8, i8* %18, i64 %idxprom21
  %call23 = call noalias i8* @strdup(i8* %arrayidx22) #7
  %20 = load i8**, i8*** %labels, align 8
  %21 = load i32, i32* %copiedLabels, align 4
  %idxprom24 = sext i32 %21 to i64
  %arrayidx25 = getelementptr inbounds i8*, i8** %20, i64 %idxprom24
  store i8* %call23, i8** %arrayidx25, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body18
  %22 = load i8*, i8** %data.addr, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom26 = sext i32 %23 to i64
  %arrayidx27 = getelementptr inbounds i8, i8* %22, i64 %idxprom26
  %24 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %24 to i32
  %cmp29 = icmp ne i32 %conv28, 0
  br i1 %cmp29, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %25 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %25, 1
  store i32 %inc31, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %26 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %26, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.inc33

for.inc33:                                        ; preds = %while.end
  %27 = load i32, i32* %copiedLabels, align 4
  %inc34 = add nsw i32 %27, 1
  store i32 %inc34, i32* %copiedLabels, align 4
  br label %for.cond15

for.end35:                                        ; preds = %for.cond15
  %28 = load i8**, i8*** %labels, align 8
  %29 = load i32, i32* %labelCount, align 4
  %idxprom36 = sext i32 %29 to i64
  %arrayidx37 = getelementptr inbounds i8*, i8** %28, i64 %idxprom36
  store i8* null, i8** %arrayidx37, align 8
  br label %if.end38

if.end38:                                         ; preds = %for.end35, %for.end
  %30 = load i8**, i8*** %labels, align 8
  store i8** %30, i8*** %retval, align 8
  br label %return

return:                                           ; preds = %if.end38, %if.then
  %31 = load i8**, i8*** %retval, align 8
  ret i8** %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @parseConfigFile(i8* %configFileName, %struct.ConfigurationStruct* %config) #0 {
entry:
  %retval = alloca i1, align 1
  %configFileName.addr = alloca i8*, align 8
  %config.addr = alloca %struct.ConfigurationStruct*, align 8
  %data = alloca [1000 x i8], align 16
  %configFile = alloca %struct._IO_FILE*, align 8
  %fileNum = alloca i32, align 4
  %sigNum = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %configFileName, i8** %configFileName.addr, align 8
  store %struct.ConfigurationStruct* %config, %struct.ConfigurationStruct** %config.addr, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %configFile, align 8
  store i32 -1, i32* %fileNum, align 4
  store i32 -1, i32* %sigNum, align 4
  store i32 0, i32* %i, align 4
  %0 = load i8*, i8** %configFileName.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8.38, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %configFile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %configFileName.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.23.55, i64 0, i64 0), i8* %2)
  store i1 false, i1* %retval, align 1
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %configFileName.addr, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.24.56, i64 0, i64 0), i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.else
  %arraydecay = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call3 = call i8* @fgets(i8* %arraydecay, i32 1000, %struct._IO_FILE* %4)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call4 = call i32 @feof(%struct._IO_FILE* %5) #7
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %arraydecay6 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call7 = call i32 @strncmp(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.25.57, i64 0, i64 0), i8* %arraydecay6, i64 24) #9
  %cmp = icmp ne i32 %call7, 0
  br i1 %cmp, label %if.then8, label %if.end10

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.26.58, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  %arraydecay11 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call12 = call i8* @fgets(i8* %arraydecay11, i32 1000, %struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call13 = call i32 @feof(%struct._IO_FILE* %7) #7
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then19, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.end10
  %arraydecay16 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call17 = call i32 @strncmp(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i64 0, i64 0), i8* %arraydecay16, i64 5) #9
  %cmp18 = icmp ne i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %lor.lhs.false15, %if.end10
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.28.59, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end21:                                         ; preds = %lor.lhs.false15
  %arrayidx = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 6
  %call22 = call i32 @atoi(i8* %arrayidx) #9
  store i32 %call22, i32* %fileNum, align 4
  %8 = load i32, i32* %fileNum, align 4
  %cmp23 = icmp eq i32 %8, 0
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end21
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.29, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end26:                                         ; preds = %if.end21
  %arraydecay27 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call28 = call i8* @fgets(i8* %arraydecay27, i32 1000, %struct._IO_FILE* %9)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call29 = call i32 @feof(%struct._IO_FILE* %10) #7
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %if.then35, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %if.end26
  %arraydecay32 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call33 = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.30, i64 0, i64 0), i8* %arraydecay32, i64 10) #9
  %cmp34 = icmp ne i32 %call33, 0
  br i1 %cmp34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %lor.lhs.false31, %if.end26
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.31, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end37:                                         ; preds = %lor.lhs.false31
  %arrayidx38 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 11
  %call39 = call i32 @atoi(i8* %arrayidx38) #9
  store i32 %call39, i32* %sigNum, align 4
  %11 = load i32, i32* %sigNum, align 4
  %cmp40 = icmp eq i32 %11, 0
  br i1 %cmp40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end37
  %call42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.32, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end43:                                         ; preds = %if.end37
  %arraydecay44 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call45 = call i8* @fgets(i8* %arraydecay44, i32 1000, %struct._IO_FILE* %12)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call46 = call i32 @feof(%struct._IO_FILE* %13) #7
  %tobool47 = icmp ne i32 %call46, 0
  br i1 %tobool47, label %if.then52, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %if.end43
  %arraydecay49 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call50 = call i32 @strncmp(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i64 0, i64 0), i8* %arraydecay49, i64 11) #9
  %cmp51 = icmp ne i32 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %lor.lhs.false48, %if.end43
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.31, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end54:                                         ; preds = %lor.lhs.false48
  %arrayidx55 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 12
  %call56 = call i32 @strncmp(i8* %arrayidx55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.34, i64 0, i64 0), i64 4) #9
  %cmp57 = icmp eq i32 %call56, 0
  br i1 %cmp57, label %if.then58, label %if.else59

if.then58:                                        ; preds = %if.end54
  %14 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %14, i32 0, i32 2
  %15 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions, align 8
  %searchType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %15, i32 0, i32 0
  store i32 0, i32* %searchType, align 8
  br label %if.end62

if.else59:                                        ; preds = %if.end54
  %16 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions60 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %16, i32 0, i32 2
  %17 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions60, align 8
  %searchType61 = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %17, i32 0, i32 0
  store i32 1, i32* %searchType61, align 8
  br label %if.end62

if.end62:                                         ; preds = %if.else59, %if.then58
  %18 = load i32, i32* %fileNum, align 4
  %add = add nsw i32 %18, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 8
  %call63 = call noalias i8* @malloc(i64 %mul) #7
  %19 = bitcast i8* %call63 to %struct.GraphStruct**
  %20 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %20, i32 0, i32 0
  store %struct.GraphStruct** %19, %struct.GraphStruct*** %graphs, align 8
  %21 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs64 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %21, i32 0, i32 0
  %22 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs64, align 8
  %tobool65 = icmp ne %struct.GraphStruct** %22, null
  br i1 %tobool65, label %if.end68, label %if.then66

if.then66:                                        ; preds = %if.end62
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.35, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end68:                                         ; preds = %if.end62
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end68
  %23 = load i32, i32* %i, align 4
  %24 = load i32, i32* %fileNum, align 4
  %cmp69 = icmp slt i32 %23, %24
  br i1 %cmp69, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay71 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call72 = call i8* @fgets(i8* %arraydecay71, i32 1000, %struct._IO_FILE* %25)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call73 = call i32 @feof(%struct._IO_FILE* %26) #7
  %tobool74 = icmp ne i32 %call73, 0
  br i1 %tobool74, label %if.then80, label %lor.lhs.false75

lor.lhs.false75:                                  ; preds = %for.body
  %arraydecay76 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call77 = call i32 @strncmp(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.36, i64 0, i64 0), i8* %arraydecay76, i64 5) #9
  %cmp78 = icmp ne i32 %call77, 0
  br i1 %cmp78, label %if.then80, label %if.end82

if.then80:                                        ; preds = %lor.lhs.false75, %for.body
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.37, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end82:                                         ; preds = %lor.lhs.false75
  %arrayidx83 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 5
  call void @pruneLine(i8* %arrayidx83)
  %arrayidx84 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 5
  %call85 = call %struct.GraphStruct* @parseFile(i8* %arrayidx84)
  %27 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs86 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %27, i32 0, i32 0
  %28 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs86, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom = sext i32 %29 to i64
  %arrayidx87 = getelementptr inbounds %struct.GraphStruct*, %struct.GraphStruct** %28, i64 %idxprom
  store %struct.GraphStruct* %call85, %struct.GraphStruct** %arrayidx87, align 8
  %30 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs88 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %30, i32 0, i32 0
  %31 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs88, align 8
  %32 = load i32, i32* %i, align 4
  %idxprom89 = sext i32 %32 to i64
  %arrayidx90 = getelementptr inbounds %struct.GraphStruct*, %struct.GraphStruct** %31, i64 %idxprom89
  %33 = load %struct.GraphStruct*, %struct.GraphStruct** %arrayidx90, align 8
  %tobool91 = icmp ne %struct.GraphStruct* %33, null
  br i1 %tobool91, label %if.end96, label %if.then92

if.then92:                                        ; preds = %if.end82
  %arrayidx93 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 5
  %call94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0), i8* %arrayidx93)
  %34 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs95 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %34, i32 0, i32 0
  %35 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs95, align 8
  %36 = bitcast %struct.GraphStruct** %35 to i8*
  call void @free(i8* %36) #7
  store i1 false, i1* %retval, align 1
  br label %return

if.end96:                                         ; preds = %if.end82
  br label %for.inc

for.inc:                                          ; preds = %if.end96
  %37 = load i32, i32* %i, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %38 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs97 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %38, i32 0, i32 0
  %39 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs97, align 8
  %40 = load i32, i32* %fileNum, align 4
  %idxprom98 = sext i32 %40 to i64
  %arrayidx99 = getelementptr inbounds %struct.GraphStruct*, %struct.GraphStruct** %39, i64 %idxprom98
  store %struct.GraphStruct* null, %struct.GraphStruct** %arrayidx99, align 8
  %41 = load i32, i32* %sigNum, align 4
  %add100 = add nsw i32 %41, 1
  %conv101 = sext i32 %add100 to i64
  %mul102 = mul i64 %conv101, 8
  %call103 = call noalias i8* @malloc(i64 %mul102) #7
  %42 = bitcast i8* %call103 to i8***
  %43 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %43, i32 0, i32 1
  store i8*** %42, i8**** %signatures, align 8
  %44 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures104 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %44, i32 0, i32 1
  %45 = load i8***, i8**** %signatures104, align 8
  %tobool105 = icmp ne i8*** %45, null
  br i1 %tobool105, label %if.end108, label %if.then106

if.then106:                                       ; preds = %for.end
  %call107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.39, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end108:                                        ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond109

for.cond109:                                      ; preds = %for.inc141, %if.end108
  %46 = load i32, i32* %i, align 4
  %47 = load i32, i32* %sigNum, align 4
  %cmp110 = icmp slt i32 %46, %47
  br i1 %cmp110, label %for.body112, label %for.end143

for.body112:                                      ; preds = %for.cond109
  %arraydecay113 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call114 = call i8* @fgets(i8* %arraydecay113, i32 1000, %struct._IO_FILE* %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %configFile, align 8
  %call115 = call i32 @feof(%struct._IO_FILE* %49) #7
  %tobool116 = icmp ne i32 %call115, 0
  br i1 %tobool116, label %if.then122, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %for.body112
  %arraydecay118 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 0
  %call119 = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i64 0, i64 0), i8* %arraydecay118, i64 10) #9
  %cmp120 = icmp ne i32 %call119, 0
  br i1 %cmp120, label %if.then122, label %if.end124

if.then122:                                       ; preds = %lor.lhs.false117, %for.body112
  %call123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.41, i64 0, i64 0))
  store i1 false, i1* %retval, align 1
  br label %return

if.end124:                                        ; preds = %lor.lhs.false117
  %arrayidx125 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 10
  call void @pruneLine(i8* %arrayidx125)
  %arrayidx126 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 10
  %call127 = call i8** @parseSignature(i8* %arrayidx126)
  %50 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures128 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %50, i32 0, i32 1
  %51 = load i8***, i8**** %signatures128, align 8
  %52 = load i32, i32* %i, align 4
  %idxprom129 = sext i32 %52 to i64
  %arrayidx130 = getelementptr inbounds i8**, i8*** %51, i64 %idxprom129
  store i8** %call127, i8*** %arrayidx130, align 8
  %53 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures131 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %53, i32 0, i32 1
  %54 = load i8***, i8**** %signatures131, align 8
  %55 = load i32, i32* %i, align 4
  %idxprom132 = sext i32 %55 to i64
  %arrayidx133 = getelementptr inbounds i8**, i8*** %54, i64 %idxprom132
  %56 = load i8**, i8*** %arrayidx133, align 8
  %tobool134 = icmp ne i8** %56, null
  br i1 %tobool134, label %if.end140, label %if.then135

if.then135:                                       ; preds = %if.end124
  %arrayidx136 = getelementptr inbounds [1000 x i8], [1000 x i8]* %data, i64 0, i64 10
  %call137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i64 0, i64 0), i8* %arrayidx136)
  %57 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs138 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %57, i32 0, i32 0
  %58 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs138, align 8
  %59 = bitcast %struct.GraphStruct** %58 to i8*
  call void @free(i8* %59) #7
  %60 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures139 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %60, i32 0, i32 1
  %61 = load i8***, i8**** %signatures139, align 8
  %62 = bitcast i8*** %61 to i8*
  call void @free(i8* %62) #7
  store i1 false, i1* %retval, align 1
  br label %return

if.end140:                                        ; preds = %if.end124
  br label %for.inc141

for.inc141:                                       ; preds = %if.end140
  %63 = load i32, i32* %i, align 4
  %inc142 = add nsw i32 %63, 1
  store i32 %inc142, i32* %i, align 4
  br label %for.cond109

for.end143:                                       ; preds = %for.cond109
  %64 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures144 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %64, i32 0, i32 1
  %65 = load i8***, i8**** %signatures144, align 8
  %66 = load i32, i32* %sigNum, align 4
  %idxprom145 = sext i32 %66 to i64
  %arrayidx146 = getelementptr inbounds i8**, i8*** %65, i64 %idxprom145
  store i8** null, i8*** %arrayidx146, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end143, %if.then135, %if.then122, %if.then106, %if.then92, %if.then80, %if.then66, %if.then52, %if.then41, %if.then35, %if.then24, %if.then19, %if.then8, %if.then
  %67 = load i1, i1* %retval, align 1
  ret i1 %67
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @doMultiSearches(%struct.ConfigurationStruct* %config) #0 {
entry:
  %config.addr = alloca %struct.ConfigurationStruct*, align 8
  %result = alloca %struct.NodePtrVecStruct*, align 8
  %success = alloca i8, align 1
  %graph = alloca %struct.GraphStruct*, align 8
  %signature = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %debug = alloca i8*, align 8
  %tick = alloca double, align 8
  %tock = alloca double, align 8
  %hours = alloca i32, align 4
  %min = alloca i32, align 4
  %sec = alloca double, align 8
  store %struct.ConfigurationStruct* %config, %struct.ConfigurationStruct** %config.addr, align 8
  %call = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call, double* %tick, align 8
  %call1 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 64)
  store %struct.NodePtrVecStruct* %call1, %struct.NodePtrVecStruct** %result, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %0 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %0, i32 0, i32 1
  %1 = load i8***, i8**** %signatures, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds i8**, i8*** %1, i64 %idxprom
  %3 = load i8**, i8*** %arrayidx, align 8
  %cmp = icmp ne i8** %3, null
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %4 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %signatures2 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %4, i32 0, i32 1
  %5 = load i8***, i8**** %signatures2, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %6 to i64
  %arrayidx4 = getelementptr inbounds i8**, i8*** %5, i64 %idxprom3
  %7 = load i8**, i8*** %arrayidx4, align 8
  store i8** %7, i8*** %signature, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %8 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %8, i32 0, i32 0
  %9 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs, align 8
  %10 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds %struct.GraphStruct*, %struct.GraphStruct** %9, i64 %idxprom6
  %11 = load %struct.GraphStruct*, %struct.GraphStruct** %arrayidx7, align 8
  %cmp8 = icmp ne %struct.GraphStruct* %11, null
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond5
  %12 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %graphs10 = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %12, i32 0, i32 0
  %13 = load %struct.GraphStruct**, %struct.GraphStruct*** %graphs10, align 8
  %14 = load i32, i32* %j, align 4
  %idxprom11 = sext i32 %14 to i64
  %arrayidx12 = getelementptr inbounds %struct.GraphStruct*, %struct.GraphStruct** %13, i64 %idxprom11
  %15 = load %struct.GraphStruct*, %struct.GraphStruct** %arrayidx12, align 8
  store %struct.GraphStruct* %15, %struct.GraphStruct** %graph, align 8
  %16 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %16, i32 0, i32 0
  store i32 0, i32* %contentSize, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call13 = call i32 @fflush(%struct._IO_FILE* %17)
  %18 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %19 = load i8**, i8*** %signature, align 8
  %20 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %21 = load %struct.ConfigurationStruct*, %struct.ConfigurationStruct** %config.addr, align 8
  %searchOptions = getelementptr inbounds %struct.ConfigurationStruct, %struct.ConfigurationStruct* %21, i32 0, i32 2
  %22 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %searchOptions, align 8
  %searchType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %22, i32 0, i32 0
  %23 = load i32, i32* %searchType, align 8
  %call14 = call zeroext i1 @findLabelPath(%struct.GraphStruct* %18, i8** %19, %struct.NodePtrVecStruct* %20, i32 %23)
  %frombool = zext i1 %call14 to i8
  store i8 %frombool, i8* %success, align 1
  %24 = load i8, i8* %success, align 1
  %tobool = trunc i8 %24 to i1
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body9
  br label %if.end

if.else:                                          ; preds = %for.body9
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %25 = load i32, i32* %j, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %26 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %26, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  %call18 = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call18, double* %tock, align 8
  %27 = load double, double* %tock, align 8
  %28 = load double, double* %tick, align 8
  %sub = fsub double %27, %28
  store double %sub, double* %sec, align 8
  %29 = load double, double* %sec, align 8
  %conv = fptosi double %29 to i32
  %div = sdiv i32 %conv, 3600
  store i32 %div, i32* %hours, align 4
  %30 = load double, double* %sec, align 8
  %call19 = call double @fmod(double %30, double 3.600000e+03) #7
  store double %call19, double* %sec, align 8
  %31 = load double, double* %sec, align 8
  %conv20 = fptosi double %31 to i32
  %div21 = sdiv i32 %conv20, 60
  store i32 %div21, i32* %min, align 4
  %32 = load double, double* %sec, align 8
  %call22 = call double @fmod(double %32, double 6.000000e+01) #7
  store double %call22, double* %sec, align 8
  %33 = load i32, i32* %hours, align 4
  %34 = load i32, i32* %min, align 4
  %35 = load double, double* %sec, align 8
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.64, i64 0, i64 0), i32 %33, i32 %34, double %35)
  ret void
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @findLabelPath(%struct.GraphStruct* %graph, i8** %labels, %struct.NodePtrVecStruct* %result, i32 %searchType) #0 {
entry:
  %retval = alloca i1, align 1
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %labels.addr = alloca i8**, align 8
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  %searchType.addr = alloca i32, align 4
  %startNodes = alloca %struct.NodePtrVecStruct*, align 8
  %i = alloca i32, align 4
  %found = alloca i8, align 1
  %visited = alloca %struct.BitfieldStruct*, align 8
  %element = alloca %struct.EdgeReferencesStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store i8** %labels, i8*** %labels.addr, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  store i32 %searchType, i32* %searchType.addr, align 4
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %startNodes, align 8
  store i8 0, i8* %found, align 1
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %0, i32 0, i32 1
  %1 = load i32, i32* %totalNodes, align 8
  %call = call %struct.BitfieldStruct* @Bitfield_new(i32 %1)
  store %struct.BitfieldStruct* %call, %struct.BitfieldStruct** %visited, align 8
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %tobool = icmp ne %struct.GraphStruct* %2, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8**, i8*** %labels.addr, align 8
  %tobool1 = icmp ne i8** %3, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load i8**, i8*** %labels.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %4, i64 0
  %5 = load i8*, i8** %arrayidx, align 8
  %tobool3 = icmp ne i8* %5, null
  br i1 %tobool3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %6 = load i8**, i8*** %labels.addr, align 8
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 1
  %7 = load i8*, i8** %arrayidx5, align 8
  %tobool6 = icmp ne i8* %7, null
  br i1 %tobool6, label %lor.lhs.false7, label %if.then

lor.lhs.false7:                                   ; preds = %lor.lhs.false4
  %8 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool8 = icmp ne %struct.NodePtrVecStruct* %8, null
  br i1 %tobool8, label %lor.lhs.false9, label %if.then

lor.lhs.false9:                                   ; preds = %lor.lhs.false7
  %9 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  %tobool10 = icmp ne %struct.BitfieldStruct* %9, null
  br i1 %tobool10, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false7, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false9
  %10 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %10, i32 0, i32 4
  %11 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap, align 8
  %12 = load i8**, i8*** %labels.addr, align 8
  %arrayidx11 = getelementptr inbounds i8*, i8** %12, i64 0
  %13 = load i8*, i8** %arrayidx11, align 8
  %call12 = call %struct.NodePtrVecStruct* @SystemCallMap_findLabeledNodes(%struct.SystemCallMapStruct* %11, i8* %13)
  store %struct.NodePtrVecStruct* %call12, %struct.NodePtrVecStruct** %startNodes, align 8
  %14 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %startNodes, align 8
  %tobool13 = icmp ne %struct.NodePtrVecStruct* %14, null
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end15:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end15
  %15 = load i32, i32* %i, align 4
  %16 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %startNodes, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %16, i32 0, i32 0
  %17 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %15, %17
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %18 = load i8, i8* %found, align 1
  %tobool16 = trunc i8 %18 to i1
  %lnot = xor i1 %tobool16, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %19 = phi i1 [ false, %for.cond ], [ %lnot, %land.rhs ]
  br i1 %19, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %20 = load i32, i32* %searchType.addr, align 4
  %cmp17 = icmp eq i32 %20, 1
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %for.body
  %21 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %searchDiagram = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %21, i32 0, i32 3
  %22 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %searchDiagram, align 8
  %23 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %startNodes, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %23, i32 0, i32 2
  %24 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom = sext i32 %25 to i64
  %arrayidx19 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %24, i64 %idxprom
  %26 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx19, align 8
  %call20 = call %struct.EdgeReferencesStruct* @SearchDiagram_findNode(%struct.EdgeReferencesStruct* %22, %struct.NodeStruct* %26)
  store %struct.EdgeReferencesStruct* %call20, %struct.EdgeReferencesStruct** %element, align 8
  %27 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %tobool21 = icmp ne %struct.EdgeReferencesStruct* %27, null
  br i1 %tobool21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.then18
  %28 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %node = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %28, i32 0, i32 0
  %29 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %30 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %edgeReferenceArray = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %30, i32 0, i32 1
  %31 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray, align 8
  %32 = load i8**, i8*** %labels.addr, align 8
  %arrayidx23 = getelementptr inbounds i8*, i8** %32, i64 1
  %33 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %34 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  %call24 = call zeroext i1 @SearchDiagram_findSignatureAlongEdges(%struct.NodeStruct* %29, %struct.EdgeReferencesStruct* %31, i8** %arrayidx23, %struct.NodePtrVecStruct* %33, %struct.BitfieldStruct* %34)
  %frombool = zext i1 %call24 to i8
  store i8 %frombool, i8* %found, align 1
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.then18
  br label %if.end32

if.else:                                          ; preds = %for.body
  %35 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %startNodes, align 8
  %vector26 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %35, i32 0, i32 2
  %36 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector26, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %37 to i64
  %arrayidx28 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %36, i64 %idxprom27
  %38 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx28, align 8
  %39 = load i8**, i8*** %labels.addr, align 8
  %arrayidx29 = getelementptr inbounds i8*, i8** %39, i64 1
  %40 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %41 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  %call30 = call zeroext i1 @findNextLabel(%struct.NodeStruct* %38, i8** %arrayidx29, %struct.NodePtrVecStruct* %40, %struct.BitfieldStruct* %41)
  %frombool31 = zext i1 %call30 to i8
  store i8 %frombool31, i8* %found, align 1
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.end25
  %42 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  call void (%struct.BitfieldStruct*, ...) bitcast (void (%struct.BitfieldStruct*)* @Bitfield_clear to void (%struct.BitfieldStruct*, ...)*)(%struct.BitfieldStruct* %42)
  %43 = load i8, i8* %found, align 1
  %tobool33 = trunc i8 %43 to i1
  br i1 %tobool33, label %if.end38, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end32
  %44 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %contentSize34 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %44, i32 0, i32 0
  %45 = load i32, i32* %contentSize34, align 8
  %cmp35 = icmp ne i32 %45, 0
  br i1 %cmp35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %land.lhs.true
  %46 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %contentSize37 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %46, i32 0, i32 0
  store i32 0, i32* %contentSize37, align 8
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %land.lhs.true, %if.end32
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %47 = load i32, i32* %i, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %48 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  call void @Bitfield_delete(%struct.BitfieldStruct* %48)
  %49 = load i8, i8* %found, align 1
  %tobool39 = trunc i8 %49 to i1
  store i1 %tobool39, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end, %if.then14, %if.then
  %50 = load i1, i1* %retval, align 1
  ret i1 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @findNextLabel(%struct.NodeStruct* %node, i8** %labels, %struct.NodePtrVecStruct* %result, %struct.BitfieldStruct* %visited) #0 {
entry:
  %retval = alloca i1, align 1
  %node.addr = alloca %struct.NodeStruct*, align 8
  %labels.addr = alloca i8**, align 8
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  %visited.addr = alloca %struct.BitfieldStruct*, align 8
  %edge = alloca %struct.EdgeListStruct*, align 8
  %success = alloca i8, align 1
  %nextLegResult = alloca %struct.NodePtrVecStruct*, align 8
  %nextLegVisited = alloca %struct.BitfieldStruct*, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store i8** %labels, i8*** %labels.addr, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  store %struct.BitfieldStruct* %visited, %struct.BitfieldStruct** %visited.addr, align 8
  store i8 0, i8* %success, align 1
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %nextLegResult, align 8
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %nextLegVisited, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %labels.addr, align 8
  %tobool1 = icmp ne i8** %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %2, null
  br i1 %tobool3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %tobool5 = icmp ne %struct.BitfieldStruct* %3, null
  br i1 %tobool5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false4
  %4 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call = call zeroext i1 @Bitfield_nodeVisited(%struct.BitfieldStruct* %4, %struct.NodeStruct* %5)
  br i1 %call, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end7:                                          ; preds = %if.end
  %6 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call8 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %6, %struct.NodeStruct* %7)
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %8, i32 0, i32 7
  %9 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  store %struct.EdgeListStruct* %9, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %10 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %cmp = icmp ne %struct.EdgeListStruct* %10, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %11, i32 0, i32 1
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %12, i32 0, i32 2
  %13 = load i8*, i8** %label, align 8
  %tobool9 = icmp ne i8* %13, null
  br i1 %tobool9, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %for.body
  %14 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode10 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %14, i32 0, i32 1
  %15 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode10, align 8
  %label11 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %15, i32 0, i32 2
  %16 = load i8*, i8** %label11, align 8
  %17 = load i8**, i8*** %labels.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %17, i64 0
  %18 = load i8*, i8** %arrayidx, align 8
  %call12 = call i32 @strcmp(i8* %16, i8* %18) #9
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.end29

if.then14:                                        ; preds = %land.lhs.true
  %19 = load i8**, i8*** %labels.addr, align 8
  %arrayidx15 = getelementptr inbounds i8*, i8** %19, i64 1
  %20 = load i8*, i8** %arrayidx15, align 8
  %cmp16 = icmp ne i8* %20, null
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then14
  %call18 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 50)
  store %struct.NodePtrVecStruct* %call18, %struct.NodePtrVecStruct** %nextLegResult, align 8
  %21 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %bitsNeeded = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %21, i32 0, i32 0
  %22 = load i32, i32* %bitsNeeded, align 8
  %call19 = call %struct.BitfieldStruct* @Bitfield_new(i32 %22)
  store %struct.BitfieldStruct* %call19, %struct.BitfieldStruct** %nextLegVisited, align 8
  %23 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode20 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %23, i32 0, i32 1
  %24 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode20, align 8
  %25 = load i8**, i8*** %labels.addr, align 8
  %arrayidx21 = getelementptr inbounds i8*, i8** %25, i64 1
  %26 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  %27 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  %call22 = call zeroext i1 @findNextLabel(%struct.NodeStruct* %24, i8** %arrayidx21, %struct.NodePtrVecStruct* %26, %struct.BitfieldStruct* %27)
  %frombool = zext i1 %call22 to i8
  store i8 %frombool, i8* %success, align 1
  %28 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  call void @Bitfield_delete(%struct.BitfieldStruct* %28)
  %29 = load i8, i8* %success, align 1
  %tobool23 = trunc i8 %29 to i1
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.then17
  %30 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %31 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  call void @NodePtrVec_appendVectors(%struct.NodePtrVecStruct* %30, %struct.NodePtrVecStruct* %31, i1 zeroext true)
  %32 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %32)
  store i1 true, i1* %retval, align 1
  br label %return

if.end25:                                         ; preds = %if.then17
  br label %if.end28

if.else:                                          ; preds = %if.then14
  %33 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %34 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode26 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %34, i32 0, i32 1
  %35 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode26, align 8
  %call27 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %33, %struct.NodeStruct* %35)
  store i1 true, i1* %retval, align 1
  br label %return

if.end28:                                         ; preds = %if.end25
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %36 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %36, i32 0, i32 2
  %37 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %37, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %38 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %edges30 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %38, i32 0, i32 7
  %39 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges30, align 8
  store %struct.EdgeListStruct* %39, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc40, %for.end
  %40 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %cmp32 = icmp ne %struct.EdgeListStruct* %40, null
  br i1 %cmp32, label %for.body33, label %for.end42

for.body33:                                       ; preds = %for.cond31
  %41 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode34 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %41, i32 0, i32 1
  %42 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode34, align 8
  %43 = load i8**, i8*** %labels.addr, align 8
  %44 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %45 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %call35 = call zeroext i1 @findNextLabel(%struct.NodeStruct* %42, i8** %43, %struct.NodePtrVecStruct* %44, %struct.BitfieldStruct* %45)
  %frombool36 = zext i1 %call35 to i8
  store i8 %frombool36, i8* %success, align 1
  %46 = load i8, i8* %success, align 1
  %tobool37 = trunc i8 %46 to i1
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %for.body33
  store i1 true, i1* %retval, align 1
  br label %return

if.end39:                                         ; preds = %for.body33
  br label %for.inc40

for.inc40:                                        ; preds = %if.end39
  %47 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %nextEdge41 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %47, i32 0, i32 2
  %48 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge41, align 8
  store %struct.EdgeListStruct* %48, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond31

for.end42:                                        ; preds = %for.cond31
  %49 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %call43 = call %struct.NodeStruct* @NodePtrVec_pop(%struct.NodePtrVecStruct* %49)
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end42, %if.then38, %if.else, %if.then24, %if.then6, %if.then
  %50 = load i1, i1* %retval, align 1
  ret i1 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @findAndRecordAllPaths(%struct.NodeStruct* %node, i8** %labels, i32* %labelIdxs, %struct.NodePtrVecStruct* %result, %struct.BitfieldStruct* %visited, %struct.NodeVecVecStruct* %storage, %struct.SearchOptionsStruct* %options) #0 {
entry:
  %node.addr = alloca %struct.NodeStruct*, align 8
  %labels.addr = alloca i8**, align 8
  %labelIdxs.addr = alloca i32*, align 8
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  %visited.addr = alloca %struct.BitfieldStruct*, align 8
  %storage.addr = alloca %struct.NodeVecVecStruct*, align 8
  %options.addr = alloca %struct.SearchOptionsStruct*, align 8
  %edge = alloca %struct.EdgeListStruct*, align 8
  %nextLegVisited = alloca %struct.BitfieldStruct*, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store i8** %labels, i8*** %labels.addr, align 8
  store i32* %labelIdxs, i32** %labelIdxs.addr, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  store %struct.BitfieldStruct* %visited, %struct.BitfieldStruct** %visited.addr, align 8
  store %struct.NodeVecVecStruct* %storage, %struct.NodeVecVecStruct** %storage.addr, align 8
  store %struct.SearchOptionsStruct* %options, %struct.SearchOptionsStruct** %options.addr, align 8
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %nextLegVisited, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %labels.addr, align 8
  %tobool1 = icmp ne i8** %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32*, i32** %labelIdxs.addr, align 8
  %tobool3 = icmp ne i32* %2, null
  br i1 %tobool3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool5 = icmp ne %struct.NodePtrVecStruct* %3, null
  br i1 %tobool5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %tobool7 = icmp ne %struct.BitfieldStruct* %4, null
  br i1 %tobool7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false6
  %5 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call = call zeroext i1 @Bitfield_nodeVisited(%struct.BitfieldStruct* %5, %struct.NodeStruct* %6)
  br i1 %call, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  br label %return

if.end9:                                          ; preds = %if.end
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call10 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %7, %struct.NodeStruct* %8)
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %9, i32 0, i32 7
  %10 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  store %struct.EdgeListStruct* %10, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %11 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %cmp = icmp ne %struct.EdgeListStruct* %11, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %12, i32 0, i32 1
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 2
  %14 = load i8*, i8** %label, align 8
  %tobool11 = icmp ne i8* %14, null
  br i1 %tobool11, label %land.lhs.true, label %if.end30

land.lhs.true:                                    ; preds = %for.body
  %15 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode12 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %15, i32 0, i32 1
  %16 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode12, align 8
  %label13 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %16, i32 0, i32 2
  %17 = load i8*, i8** %label13, align 8
  %18 = load i8**, i8*** %labels.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %18, i64 0
  %19 = load i8*, i8** %arrayidx, align 8
  %call14 = call i32 @strcmp(i8* %17, i8* %19) #9
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then16, label %if.end30

if.then16:                                        ; preds = %land.lhs.true
  %20 = load i8**, i8*** %labels.addr, align 8
  %arrayidx17 = getelementptr inbounds i8*, i8** %20, i64 1
  %21 = load i8*, i8** %arrayidx17, align 8
  %cmp18 = icmp ne i8* %21, null
  br i1 %cmp18, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.then16
  %22 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %bitsNeeded = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %22, i32 0, i32 0
  %23 = load i32, i32* %bitsNeeded, align 8
  %call20 = call %struct.BitfieldStruct* @Bitfield_new(i32 %23)
  store %struct.BitfieldStruct* %call20, %struct.BitfieldStruct** %nextLegVisited, align 8
  %24 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode21 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %24, i32 0, i32 1
  %25 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode21, align 8
  %26 = load i8**, i8*** %labels.addr, align 8
  %arrayidx22 = getelementptr inbounds i8*, i8** %26, i64 1
  %27 = load i32*, i32** %labelIdxs.addr, align 8
  %arrayidx23 = getelementptr inbounds i32, i32* %27, i64 1
  %28 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %29 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  %30 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %storage.addr, align 8
  %31 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  call void @findAndRecordAllPaths(%struct.NodeStruct* %25, i8** %arrayidx22, i32* %arrayidx23, %struct.NodePtrVecStruct* %28, %struct.BitfieldStruct* %29, %struct.NodeVecVecStruct* %30, %struct.SearchOptionsStruct* %31)
  %32 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  call void @Bitfield_delete(%struct.BitfieldStruct* %32)
  br label %if.end29

if.else:                                          ; preds = %if.then16
  %33 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %34 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode24 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %34, i32 0, i32 1
  %35 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode24, align 8
  %call25 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %33, %struct.NodeStruct* %35)
  %36 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %37 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode26 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %37, i32 0, i32 1
  %38 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode26, align 8
  %call27 = call zeroext i1 @Bitfield_nodeVisited(%struct.BitfieldStruct* %36, %struct.NodeStruct* %38)
  %39 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %storage.addr, align 8
  %40 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %41 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  call void @logResult(%struct.NodeVecVecStruct* %39, %struct.NodePtrVecStruct* %40, %struct.SearchOptionsStruct* %41)
  %42 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %call28 = call %struct.NodeStruct* @NodePtrVec_pop(%struct.NodePtrVecStruct* %42)
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then19
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end30
  %43 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %43, i32 0, i32 2
  %44 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %44, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %45 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %edges31 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %45, i32 0, i32 7
  %46 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges31, align 8
  store %struct.EdgeListStruct* %46, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc36, %for.end
  %47 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %cmp33 = icmp ne %struct.EdgeListStruct* %47, null
  br i1 %cmp33, label %for.body34, label %for.end38

for.body34:                                       ; preds = %for.cond32
  %48 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %targetNode35 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %48, i32 0, i32 1
  %49 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode35, align 8
  %50 = load i8**, i8*** %labels.addr, align 8
  %51 = load i32*, i32** %labelIdxs.addr, align 8
  %52 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %53 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %54 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %storage.addr, align 8
  %55 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  call void @findAndRecordAllPaths(%struct.NodeStruct* %49, i8** %50, i32* %51, %struct.NodePtrVecStruct* %52, %struct.BitfieldStruct* %53, %struct.NodeVecVecStruct* %54, %struct.SearchOptionsStruct* %55)
  br label %for.inc36

for.inc36:                                        ; preds = %for.body34
  %56 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edge, align 8
  %nextEdge37 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %56, i32 0, i32 2
  %57 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge37, align 8
  store %struct.EdgeListStruct* %57, %struct.EdgeListStruct** %edge, align 8
  br label %for.cond32

for.end38:                                        ; preds = %for.cond32
  %58 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %call39 = call %struct.NodeStruct* @NodePtrVec_pop(%struct.NodePtrVecStruct* %58)
  br label %return

return:                                           ; preds = %for.end38, %if.then8, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @logResult(%struct.NodeVecVecStruct* %storage, %struct.NodePtrVecStruct* %result, %struct.SearchOptionsStruct* %options) #0 {
entry:
  %storage.addr = alloca %struct.NodeVecVecStruct*, align 8
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  %options.addr = alloca %struct.SearchOptionsStruct*, align 8
  %tips = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.NodeVecVecStruct* %storage, %struct.NodeVecVecStruct** %storage.addr, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  store %struct.SearchOptionsStruct* %options, %struct.SearchOptionsStruct** %options.addr, align 8
  %call = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 2)
  store %struct.NodePtrVecStruct* %call, %struct.NodePtrVecStruct** %tips, align 8
  %0 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %storage.addr, align 8
  %tobool = icmp ne %struct.NodeVecVecStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool1 = icmp ne %struct.NodePtrVecStruct* %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %tips, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %2, null
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %3 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %multiThreaded = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %3, i32 0, i32 1
  %4 = load i8, i8* %multiThreaded, align 4
  %tobool4 = trunc i8 %4 to i1
  br i1 %tobool4, label %if.end7, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end
  %5 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %doStatistics = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %5, i32 0, i32 2
  %6 = load i8, i8* %doStatistics, align 1
  %tobool5 = trunc i8 %6 to i1
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  call void @logStats(%struct.NodePtrVecStruct* %7)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %land.lhs.true, %if.end
  %8 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %tips, align 8
  %9 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %9, i32 0, i32 2
  %10 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %10, i64 0
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %call8 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %8, %struct.NodeStruct* %11)
  %12 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %tips, align 8
  %13 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %vector9 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %13, i32 0, i32 2
  %14 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector9, align 8
  %15 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %15, i32 0, i32 0
  %16 = load i32, i32* %contentSize, align 8
  %sub = sub nsw i32 %16, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx10 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %14, i64 %idxprom
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx10, align 8
  %call11 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %12, %struct.NodeStruct* %17)
  %18 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %storage.addr, align 8
  %19 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %tips, align 8
  %call12 = call zeroext i1 @NodeVecVec_insert(%struct.NodeVecVecStruct* %18, %struct.NodePtrVecStruct* %19)
  br i1 %call12, label %if.end16, label %if.then13

if.then13:                                        ; preds = %if.end7
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8.65, i64 0, i64 0))
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call15 = call i32 @fflush(%struct._IO_FILE* %20)
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end7
  %21 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %tips, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %21)
  br label %return

return:                                           ; preds = %if.end16, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @logStats(%struct.NodePtrVecStruct* %result) #0 {
entry:
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %tobool1 = icmp ne %struct.StatsStruct* %1, null
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  %call = call %struct.StatsStruct* (...) bitcast (%struct.StatsStruct* ()* @Stats_new to %struct.StatsStruct* (...)*)()
  store %struct.StatsStruct* %call, %struct.StatsStruct** @globalStats, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %2 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %call4 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %2, %struct.NodePtrVecStruct* %3)
  br label %return

return:                                           ; preds = %if.end3, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @findAllPossibleLegs(%struct.GraphStruct* %graph, i32 %searchType) #0 {
entry:
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %searchType.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %found = alloca i32, align 4
  %searches = alloca i32, align 4
  %tick = alloca double, align 8
  %tock = alloca double, align 8
  %hours = alloca i32, align 4
  %min = alloca i32, align 4
  %sec = alloca double, align 8
  %timeStr = alloca [50 x i8], align 16
  %fullSignature = alloca [3 x i8*], align 16
  %fullIntSignature = alloca [3 x i32], align 4
  %result = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store i32 %searchType, i32* %searchType.addr, align 4
  store i32 0, i32* %found, align 4
  store i32 0, i32* %searches, align 4
  %call = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call, double* %tick, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1.68, i64 0, i64 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %2, i32 0, i32 4
  %3 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %3, i32 0, i32 0
  %4 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %4
  br i1 %cmp, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap3 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %6, i32 0, i32 4
  %7 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap3, align 8
  %contentSize4 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %7, i32 0, i32 0
  %8 = load i32, i32* %contentSize4, align 8
  %cmp5 = icmp slt i32 %5, %8
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %9 = load i32, i32* %searches, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %searches, align 4
  %10 = bitcast [3 x i8*]* %fullSignature to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 24, i1 false)
  %11 = bitcast [3 x i32]* %fullIntSignature to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 bitcast ([3 x i32]* @__const.findAllPossibleLegs.fullIntSignature to i8*), i64 12, i1 false)
  %12 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap7 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %12, i32 0, i32 4
  %13 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap7, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %13, i32 0, i32 2
  %14 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %14, i64 %idxprom
  %16 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  %label = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %16, i32 0, i32 0
  %17 = load i8*, i8** %label, align 8
  %arrayidx8 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 0
  store i8* %17, i8** %arrayidx8, align 16
  %18 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap9 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %18, i32 0, i32 4
  %19 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap9, align 8
  %vector10 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %19, i32 0, i32 2
  %20 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector10, align 8
  %21 = load i32, i32* %j, align 4
  %idxprom11 = sext i32 %21 to i64
  %arrayidx12 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %20, i64 %idxprom11
  %22 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx12, align 8
  %label13 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %22, i32 0, i32 0
  %23 = load i8*, i8** %label13, align 8
  %arrayidx14 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 1
  store i8* %23, i8** %arrayidx14, align 8
  %24 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds [3 x i32], [3 x i32]* %fullIntSignature, i64 0, i64 0
  store i32 %24, i32* %arrayidx15, align 4
  %25 = load i32, i32* %j, align 4
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %fullIntSignature, i64 0, i64 1
  store i32 %25, i32* %arrayidx16, align 4
  %call17 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 25)
  store %struct.NodePtrVecStruct* %call17, %struct.NodePtrVecStruct** %result, align 8
  %26 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %arraydecay = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 0
  %27 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %28 = load i32, i32* %searchType.addr, align 4
  %call18 = call zeroext i1 @findLabelPath(%struct.GraphStruct* %26, i8** %arraydecay, %struct.NodePtrVecStruct* %27, i32 %28)
  br i1 %call18, label %if.then, label %if.else

if.then:                                          ; preds = %for.body6
  %29 = load i32, i32* %found, align 4
  %inc19 = add nsw i32 %29, 1
  store i32 %inc19, i32* %found, align 4
  br label %if.end

if.else:                                          ; preds = %for.body6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %30 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %30, null
  br i1 %tobool, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end
  %31 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %31)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end21
  %32 = load i32, i32* %j, align 4
  %inc22 = add nsw i32 %32, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %33 = load i32, i32* %i, align 4
  %inc24 = add nsw i32 %33, 1
  store i32 %inc24, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  %call26 = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call26, double* %tock, align 8
  %34 = load double, double* %tock, align 8
  %35 = load double, double* %tick, align 8
  %sub = fsub double %34, %35
  store double %sub, double* %sec, align 8
  %36 = load double, double* %sec, align 8
  %conv = fptosi double %36 to i32
  %div = sdiv i32 %conv, 3600
  store i32 %div, i32* %hours, align 4
  %37 = load double, double* %sec, align 8
  %call27 = call double @fmod(double %37, double 3.600000e+03) #7
  store double %call27, double* %sec, align 8
  %38 = load double, double* %sec, align 8
  %conv28 = fptosi double %38 to i32
  %div29 = sdiv i32 %conv28, 60
  store i32 %div29, i32* %min, align 4
  %39 = load double, double* %sec, align 8
  %call30 = call double @fmod(double %39, double 6.000000e+01) #7
  store double %call30, double* %sec, align 8
  %40 = load i32, i32* %found, align 4
  %41 = load i32, i32* %searches, align 4
  %42 = load i32, i32* %hours, align 4
  %43 = load i32, i32* %min, align 4
  %44 = load double, double* %sec, align 8
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.2.69, i64 0, i64 0), i32 %40, i32 %41, i32 %42, i32 %43, double %44)
  %arrayidx32 = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  store i8 0, i8* %arrayidx32, align 16
  %arraydecay33 = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  %45 = load i32, i32* %hours, align 4
  %46 = load i32, i32* %min, align 4
  %47 = load double, double* %sec, align 8
  %call34 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3.70, i64 0, i64 0), i32 %45, i32 %46, double %47) #7
  %48 = load i32, i32* %found, align 4
  call void @YAMLWriteInt(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.71, i64 0, i64 0), i32 %48)
  %arraydecay35 = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  call void @YAMLWriteString(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5.72, i64 0, i64 0), i8* %arraydecay35)
  %49 = load i32, i32* %found, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @findAndLogAllPossibleLegs(%struct.GraphStruct* %graph, %struct.SearchOptionsStruct* %options) #0 {
entry:
  %retval = alloca i32, align 4
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %options.addr = alloca %struct.SearchOptionsStruct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %found = alloca i32, align 4
  %searches = alloca i32, align 4
  %tick = alloca double, align 8
  %tock = alloca double, align 8
  %hours = alloca i32, align 4
  %min = alloca i32, align 4
  %sec = alloca double, align 8
  %maxThreads = alloca i32, align 4
  %lastingResults = alloca %struct.NodeVecVecStruct**, align 8
  %optimizedGraph = alloca %struct.GraphStruct*, align 8
  %timeStr = alloca [50 x i8], align 16
  %myThread = alloca i32, align 4
  %myResults = alloca %struct.NodeVecVecStruct*, align 8
  %fullSignature = alloca [3 x i8*], align 16
  %fullIntSignature = alloca [3 x i32], align 4
  %result = alloca %struct.NodePtrVecStruct*, align 8
  %visited = alloca %struct.BitfieldStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  store %struct.SearchOptionsStruct* %options, %struct.SearchOptionsStruct** %options.addr, align 8
  store i32 0, i32* %found, align 4
  store i32 0, i32* %searches, align 4
  store i32 1, i32* %maxThreads, align 4
  store %struct.GraphStruct* null, %struct.GraphStruct** %optimizedGraph, align 8
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %tobool = icmp ne %struct.GraphStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call, double* %tick, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1.68, i64 0, i64 0))
  store i32 0, i32* %myThread, align 4
  store %struct.NodeVecVecStruct* null, %struct.NodeVecVecStruct** %myResults, align 8
  store i32 1, i32* %maxThreads, align 4
  %2 = load i32, i32* %maxThreads, align 4
  %cmp = icmp sgt i32 %2, 1
  %3 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %multiThreaded = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %3, i32 0, i32 1
  %frombool = zext i1 %cmp to i8
  store i8 %frombool, i8* %multiThreaded, align 4
  %4 = load i32, i32* %maxThreads, align 4
  %add = add nsw i32 %4, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 8
  %call2 = call noalias i8* @malloc(i64 %mul) #7
  %5 = bitcast i8* %call2 to %struct.NodeVecVecStruct**
  store %struct.NodeVecVecStruct** %5, %struct.NodeVecVecStruct*** %lastingResults, align 8
  %6 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %lastingResults, align 8
  %7 = load i32, i32* %maxThreads, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %6, i64 %idxprom
  store %struct.NodeVecVecStruct* null, %struct.NodeVecVecStruct** %arrayidx, align 8
  %call3 = call %struct.NodeVecVecStruct* @NodeVecVec_new(i32 64)
  %8 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %lastingResults, align 8
  %9 = load i32, i32* %myThread, align 4
  %idxprom4 = sext i32 %9 to i64
  %arrayidx5 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %8, i64 %idxprom4
  store %struct.NodeVecVecStruct* %call3, %struct.NodeVecVecStruct** %arrayidx5, align 8
  %10 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %lastingResults, align 8
  %11 = load i32, i32* %myThread, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %10, i64 %idxprom6
  %12 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %arrayidx7, align 8
  store %struct.NodeVecVecStruct* %12, %struct.NodeVecVecStruct** %myResults, align 8
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.6.75, i64 0, i64 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc57, %if.end
  %13 = load i32, i32* %i, align 4
  %14 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %14, i32 0, i32 4
  %15 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %15, i32 0, i32 0
  %16 = load i32, i32* %contentSize, align 8
  %cmp9 = icmp slt i32 %13, %16
  br i1 %cmp9, label %for.body, label %for.end59

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc54, %for.body
  %17 = load i32, i32* %j, align 4
  %18 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap12 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %18, i32 0, i32 4
  %19 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap12, align 8
  %contentSize13 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %19, i32 0, i32 0
  %20 = load i32, i32* %contentSize13, align 8
  %cmp14 = icmp slt i32 %17, %20
  br i1 %cmp14, label %for.body16, label %for.end56

for.body16:                                       ; preds = %for.cond11
  %21 = load i32, i32* %searches, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %searches, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc, %for.body16
  %22 = load i32, i32* %k, align 4
  %23 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap18 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %23, i32 0, i32 4
  %24 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap18, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %24, i32 0, i32 2
  %25 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %26 to i64
  %arrayidx20 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %25, i64 %idxprom19
  %27 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx20, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %27, i32 0, i32 2
  %28 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes, align 8
  %contentSize21 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %28, i32 0, i32 0
  %29 = load i32, i32* %contentSize21, align 8
  %cmp22 = icmp slt i32 %22, %29
  br i1 %cmp22, label %for.body24, label %for.end

for.body24:                                       ; preds = %for.cond17
  %30 = bitcast [3 x i8*]* %fullSignature to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 24, i1 false)
  %31 = bitcast [3 x i32]* %fullIntSignature to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %31, i8* align 4 bitcast ([3 x i32]* @__const.findAndLogAllPossibleLegs.fullIntSignature to i8*), i64 12, i1 false)
  %32 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap25 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %32, i32 0, i32 4
  %33 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap25, align 8
  %vector26 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %33, i32 0, i32 2
  %34 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector26, align 8
  %35 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %35 to i64
  %arrayidx28 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %34, i64 %idxprom27
  %36 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx28, align 8
  %label = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %36, i32 0, i32 0
  %37 = load i8*, i8** %label, align 8
  %arrayidx29 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 0
  store i8* %37, i8** %arrayidx29, align 16
  %38 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap30 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %38, i32 0, i32 4
  %39 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap30, align 8
  %vector31 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %39, i32 0, i32 2
  %40 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector31, align 8
  %41 = load i32, i32* %j, align 4
  %idxprom32 = sext i32 %41 to i64
  %arrayidx33 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %40, i64 %idxprom32
  %42 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx33, align 8
  %label34 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %42, i32 0, i32 0
  %43 = load i8*, i8** %label34, align 8
  %arrayidx35 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 1
  store i8* %43, i8** %arrayidx35, align 8
  %44 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds [3 x i32], [3 x i32]* %fullIntSignature, i64 0, i64 0
  store i32 %44, i32* %arrayidx36, align 4
  %45 = load i32, i32* %j, align 4
  %arrayidx37 = getelementptr inbounds [3 x i32], [3 x i32]* %fullIntSignature, i64 0, i64 1
  store i32 %45, i32* %arrayidx37, align 4
  %call38 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 16)
  store %struct.NodePtrVecStruct* %call38, %struct.NodePtrVecStruct** %result, align 8
  %46 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %totalNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %46, i32 0, i32 1
  %47 = load i32, i32* %totalNodes, align 8
  %call39 = call %struct.BitfieldStruct* @Bitfield_new(i32 %47)
  store %struct.BitfieldStruct* %call39, %struct.BitfieldStruct** %visited, align 8
  %48 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %systemCallMap40 = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %48, i32 0, i32 4
  %49 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCallMap40, align 8
  %vector41 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %49, i32 0, i32 2
  %50 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector41, align 8
  %51 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %51 to i64
  %arrayidx43 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %50, i64 %idxprom42
  %52 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx43, align 8
  %nodes44 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %52, i32 0, i32 2
  %53 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes44, align 8
  %vector45 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %53, i32 0, i32 2
  %54 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector45, align 8
  %55 = load i32, i32* %k, align 4
  %idxprom46 = sext i32 %55 to i64
  %arrayidx47 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %54, i64 %idxprom46
  %56 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx47, align 8
  %arrayidx48 = getelementptr inbounds [3 x i8*], [3 x i8*]* %fullSignature, i64 0, i64 1
  %arrayidx49 = getelementptr inbounds [3 x i32], [3 x i32]* %fullIntSignature, i64 0, i64 1
  %57 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %58 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  %59 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %myResults, align 8
  %60 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  call void @findAndRecordAllPaths(%struct.NodeStruct* %56, i8** %arrayidx48, i32* %arrayidx49, %struct.NodePtrVecStruct* %57, %struct.BitfieldStruct* %58, %struct.NodeVecVecStruct* %59, %struct.SearchOptionsStruct* %60)
  %61 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited, align 8
  call void @Bitfield_delete(%struct.BitfieldStruct* %61)
  %62 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  %tobool50 = icmp ne %struct.NodePtrVecStruct* %62, null
  br i1 %tobool50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %for.body24
  %63 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %63)
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %for.body24
  br label %for.inc

for.inc:                                          ; preds = %if.end52
  %64 = load i32, i32* %k, align 4
  %inc53 = add nsw i32 %64, 1
  store i32 %inc53, i32* %k, align 4
  br label %for.cond17

for.end:                                          ; preds = %for.cond17
  br label %for.inc54

for.inc54:                                        ; preds = %for.end
  %65 = load i32, i32* %j, align 4
  %inc55 = add nsw i32 %65, 1
  store i32 %inc55, i32* %j, align 4
  br label %for.cond11

for.end56:                                        ; preds = %for.cond11
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %66 = load i32, i32* %i, align 4
  %inc58 = add nsw i32 %66, 1
  store i32 %inc58, i32* %i, align 4
  br label %for.cond

for.end59:                                        ; preds = %for.cond
  %67 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %myResults, align 8
  %contentSize60 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %67, i32 0, i32 0
  %68 = load i32, i32* %contentSize60, align 8
  store i32 %68, i32* %found, align 4
  %call61 = call double (...) bitcast (double ()* @currentTime to double (...)*)()
  store double %call61, double* %tock, align 8
  %69 = load double, double* %tock, align 8
  %70 = load double, double* %tick, align 8
  %sub = fsub double %69, %70
  store double %sub, double* %sec, align 8
  %71 = load double, double* %sec, align 8
  %conv62 = fptosi double %71 to i32
  %div = sdiv i32 %conv62, 3600
  store i32 %div, i32* %hours, align 4
  %72 = load double, double* %sec, align 8
  %call63 = call double @fmod(double %72, double 3.600000e+03) #7
  store double %call63, double* %sec, align 8
  %73 = load double, double* %sec, align 8
  %conv64 = fptosi double %73 to i32
  %div65 = sdiv i32 %conv64, 60
  store i32 %div65, i32* %min, align 4
  %74 = load double, double* %sec, align 8
  %call66 = call double @fmod(double %74, double 6.000000e+01) #7
  store double %call66, double* %sec, align 8
  %75 = load i32, i32* %found, align 4
  %76 = load i32, i32* %searches, align 4
  %77 = load i32, i32* %hours, align 4
  %78 = load i32, i32* %min, align 4
  %79 = load double, double* %sec, align 8
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.7.76, i64 0, i64 0), i32 %75, i32 %76, i32 %77, i32 %78, double %79)
  %arrayidx68 = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  store i8 0, i8* %arrayidx68, align 16
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  %80 = load i32, i32* %hours, align 4
  %81 = load i32, i32* %min, align 4
  %82 = load double, double* %sec, align 8
  %call69 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3.70, i64 0, i64 0), i32 %80, i32 %81, double %82) #7
  %83 = load i32, i32* %found, align 4
  call void @YAMLWriteInt(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.71, i64 0, i64 0), i32 %83)
  %arraydecay70 = getelementptr inbounds [50 x i8], [50 x i8]* %timeStr, i64 0, i64 0
  call void @YAMLWriteString(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5.72, i64 0, i64 0), i8* %arraydecay70)
  %84 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %writeOutputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %84, i32 0, i32 3
  %85 = load i8, i8* %writeOutputFile, align 2
  %tobool71 = trunc i8 %85 to i1
  br i1 %tobool71, label %land.lhs.true, label %if.end78

land.lhs.true:                                    ; preds = %for.end59
  %86 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %outputFile = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %86, i32 0, i32 4
  %87 = load i8*, i8** %outputFile, align 8
  %tobool73 = icmp ne i8* %87, null
  br i1 %tobool73, label %if.then74, label %if.end78

if.then74:                                        ; preds = %land.lhs.true
  %88 = load %struct.NodeVecVecStruct**, %struct.NodeVecVecStruct*** %lastingResults, align 8
  %89 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %buildType = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %89, i32 0, i32 5
  %90 = load i32, i32* %buildType, align 8
  %call75 = call %struct.GraphStruct* @buildGraphFromPaths(%struct.NodeVecVecStruct** %88, i32 %90)
  store %struct.GraphStruct* %call75, %struct.GraphStruct** %optimizedGraph, align 8
  %91 = load %struct.GraphStruct*, %struct.GraphStruct** %optimizedGraph, align 8
  %92 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %outputFile76 = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %92, i32 0, i32 4
  %93 = load i8*, i8** %outputFile76, align 8
  %call77 = call zeroext i1 @exportGraph(%struct.GraphStruct* %91, i8* %93)
  br label %if.end78

if.end78:                                         ; preds = %if.then74, %land.lhs.true, %for.end59
  %94 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %doStatistics = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %94, i32 0, i32 2
  %95 = load i8, i8* %doStatistics, align 1
  %tobool79 = trunc i8 %95 to i1
  br i1 %tobool79, label %land.lhs.true81, label %if.end85

land.lhs.true81:                                  ; preds = %if.end78
  %96 = load %struct.SearchOptionsStruct*, %struct.SearchOptionsStruct** %options.addr, align 8
  %multiThreaded82 = getelementptr inbounds %struct.SearchOptionsStruct, %struct.SearchOptionsStruct* %96, i32 0, i32 1
  %97 = load i8, i8* %multiThreaded82, align 4
  %tobool83 = trunc i8 %97 to i1
  br i1 %tobool83, label %if.end85, label %if.then84

if.then84:                                        ; preds = %land.lhs.true81
  call void @printStats()
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %land.lhs.true81, %if.end78
  %98 = load i32, i32* %found, align 4
  store i32 %98, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end85, %if.then
  %99 = load i32, i32* %retval, align 4
  ret i32 %99
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @printStats() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %tobool = icmp ne %struct.StatsStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  call void @Stats_calculate(%struct.StatsStruct* %1)
  %2 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %averageLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %2, i32 0, i32 3
  %3 = load double, double* %averageLength, align 8
  %4 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %standardDeviation = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %4, i32 0, i32 4
  %5 = load double, double* %standardDeviation, align 8
  %6 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %pathLengths = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %6, i32 0, i32 0
  %7 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %7, i32 0, i32 0
  %8 = load i32, i32* %size, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([91 x i8], [91 x i8]* @.str.9.77, i64 0, i64 0), double %3, double %5, i32 %8)
  %9 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %minLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %9, i32 0, i32 1
  %10 = load i32, i32* %minLength, align 8
  %11 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %maxLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %11, i32 0, i32 2
  %12 = load i32, i32* %maxLength, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10.78, i64 0, i64 0), i32 %10, i32 %12)
  %13 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %minLength2 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %13, i32 0, i32 1
  %14 = load i32, i32* %minLength2, align 8
  store i32 %14, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %15 = load i32, i32* %i, align 4
  %16 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %maxLength3 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %16, i32 0, i32 2
  %17 = load i32, i32* %maxLength3, align 4
  %cmp = icmp sle i32 %15, %17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %histogram = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %18, i32 0, i32 5
  %19 = load i32*, i32** %histogram, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom = sext i32 %20 to i64
  %arrayidx = getelementptr inbounds i32, i32* %19, i64 %idxprom
  %21 = load i32, i32* %arrayidx, align 4
  %cmp4 = icmp ne i32 %21, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %for.body
  %22 = load i32, i32* %i, align 4
  %23 = load %struct.StatsStruct*, %struct.StatsStruct** @globalStats, align 8
  %histogram6 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %23, i32 0, i32 5
  %24 = load i32*, i32** %histogram6, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %25 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %24, i64 %idxprom7
  %26 = load i32, i32* %arrayidx8, align 4
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11.79, i64 0, i64 0), i32 %22, i32 %26)
  br label %if.end

if.end:                                           ; preds = %if.then5, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %27 = load i32, i32* %i, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end10

if.end10:                                         ; preds = %for.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.EdgeReferencesStruct* @SearchDiagram_findNode(%struct.EdgeReferencesStruct* %diagram, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca %struct.EdgeReferencesStruct*, align 8
  %diagram.addr = alloca %struct.EdgeReferencesStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %idx = alloca i32, align 4
  store %struct.EdgeReferencesStruct* %diagram, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  %0 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  %tobool = icmp ne %struct.EdgeReferencesStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %idx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  %2 = load i32, i32* %idx, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %1, i64 %idxprom
  %node1 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx, i32 0, i32 0
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %node1, align 8
  %cmp = icmp ne %struct.NodeStruct* %3, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  %5 = load i32, i32* %idx, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %4, i64 %idxprom2
  %node4 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx3, i32 0, i32 0
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node4, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %cmp5 = icmp eq %struct.NodeStruct* %6, %7
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %for.body
  %8 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  %9 = load i32, i32* %idx, align 4
  %idxprom7 = sext i32 %9 to i64
  %arrayidx8 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %8, i64 %idxprom7
  store %struct.EdgeReferencesStruct* %arrayidx8, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

if.end9:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %10 = load i32, i32* %idx, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %idx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
  %11 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %retval, align 8
  ret %struct.EdgeReferencesStruct* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.EdgeReferencesStruct* @SearchDiagram_build(%struct.NodeListStruct* %nodeTree, i32 %nodeCount) #0 {
entry:
  %retval = alloca %struct.EdgeReferencesStruct*, align 8
  %nodeTree.addr = alloca %struct.NodeListStruct*, align 8
  %nodeCount.addr = alloca i32, align 4
  %diagram = alloca %struct.EdgeReferencesStruct*, align 8
  %outerNodes = alloca %struct.NodeListStruct*, align 8
  %node = alloca %struct.NodeStruct*, align 8
  %innerNodes = alloca %struct.NodeListStruct*, align 8
  %outerIdx = alloca i32, align 4
  %innerIdx = alloca i32, align 4
  %edgeCount = alloca i32, align 4
  %edges = alloca %struct.EdgeListStruct*, align 8
  %element = alloca %struct.EdgeReferencesStruct*, align 8
  store %struct.NodeListStruct* %nodeTree, %struct.NodeListStruct** %nodeTree.addr, align 8
  store i32 %nodeCount, i32* %nodeCount.addr, align 4
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %diagram, align 8
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %outerNodes, align 8
  store %struct.NodeStruct* null, %struct.NodeStruct** %node, align 8
  store %struct.NodeListStruct* null, %struct.NodeListStruct** %innerNodes, align 8
  store i32 0, i32* %outerIdx, align 4
  %0 = load i32, i32* %nodeCount.addr, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %innerIdx, align 4
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodeTree.addr, align 8
  %tobool = icmp ne %struct.NodeListStruct* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %nodeCount.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %nodeCount.addr, align 4
  %add = add nsw i32 %3, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 16
  %call = call noalias i8* @malloc(i64 %mul) #7
  %4 = bitcast i8* %call to %struct.EdgeReferencesStruct*
  store %struct.EdgeReferencesStruct* %4, %struct.EdgeReferencesStruct** %diagram, align 8
  %5 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %tobool1 = icmp ne %struct.EdgeReferencesStruct* %5, null
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %7 = load i32, i32* %nodeCount.addr, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %6, i64 %idxprom
  %node4 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx, i32 0, i32 0
  store %struct.NodeStruct* null, %struct.NodeStruct** %node4, align 8
  %8 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %9 = load i32, i32* %nodeCount.addr, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %8, i64 %idxprom5
  %edgeReferenceArray = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx6, i32 0, i32 1
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %edgeReferenceArray, align 8
  %10 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodeTree.addr, align 8
  store %struct.NodeListStruct* %10, %struct.NodeListStruct** %outerNodes, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc78, %if.end3
  %11 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %cmp7 = icmp ne %struct.NodeListStruct* %11, null
  br i1 %cmp7, label %for.body, label %for.end80

for.body:                                         ; preds = %for.cond
  %12 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %node9 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %12, i32 0, i32 0
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %node9, align 8
  store %struct.NodeStruct* %13, %struct.NodeStruct** %node, align 8
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %15 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %16 = load i32, i32* %outerIdx, align 4
  %idxprom10 = sext i32 %16 to i64
  %arrayidx11 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %15, i64 %idxprom10
  %node12 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx11, i32 0, i32 0
  store %struct.NodeStruct* %14, %struct.NodeStruct** %node12, align 8
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edgeCount13 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %17, i32 0, i32 8
  %18 = load i32, i32* %edgeCount13, align 8
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %entranceCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %19, i32 0, i32 9
  %20 = load i32, i32* %entranceCount, align 4
  %add14 = add nsw i32 %18, %20
  store i32 %add14, i32* %edgeCount, align 4
  %21 = load i32, i32* %edgeCount, align 4
  %cmp15 = icmp sgt i32 %21, 0
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %for.body
  %22 = load i32, i32* %edgeCount, align 4
  %add18 = add nsw i32 %22, 1
  %conv19 = sext i32 %add18 to i64
  %mul20 = mul i64 %conv19, 16
  %call21 = call noalias i8* @malloc(i64 %mul20) #7
  %23 = bitcast i8* %call21 to %struct.EdgeReferencesStruct*
  %24 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %25 = load i32, i32* %outerIdx, align 4
  %idxprom22 = sext i32 %25 to i64
  %arrayidx23 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %24, i64 %idxprom22
  %edgeReferenceArray24 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx23, i32 0, i32 1
  store %struct.EdgeReferencesStruct* %23, %struct.EdgeReferencesStruct** %edgeReferenceArray24, align 8
  %26 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %27 = load i32, i32* %outerIdx, align 4
  %idxprom25 = sext i32 %27 to i64
  %arrayidx26 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %26, i64 %idxprom25
  %edgeReferenceArray27 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx26, i32 0, i32 1
  %28 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray27, align 8
  %29 = load i32, i32* %edgeCount, align 4
  %idxprom28 = sext i32 %29 to i64
  %arrayidx29 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %28, i64 %idxprom28
  %edgeTarget = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx29, i32 0, i32 0
  store %struct.NodeStruct* null, %struct.NodeStruct** %edgeTarget, align 8
  %30 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %31 = load i32, i32* %outerIdx, align 4
  %idxprom30 = sext i32 %31 to i64
  %arrayidx31 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %30, i64 %idxprom30
  %edgeReferenceArray32 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx31, i32 0, i32 1
  %32 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray32, align 8
  %33 = load i32, i32* %edgeCount, align 4
  %idxprom33 = sext i32 %33 to i64
  %arrayidx34 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %32, i64 %idxprom33
  %targetNodeEdges = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx34, i32 0, i32 1
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %targetNodeEdges, align 8
  br label %if.end38

if.else:                                          ; preds = %for.body
  %34 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %35 = load i32, i32* %outerIdx, align 4
  %idxprom35 = sext i32 %35 to i64
  %arrayidx36 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %34, i64 %idxprom35
  %edgeReferenceArray37 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx36, i32 0, i32 1
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %edgeReferenceArray37, align 8
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then17
  %36 = load i32, i32* %outerIdx, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* %outerIdx, align 4
  %37 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %37, i32 0, i32 6
  %38 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  store %struct.NodeListStruct* %38, %struct.NodeListStruct** %innerNodes, align 8
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc, %if.end38
  %39 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %cmp40 = icmp ne %struct.NodeListStruct* %39, null
  br i1 %cmp40, label %for.body42, label %for.end

for.body42:                                       ; preds = %for.cond39
  %40 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %node43 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %40, i32 0, i32 0
  %41 = load %struct.NodeStruct*, %struct.NodeStruct** %node43, align 8
  store %struct.NodeStruct* %41, %struct.NodeStruct** %node, align 8
  %42 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %43 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %44 = load i32, i32* %innerIdx, align 4
  %idxprom44 = sext i32 %44 to i64
  %arrayidx45 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %43, i64 %idxprom44
  %node46 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx45, i32 0, i32 0
  store %struct.NodeStruct* %42, %struct.NodeStruct** %node46, align 8
  %45 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edgeCount47 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %45, i32 0, i32 8
  %46 = load i32, i32* %edgeCount47, align 8
  %47 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %entranceCount48 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %47, i32 0, i32 9
  %48 = load i32, i32* %entranceCount48, align 4
  %add49 = add nsw i32 %46, %48
  store i32 %add49, i32* %edgeCount, align 4
  %49 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edgeCount50 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %49, i32 0, i32 8
  %50 = load i32, i32* %edgeCount50, align 8
  %cmp51 = icmp sgt i32 %50, 0
  br i1 %cmp51, label %if.then53, label %if.else73

if.then53:                                        ; preds = %for.body42
  %51 = load i32, i32* %edgeCount, align 4
  %add54 = add nsw i32 %51, 1
  %conv55 = sext i32 %add54 to i64
  %mul56 = mul i64 %conv55, 16
  %call57 = call noalias i8* @malloc(i64 %mul56) #7
  %52 = bitcast i8* %call57 to %struct.EdgeReferencesStruct*
  %53 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %54 = load i32, i32* %innerIdx, align 4
  %idxprom58 = sext i32 %54 to i64
  %arrayidx59 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %53, i64 %idxprom58
  %edgeReferenceArray60 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx59, i32 0, i32 1
  store %struct.EdgeReferencesStruct* %52, %struct.EdgeReferencesStruct** %edgeReferenceArray60, align 8
  %55 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %56 = load i32, i32* %innerIdx, align 4
  %idxprom61 = sext i32 %56 to i64
  %arrayidx62 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %55, i64 %idxprom61
  %edgeReferenceArray63 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx62, i32 0, i32 1
  %57 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray63, align 8
  %58 = load i32, i32* %edgeCount, align 4
  %idxprom64 = sext i32 %58 to i64
  %arrayidx65 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %57, i64 %idxprom64
  %edgeTarget66 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx65, i32 0, i32 0
  store %struct.NodeStruct* null, %struct.NodeStruct** %edgeTarget66, align 8
  %59 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %60 = load i32, i32* %innerIdx, align 4
  %idxprom67 = sext i32 %60 to i64
  %arrayidx68 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %59, i64 %idxprom67
  %edgeReferenceArray69 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx68, i32 0, i32 1
  %61 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray69, align 8
  %62 = load i32, i32* %edgeCount, align 4
  %idxprom70 = sext i32 %62 to i64
  %arrayidx71 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %61, i64 %idxprom70
  %targetNodeEdges72 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx71, i32 0, i32 1
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %targetNodeEdges72, align 8
  br label %if.end77

if.else73:                                        ; preds = %for.body42
  %63 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %64 = load i32, i32* %innerIdx, align 4
  %idxprom74 = sext i32 %64 to i64
  %arrayidx75 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %63, i64 %idxprom74
  %edgeReferenceArray76 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx75, i32 0, i32 1
  store %struct.EdgeReferencesStruct* null, %struct.EdgeReferencesStruct** %edgeReferenceArray76, align 8
  br label %if.end77

if.end77:                                         ; preds = %if.else73, %if.then53
  %65 = load i32, i32* %innerIdx, align 4
  %dec = add nsw i32 %65, -1
  store i32 %dec, i32* %innerIdx, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end77
  %66 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %66, i32 0, i32 1
  %67 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %67, %struct.NodeListStruct** %innerNodes, align 8
  br label %for.cond39

for.end:                                          ; preds = %for.cond39
  br label %for.inc78

for.inc78:                                        ; preds = %for.end
  %68 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %nextNode79 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %68, i32 0, i32 1
  %69 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode79, align 8
  store %struct.NodeListStruct* %69, %struct.NodeListStruct** %outerNodes, align 8
  br label %for.cond

for.end80:                                        ; preds = %for.cond
  %70 = load i32, i32* %outerIdx, align 4
  %71 = load i32, i32* %innerIdx, align 4
  %add81 = add nsw i32 %71, 1
  %cmp82 = icmp ne i32 %70, %add81
  br i1 %cmp82, label %if.then84, label %if.end86

if.then84:                                        ; preds = %for.end80
  %72 = load i32, i32* %outerIdx, align 4
  %73 = load i32, i32* %innerIdx, align 4
  %74 = load i32, i32* %nodeCount.addr, align 4
  %call85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.84, i64 0, i64 0), i32 %72, i32 %73, i32 %74)
  br label %if.end86

if.end86:                                         ; preds = %if.then84, %for.end80
  store i32 0, i32* %outerIdx, align 4
  %75 = load i32, i32* %nodeCount.addr, align 4
  %sub87 = sub nsw i32 %75, 1
  store i32 %sub87, i32* %innerIdx, align 4
  %76 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodeTree.addr, align 8
  store %struct.NodeListStruct* %76, %struct.NodeListStruct** %outerNodes, align 8
  br label %for.cond88

for.cond88:                                       ; preds = %for.inc152, %if.end86
  %77 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %cmp89 = icmp ne %struct.NodeListStruct* %77, null
  br i1 %cmp89, label %for.body91, label %for.end154

for.body91:                                       ; preds = %for.cond88
  %78 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %node92 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %78, i32 0, i32 0
  %79 = load %struct.NodeStruct*, %struct.NodeStruct** %node92, align 8
  store %struct.NodeStruct* %79, %struct.NodeStruct** %node, align 8
  %80 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges93 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %80, i32 0, i32 7
  %81 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges93, align 8
  store %struct.EdgeListStruct* %81, %struct.EdgeListStruct** %edges, align 8
  store i32 0, i32* %edgeCount, align 4
  br label %for.cond94

for.cond94:                                       ; preds = %for.inc113, %for.body91
  %82 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %cmp95 = icmp ne %struct.EdgeListStruct* %82, null
  br i1 %cmp95, label %for.body97, label %for.end115

for.body97:                                       ; preds = %for.cond94
  %83 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %84 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %84, i32 0, i32 1
  %85 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode, align 8
  %call98 = call %struct.EdgeReferencesStruct* @SearchDiagram_findNode(%struct.EdgeReferencesStruct* %83, %struct.NodeStruct* %85)
  store %struct.EdgeReferencesStruct* %call98, %struct.EdgeReferencesStruct** %element, align 8
  %86 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode99 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %86, i32 0, i32 1
  %87 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode99, align 8
  %88 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %89 = load i32, i32* %outerIdx, align 4
  %idxprom100 = sext i32 %89 to i64
  %arrayidx101 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %88, i64 %idxprom100
  %edgeReferenceArray102 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx101, i32 0, i32 1
  %90 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray102, align 8
  %91 = load i32, i32* %edgeCount, align 4
  %idxprom103 = sext i32 %91 to i64
  %arrayidx104 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %90, i64 %idxprom103
  %edgeTarget105 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx104, i32 0, i32 0
  store %struct.NodeStruct* %87, %struct.NodeStruct** %edgeTarget105, align 8
  %92 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %edgeReferenceArray106 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %92, i32 0, i32 1
  %93 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray106, align 8
  %94 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %95 = load i32, i32* %outerIdx, align 4
  %idxprom107 = sext i32 %95 to i64
  %arrayidx108 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %94, i64 %idxprom107
  %edgeReferenceArray109 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx108, i32 0, i32 1
  %96 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray109, align 8
  %97 = load i32, i32* %edgeCount, align 4
  %idxprom110 = sext i32 %97 to i64
  %arrayidx111 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %96, i64 %idxprom110
  %targetNodeEdges112 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx111, i32 0, i32 1
  store %struct.EdgeReferencesStruct* %93, %struct.EdgeReferencesStruct** %targetNodeEdges112, align 8
  br label %for.inc113

for.inc113:                                       ; preds = %for.body97
  %98 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %98, i32 0, i32 2
  %99 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %99, %struct.EdgeListStruct** %edges, align 8
  %100 = load i32, i32* %edgeCount, align 4
  %inc114 = add nsw i32 %100, 1
  store i32 %inc114, i32* %edgeCount, align 4
  br label %for.cond94

for.end115:                                       ; preds = %for.cond94
  %101 = load i32, i32* %outerIdx, align 4
  %inc116 = add nsw i32 %101, 1
  store i32 %inc116, i32* %outerIdx, align 4
  %102 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %interiorNodes117 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %102, i32 0, i32 6
  %103 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes117, align 8
  store %struct.NodeListStruct* %103, %struct.NodeListStruct** %innerNodes, align 8
  br label %for.cond118

for.cond118:                                      ; preds = %for.inc149, %for.end115
  %104 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %cmp119 = icmp ne %struct.NodeListStruct* %104, null
  br i1 %cmp119, label %for.body121, label %for.end151

for.body121:                                      ; preds = %for.cond118
  %105 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %node122 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %105, i32 0, i32 0
  %106 = load %struct.NodeStruct*, %struct.NodeStruct** %node122, align 8
  store %struct.NodeStruct* %106, %struct.NodeStruct** %node, align 8
  %107 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %edges123 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %107, i32 0, i32 7
  %108 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges123, align 8
  store %struct.EdgeListStruct* %108, %struct.EdgeListStruct** %edges, align 8
  store i32 0, i32* %edgeCount, align 4
  br label %for.cond124

for.cond124:                                      ; preds = %for.inc144, %for.body121
  %109 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %cmp125 = icmp ne %struct.EdgeListStruct* %109, null
  br i1 %cmp125, label %for.body127, label %for.end147

for.body127:                                      ; preds = %for.cond124
  %110 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %111 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode128 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %111, i32 0, i32 1
  %112 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode128, align 8
  %call129 = call %struct.EdgeReferencesStruct* @SearchDiagram_findNode(%struct.EdgeReferencesStruct* %110, %struct.NodeStruct* %112)
  store %struct.EdgeReferencesStruct* %call129, %struct.EdgeReferencesStruct** %element, align 8
  %113 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %targetNode130 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %113, i32 0, i32 1
  %114 = load %struct.NodeStruct*, %struct.NodeStruct** %targetNode130, align 8
  %115 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %116 = load i32, i32* %innerIdx, align 4
  %idxprom131 = sext i32 %116 to i64
  %arrayidx132 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %115, i64 %idxprom131
  %edgeReferenceArray133 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx132, i32 0, i32 1
  %117 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray133, align 8
  %118 = load i32, i32* %edgeCount, align 4
  %idxprom134 = sext i32 %118 to i64
  %arrayidx135 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %117, i64 %idxprom134
  %edgeTarget136 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx135, i32 0, i32 0
  store %struct.NodeStruct* %114, %struct.NodeStruct** %edgeTarget136, align 8
  %119 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %element, align 8
  %edgeReferenceArray137 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %119, i32 0, i32 1
  %120 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray137, align 8
  %121 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  %122 = load i32, i32* %innerIdx, align 4
  %idxprom138 = sext i32 %122 to i64
  %arrayidx139 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %121, i64 %idxprom138
  %edgeReferenceArray140 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx139, i32 0, i32 1
  %123 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edgeReferenceArray140, align 8
  %124 = load i32, i32* %edgeCount, align 4
  %idxprom141 = sext i32 %124 to i64
  %arrayidx142 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %123, i64 %idxprom141
  %targetNodeEdges143 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx142, i32 0, i32 1
  store %struct.EdgeReferencesStruct* %120, %struct.EdgeReferencesStruct** %targetNodeEdges143, align 8
  br label %for.inc144

for.inc144:                                       ; preds = %for.body127
  %125 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  %nextEdge145 = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %125, i32 0, i32 2
  %126 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge145, align 8
  store %struct.EdgeListStruct* %126, %struct.EdgeListStruct** %edges, align 8
  %127 = load i32, i32* %edgeCount, align 4
  %inc146 = add nsw i32 %127, 1
  store i32 %inc146, i32* %edgeCount, align 4
  br label %for.cond124

for.end147:                                       ; preds = %for.cond124
  %128 = load i32, i32* %innerIdx, align 4
  %dec148 = add nsw i32 %128, -1
  store i32 %dec148, i32* %innerIdx, align 4
  br label %for.inc149

for.inc149:                                       ; preds = %for.end147
  %129 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerNodes, align 8
  %nextNode150 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %129, i32 0, i32 1
  %130 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode150, align 8
  store %struct.NodeListStruct* %130, %struct.NodeListStruct** %innerNodes, align 8
  br label %for.cond118

for.end151:                                       ; preds = %for.cond118
  br label %for.inc152

for.inc152:                                       ; preds = %for.end151
  %131 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  %nextNode153 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %131, i32 0, i32 1
  %132 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode153, align 8
  store %struct.NodeListStruct* %132, %struct.NodeListStruct** %outerNodes, align 8
  br label %for.cond88

for.end154:                                       ; preds = %for.cond88
  %133 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %diagram, align 8
  store %struct.EdgeReferencesStruct* %133, %struct.EdgeReferencesStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end154, %if.then2, %if.then
  %134 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %retval, align 8
  ret %struct.EdgeReferencesStruct* %134
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @SearchDiagram_findSignatureAlongEdges(%struct.NodeStruct* %node, %struct.EdgeReferencesStruct* %edges, i8** %labels, %struct.NodePtrVecStruct* %result, %struct.BitfieldStruct* %visited) #0 {
entry:
  %retval = alloca i1, align 1
  %node.addr = alloca %struct.NodeStruct*, align 8
  %edges.addr = alloca %struct.EdgeReferencesStruct*, align 8
  %labels.addr = alloca i8**, align 8
  %result.addr = alloca %struct.NodePtrVecStruct*, align 8
  %visited.addr = alloca %struct.BitfieldStruct*, align 8
  %success = alloca i8, align 1
  %nextLegResult = alloca %struct.NodePtrVecStruct*, align 8
  %nextLegVisited = alloca %struct.BitfieldStruct*, align 8
  %i = alloca i32, align 4
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store %struct.EdgeReferencesStruct* %edges, %struct.EdgeReferencesStruct** %edges.addr, align 8
  store i8** %labels, i8*** %labels.addr, align 8
  store %struct.NodePtrVecStruct* %result, %struct.NodePtrVecStruct** %result.addr, align 8
  store %struct.BitfieldStruct* %visited, %struct.BitfieldStruct** %visited.addr, align 8
  store i8 0, i8* %success, align 1
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %nextLegResult, align 8
  store %struct.BitfieldStruct* null, %struct.BitfieldStruct** %nextLegVisited, align 8
  %0 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool = icmp ne %struct.NodeStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %tobool1 = icmp ne %struct.EdgeReferencesStruct* %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i8**, i8*** %labels.addr, align 8
  %tobool3 = icmp ne i8** %2, null
  br i1 %tobool3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %tobool5 = icmp ne %struct.NodePtrVecStruct* %3, null
  br i1 %tobool5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %tobool7 = icmp ne %struct.BitfieldStruct* %4, null
  br i1 %tobool7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false6
  %5 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call = call zeroext i1 @Bitfield_nodeVisited(%struct.BitfieldStruct* %5, %struct.NodeStruct* %6)
  br i1 %call, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i1 false, i1* %retval, align 1
  br label %return

if.end9:                                          ; preds = %if.end
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call10 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %7, %struct.NodeStruct* %8)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %9 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %9, i64 %idxprom
  %edgeTarget = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx, i32 0, i32 0
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget, align 8
  %cmp = icmp ne %struct.NodeStruct* %11, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %12, i64 %idxprom11
  %edgeTarget13 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx12, i32 0, i32 0
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget13, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %14, i32 0, i32 2
  %15 = load i8*, i8** %label, align 8
  %tobool14 = icmp ne i8* %15, null
  br i1 %tobool14, label %if.then15, label %if.end45

if.then15:                                        ; preds = %for.body
  %16 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %17 to i64
  %arrayidx17 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %16, i64 %idxprom16
  %edgeTarget18 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx17, i32 0, i32 0
  %18 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget18, align 8
  %label19 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %18, i32 0, i32 2
  %19 = load i8*, i8** %label19, align 8
  %20 = load i8**, i8*** %labels.addr, align 8
  %arrayidx20 = getelementptr inbounds i8*, i8** %20, i64 0
  %21 = load i8*, i8** %arrayidx20, align 8
  %call21 = call i32 @strcmp(i8* %19, i8* %21) #9
  %cmp22 = icmp eq i32 %call21, 0
  br i1 %cmp22, label %if.then23, label %if.end44

if.then23:                                        ; preds = %if.then15
  %22 = load i8**, i8*** %labels.addr, align 8
  %arrayidx24 = getelementptr inbounds i8*, i8** %22, i64 1
  %23 = load i8*, i8** %arrayidx24, align 8
  %cmp25 = icmp eq i8* %23, null
  br i1 %cmp25, label %if.then26, label %if.else

if.then26:                                        ; preds = %if.then23
  %24 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %25 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %26 to i64
  %arrayidx28 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %25, i64 %idxprom27
  %edgeTarget29 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx28, i32 0, i32 0
  %27 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget29, align 8
  %call30 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %24, %struct.NodeStruct* %27)
  store i1 true, i1* %retval, align 1
  br label %return

if.else:                                          ; preds = %if.then23
  %call31 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 50)
  store %struct.NodePtrVecStruct* %call31, %struct.NodePtrVecStruct** %nextLegResult, align 8
  %28 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %bitsNeeded = getelementptr inbounds %struct.BitfieldStruct, %struct.BitfieldStruct* %28, i32 0, i32 0
  %29 = load i32, i32* %bitsNeeded, align 8
  %call32 = call %struct.BitfieldStruct* @Bitfield_new(i32 %29)
  store %struct.BitfieldStruct* %call32, %struct.BitfieldStruct** %nextLegVisited, align 8
  %30 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %31 to i64
  %arrayidx34 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %30, i64 %idxprom33
  %edgeTarget35 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx34, i32 0, i32 0
  %32 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget35, align 8
  %33 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %34 to i64
  %arrayidx37 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %33, i64 %idxprom36
  %targetNodeEdges = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx37, i32 0, i32 1
  %35 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %targetNodeEdges, align 8
  %36 = load i8**, i8*** %labels.addr, align 8
  %arrayidx38 = getelementptr inbounds i8*, i8** %36, i64 1
  %37 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  %38 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  %call39 = call zeroext i1 @SearchDiagram_findSignatureAlongEdges(%struct.NodeStruct* %32, %struct.EdgeReferencesStruct* %35, i8** %arrayidx38, %struct.NodePtrVecStruct* %37, %struct.BitfieldStruct* %38)
  %frombool = zext i1 %call39 to i8
  store i8 %frombool, i8* %success, align 1
  %39 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %nextLegVisited, align 8
  call void @Bitfield_delete(%struct.BitfieldStruct* %39)
  %40 = load i8, i8* %success, align 1
  %tobool40 = trunc i8 %40 to i1
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.else
  %41 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %42 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  call void @NodePtrVec_appendVectors(%struct.NodePtrVecStruct* %41, %struct.NodePtrVecStruct* %42, i1 zeroext true)
  %43 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nextLegResult, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %43)
  store i1 true, i1* %retval, align 1
  br label %return

if.end42:                                         ; preds = %if.else
  br label %if.end43

if.end43:                                         ; preds = %if.end42
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then15
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end45
  %44 = load i32, i32* %i, align 4
  %inc = add nsw i32 %44, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc63, %for.end
  %45 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %46 = load i32, i32* %i, align 4
  %idxprom47 = sext i32 %46 to i64
  %arrayidx48 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %45, i64 %idxprom47
  %edgeTarget49 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx48, i32 0, i32 0
  %47 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget49, align 8
  %cmp50 = icmp ne %struct.NodeStruct* %47, null
  br i1 %cmp50, label %for.body51, label %for.end65

for.body51:                                       ; preds = %for.cond46
  %48 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %49 = load i32, i32* %i, align 4
  %idxprom52 = sext i32 %49 to i64
  %arrayidx53 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %48, i64 %idxprom52
  %edgeTarget54 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx53, i32 0, i32 0
  %50 = load %struct.NodeStruct*, %struct.NodeStruct** %edgeTarget54, align 8
  %51 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %edges.addr, align 8
  %52 = load i32, i32* %i, align 4
  %idxprom55 = sext i32 %52 to i64
  %arrayidx56 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %51, i64 %idxprom55
  %targetNodeEdges57 = getelementptr inbounds %struct.EdgeReferencesStruct, %struct.EdgeReferencesStruct* %arrayidx56, i32 0, i32 1
  %53 = load %struct.EdgeReferencesStruct*, %struct.EdgeReferencesStruct** %targetNodeEdges57, align 8
  %54 = load i8**, i8*** %labels.addr, align 8
  %55 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %56 = load %struct.BitfieldStruct*, %struct.BitfieldStruct** %visited.addr, align 8
  %call58 = call zeroext i1 @SearchDiagram_findSignatureAlongEdges(%struct.NodeStruct* %50, %struct.EdgeReferencesStruct* %53, i8** %54, %struct.NodePtrVecStruct* %55, %struct.BitfieldStruct* %56)
  %frombool59 = zext i1 %call58 to i8
  store i8 %frombool59, i8* %success, align 1
  %57 = load i8, i8* %success, align 1
  %tobool60 = trunc i8 %57 to i1
  br i1 %tobool60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %for.body51
  store i1 true, i1* %retval, align 1
  br label %return

if.end62:                                         ; preds = %for.body51
  br label %for.inc63

for.inc63:                                        ; preds = %if.end62
  %58 = load i32, i32* %i, align 4
  %inc64 = add nsw i32 %58, 1
  store i32 %inc64, i32* %i, align 4
  br label %for.cond46

for.end65:                                        ; preds = %for.cond46
  %59 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %result.addr, align 8
  %call66 = call %struct.NodeStruct* @NodePtrVec_pop(%struct.NodePtrVecStruct* %59)
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end65, %if.then61, %if.then41, %if.then26, %if.then8, %if.then
  %60 = load i1, i1* %retval, align 1
  ret i1 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.HistogramElementStruct* @HistogramElement_new(i32 %length) #0 {
entry:
  %retval = alloca %struct.HistogramElementStruct*, align 8
  %length.addr = alloca i32, align 4
  %new = alloca %struct.HistogramElementStruct*, align 8
  store i32 %length, i32* %length.addr, align 4
  %call = call noalias i8* @malloc(i64 16) #7
  %0 = bitcast i8* %call to %struct.HistogramElementStruct*
  store %struct.HistogramElementStruct* %0, %struct.HistogramElementStruct** %new, align 8
  %1 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %tobool = icmp ne %struct.HistogramElementStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.HistogramElementStruct* null, %struct.HistogramElementStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %length.addr, align 4
  %3 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %length1 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %3, i32 0, i32 0
  store i32 %2, i32* %length1, align 8
  %4 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %count = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %4, i32 0, i32 1
  store i32 1, i32* %count, align 4
  %5 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %next = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %5, i32 0, i32 2
  store %struct.HistogramElementStruct* null, %struct.HistogramElementStruct** %next, align 8
  %6 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  store %struct.HistogramElementStruct* %6, %struct.HistogramElementStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %retval, align 8
  ret %struct.HistogramElementStruct* %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @HistogramElement_updateList(%struct.HistogramElementStruct** %head, i32 %length) #0 {
entry:
  %retval = alloca i1, align 1
  %head.addr = alloca %struct.HistogramElementStruct**, align 8
  %length.addr = alloca i32, align 4
  %prev = alloca %struct.HistogramElementStruct**, align 8
  %current = alloca %struct.HistogramElementStruct*, align 8
  %new = alloca %struct.HistogramElementStruct*, align 8
  %histogramInsert = alloca i8, align 1
  store %struct.HistogramElementStruct** %head, %struct.HistogramElementStruct*** %head.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store %struct.HistogramElementStruct** null, %struct.HistogramElementStruct*** %prev, align 8
  store %struct.HistogramElementStruct* null, %struct.HistogramElementStruct** %current, align 8
  store %struct.HistogramElementStruct* null, %struct.HistogramElementStruct** %new, align 8
  store i8 0, i8* %histogramInsert, align 1
  %0 = load %struct.HistogramElementStruct**, %struct.HistogramElementStruct*** %head.addr, align 8
  store %struct.HistogramElementStruct** %0, %struct.HistogramElementStruct*** %prev, align 8
  %1 = load %struct.HistogramElementStruct**, %struct.HistogramElementStruct*** %head.addr, align 8
  %2 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %1, align 8
  store %struct.HistogramElementStruct* %2, %struct.HistogramElementStruct** %current, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %cmp = icmp ne %struct.HistogramElementStruct* %3, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %length1 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %length1, align 8
  %6 = load i32, i32* %length.addr, align 4
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %next = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %7, i32 0, i32 2
  store %struct.HistogramElementStruct** %next, %struct.HistogramElementStruct*** %prev, align 8
  br label %for.inc

if.end:                                           ; preds = %for.body
  %8 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %length3 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %8, i32 0, i32 0
  %9 = load i32, i32* %length3, align 8
  %10 = load i32, i32* %length.addr, align 4
  %cmp4 = icmp eq i32 %9, %10
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %11 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %count = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %11, i32 0, i32 1
  %12 = load i32, i32* %count, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %count, align 4
  store i8 1, i8* %histogramInsert, align 1
  br label %for.end

if.end6:                                          ; preds = %if.end
  %13 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %length7 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %13, i32 0, i32 0
  %14 = load i32, i32* %length7, align 8
  %15 = load i32, i32* %length.addr, align 4
  %cmp8 = icmp sgt i32 %14, %15
  br i1 %cmp8, label %if.then9, label %if.end13

if.then9:                                         ; preds = %if.end6
  %16 = load i32, i32* %length.addr, align 4
  %call = call %struct.HistogramElementStruct* @HistogramElement_new(i32 %16)
  store %struct.HistogramElementStruct* %call, %struct.HistogramElementStruct** %new, align 8
  %17 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %tobool = icmp ne %struct.HistogramElementStruct* %17, null
  br i1 %tobool, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.then9
  store i1 false, i1* %retval, align 1
  br label %return

if.end11:                                         ; preds = %if.then9
  %18 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %19 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %next12 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %19, i32 0, i32 2
  store %struct.HistogramElementStruct* %18, %struct.HistogramElementStruct** %next12, align 8
  %20 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %new, align 8
  %21 = load %struct.HistogramElementStruct**, %struct.HistogramElementStruct*** %prev, align 8
  store %struct.HistogramElementStruct* %20, %struct.HistogramElementStruct** %21, align 8
  store i8 1, i8* %histogramInsert, align 1
  br label %for.end

if.end13:                                         ; preds = %if.end6
  br label %for.inc

for.inc:                                          ; preds = %if.end13, %if.then
  %22 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %current, align 8
  %next14 = getelementptr inbounds %struct.HistogramElementStruct, %struct.HistogramElementStruct* %22, i32 0, i32 2
  %23 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %next14, align 8
  store %struct.HistogramElementStruct* %23, %struct.HistogramElementStruct** %current, align 8
  br label %for.cond

for.end:                                          ; preds = %if.end11, %if.then5, %for.cond
  %24 = load i8, i8* %histogramInsert, align 1
  %tobool15 = trunc i8 %24 to i1
  br i1 %tobool15, label %if.end21, label %if.then16

if.then16:                                        ; preds = %for.end
  %25 = load i32, i32* %length.addr, align 4
  %call17 = call %struct.HistogramElementStruct* @HistogramElement_new(i32 %25)
  %26 = load %struct.HistogramElementStruct**, %struct.HistogramElementStruct*** %prev, align 8
  store %struct.HistogramElementStruct* %call17, %struct.HistogramElementStruct** %26, align 8
  %27 = load %struct.HistogramElementStruct**, %struct.HistogramElementStruct*** %prev, align 8
  %28 = load %struct.HistogramElementStruct*, %struct.HistogramElementStruct** %27, align 8
  %cmp18 = icmp eq %struct.HistogramElementStruct* %28, null
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then16
  store i1 false, i1* %retval, align 1
  br label %return

if.end20:                                         ; preds = %if.then16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %for.end
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end21, %if.then19, %if.then10
  %29 = load i1, i1* %retval, align 1
  ret i1 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.StatsStruct* @Stats_new() #0 {
entry:
  %retval = alloca %struct.StatsStruct*, align 8
  %new = alloca %struct.StatsStruct*, align 8
  %call = call noalias i8* @malloc(i64 40) #7
  %0 = bitcast i8* %call to %struct.StatsStruct*
  store %struct.StatsStruct* %0, %struct.StatsStruct** %new, align 8
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %tobool = icmp ne %struct.StatsStruct* %1, null
  br i1 %tobool, label %if.then, label %if.else5

if.then:                                          ; preds = %entry
  %call1 = call %struct.IntVectorStruct* @IntVector_new(i32 16)
  %2 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %pathLengths = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %2, i32 0, i32 0
  store %struct.IntVectorStruct* %call1, %struct.IntVectorStruct** %pathLengths, align 8
  %3 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %averageLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %3, i32 0, i32 3
  store double 0.000000e+00, double* %averageLength, align 8
  %4 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %standardDeviation = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %4, i32 0, i32 4
  store double 0.000000e+00, double* %standardDeviation, align 8
  %5 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %minLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %5, i32 0, i32 1
  store i32 2147483647, i32* %minLength, align 8
  %6 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %maxLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %6, i32 0, i32 2
  store i32 0, i32* %maxLength, align 4
  %7 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %histogram = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %7, i32 0, i32 5
  store i32* null, i32** %histogram, align 8
  %8 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %pathLengths2 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %8, i32 0, i32 0
  %9 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths2, align 8
  %tobool3 = icmp ne %struct.IntVectorStruct* %9, null
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %10 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  store %struct.StatsStruct* %10, %struct.StatsStruct** %retval, align 8
  br label %return

if.else:                                          ; preds = %if.then
  %11 = load %struct.StatsStruct*, %struct.StatsStruct** %new, align 8
  %12 = bitcast %struct.StatsStruct* %11 to i8*
  call void @free(i8* %12) #7
  store %struct.StatsStruct* null, %struct.StatsStruct** %retval, align 8
  br label %return

if.else5:                                         ; preds = %entry
  store %struct.StatsStruct* null, %struct.StatsStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.else5, %if.else, %if.then4
  %13 = load %struct.StatsStruct*, %struct.StatsStruct** %retval, align 8
  ret %struct.StatsStruct* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Stats_delete(%struct.StatsStruct* %stats) #0 {
entry:
  %stats.addr = alloca %struct.StatsStruct*, align 8
  store %struct.StatsStruct* %stats, %struct.StatsStruct** %stats.addr, align 8
  %0 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %tobool = icmp ne %struct.StatsStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %1, i32 0, i32 0
  %2 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths, align 8
  %tobool1 = icmp ne %struct.IntVectorStruct* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths3 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %3, i32 0, i32 0
  %4 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths3, align 8
  %5 = bitcast %struct.IntVectorStruct* %4 to i8*
  call void @free(i8* %5) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %7 = bitcast %struct.StatsStruct* %6 to i8*
  call void @free(i8* %7) #7
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @Stats_logPath(%struct.StatsStruct* %stats, %struct.NodePtrVecStruct* %path) #0 {
entry:
  %retval = alloca i1, align 1
  %stats.addr = alloca %struct.StatsStruct*, align 8
  %path.addr = alloca %struct.NodePtrVecStruct*, align 8
  %length = alloca i32, align 4
  store %struct.StatsStruct* %stats, %struct.StatsStruct** %stats.addr, align 8
  store %struct.NodePtrVecStruct* %path, %struct.NodePtrVecStruct** %path.addr, align 8
  %0 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %tobool = icmp ne %struct.StatsStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %1, i32 0, i32 0
  %2 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths, align 8
  %tobool1 = icmp ne %struct.IntVectorStruct* %2, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path.addr, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %3, null
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  store i32 %5, i32* %length, align 4
  %6 = load i32, i32* %length, align 4
  %7 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %minLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %7, i32 0, i32 1
  %8 = load i32, i32* %minLength, align 8
  %cmp = icmp slt i32 %6, %8
  br i1 %cmp, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %9 = load i32, i32* %length, align 4
  %10 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %minLength5 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %10, i32 0, i32 1
  store i32 %9, i32* %minLength5, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %11 = load i32, i32* %length, align 4
  %12 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %maxLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %12, i32 0, i32 2
  %13 = load i32, i32* %maxLength, align 4
  %cmp7 = icmp sgt i32 %11, %13
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %14 = load i32, i32* %length, align 4
  %15 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %maxLength9 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %15, i32 0, i32 2
  store i32 %14, i32* %maxLength9, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end6
  %16 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths11 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %16, i32 0, i32 0
  %17 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths11, align 8
  %18 = load i32, i32* %length, align 4
  %call = call zeroext i1 @IntVector_insertEnd(%struct.IntVectorStruct* %17, i32 %18)
  store i1 %call, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end10, %if.then
  %19 = load i1, i1* %retval, align 1
  ret i1 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Stats_calculate(%struct.StatsStruct* %stats) #0 {
entry:
  %stats.addr = alloca %struct.StatsStruct*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %sum = alloca double, align 8
  %diff = alloca double, align 8
  store %struct.StatsStruct* %stats, %struct.StatsStruct** %stats.addr, align 8
  %0 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %tobool = icmp ne %struct.StatsStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %1, i32 0, i32 0
  %2 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths, align 8
  %tobool1 = icmp ne %struct.IntVectorStruct* %2, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths3 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %3, i32 0, i32 0
  %4 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths3, align 8
  %cmp = icmp eq %struct.IntVectorStruct* %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %if.end61

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %maxLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %5, i32 0, i32 2
  %6 = load i32, i32* %maxLength, align 4
  %add = add nsw i32 %6, 1
  %conv = sext i32 %add to i64
  %call = call noalias i8* @calloc(i64 %conv, i64 4) #7
  %7 = bitcast i8* %call to i32*
  %8 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %histogram = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %8, i32 0, i32 5
  store i32* %7, i32** %histogram, align 8
  %9 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %histogram4 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %9, i32 0, i32 5
  %10 = load i32*, i32** %histogram4, align 8
  %tobool5 = icmp ne i32* %10, null
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  br label %if.end61

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %11 = load i32, i32* %i, align 4
  %12 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths8 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %12, i32 0, i32 0
  %13 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths8, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %13, i32 0, i32 0
  %14 = load i32, i32* %size, align 8
  %cmp9 = icmp slt i32 %11, %14
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths11 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %15, i32 0, i32 0
  %16 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths11, align 8
  %vector = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %16, i32 0, i32 2
  %17 = load i32*, i32** %vector, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds i32, i32* %17, i64 %idxprom
  %19 = load i32, i32* %arrayidx, align 4
  %cmp12 = icmp sgt i32 %19, 0
  br i1 %cmp12, label %if.then14, label %if.end25

if.then14:                                        ; preds = %for.body
  %20 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths15 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %20, i32 0, i32 0
  %21 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths15, align 8
  %vector16 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %21, i32 0, i32 2
  %22 = load i32*, i32** %vector16, align 8
  %23 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %23 to i64
  %arrayidx18 = getelementptr inbounds i32, i32* %22, i64 %idxprom17
  %24 = load i32, i32* %arrayidx18, align 4
  store i32 %24, i32* %length, align 4
  %25 = load i32, i32* %length, align 4
  %conv19 = sitofp i32 %25 to double
  %26 = load double, double* %sum, align 8
  %add20 = fadd double %26, %conv19
  store double %add20, double* %sum, align 8
  %27 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %histogram21 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %27, i32 0, i32 5
  %28 = load i32*, i32** %histogram21, align 8
  %29 = load i32, i32* %length, align 4
  %idxprom22 = sext i32 %29 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %28, i64 %idxprom22
  %30 = load i32, i32* %arrayidx23, align 4
  %add24 = add nsw i32 %30, 1
  store i32 %add24, i32* %arrayidx23, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then14, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end25
  %31 = load i32, i32* %i, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %32 = load i32, i32* %i, align 4
  %cmp26 = icmp sgt i32 %32, 0
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %for.end
  %33 = load double, double* %sum, align 8
  %34 = load i32, i32* %i, align 4
  %conv29 = sitofp i32 %34 to double
  %div = fdiv double %33, %conv29
  %35 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %averageLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %35, i32 0, i32 3
  store double %div, double* %averageLength, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %for.end
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc52, %if.end30
  %36 = load i32, i32* %i, align 4
  %37 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths32 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %37, i32 0, i32 0
  %38 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths32, align 8
  %size33 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %38, i32 0, i32 0
  %39 = load i32, i32* %size33, align 8
  %cmp34 = icmp slt i32 %36, %39
  br i1 %cmp34, label %for.body36, label %for.end54

for.body36:                                       ; preds = %for.cond31
  %40 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths37 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %40, i32 0, i32 0
  %41 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths37, align 8
  %vector38 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %41, i32 0, i32 2
  %42 = load i32*, i32** %vector38, align 8
  %43 = load i32, i32* %i, align 4
  %idxprom39 = sext i32 %43 to i64
  %arrayidx40 = getelementptr inbounds i32, i32* %42, i64 %idxprom39
  %44 = load i32, i32* %arrayidx40, align 4
  %cmp41 = icmp sgt i32 %44, 0
  br i1 %cmp41, label %if.then43, label %if.end51

if.then43:                                        ; preds = %for.body36
  %45 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %pathLengths44 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %45, i32 0, i32 0
  %46 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %pathLengths44, align 8
  %vector45 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %46, i32 0, i32 2
  %47 = load i32*, i32** %vector45, align 8
  %48 = load i32, i32* %i, align 4
  %idxprom46 = sext i32 %48 to i64
  %arrayidx47 = getelementptr inbounds i32, i32* %47, i64 %idxprom46
  %49 = load i32, i32* %arrayidx47, align 4
  %conv48 = sitofp i32 %49 to double
  %50 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %averageLength49 = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %50, i32 0, i32 3
  %51 = load double, double* %averageLength49, align 8
  %sub = fsub double %conv48, %51
  store double %sub, double* %diff, align 8
  %52 = load double, double* %diff, align 8
  %53 = load double, double* %diff, align 8
  %mul = fmul double %52, %53
  %54 = load double, double* %sum, align 8
  %add50 = fadd double %54, %mul
  store double %add50, double* %sum, align 8
  br label %if.end51

if.end51:                                         ; preds = %if.then43, %for.body36
  br label %for.inc52

for.inc52:                                        ; preds = %if.end51
  %55 = load i32, i32* %i, align 4
  %inc53 = add nsw i32 %55, 1
  store i32 %inc53, i32* %i, align 4
  br label %for.cond31

for.end54:                                        ; preds = %for.cond31
  %56 = load i32, i32* %i, align 4
  %cmp55 = icmp sgt i32 %56, 0
  br i1 %cmp55, label %if.then57, label %if.end61

if.then57:                                        ; preds = %for.end54
  %57 = load double, double* %sum, align 8
  %58 = load i32, i32* %i, align 4
  %conv58 = sitofp i32 %58 to double
  %div59 = fdiv double %57, %conv58
  %call60 = call double @sqrt(double %div59) #7
  %59 = load %struct.StatsStruct*, %struct.StatsStruct** %stats.addr, align 8
  %standardDeviation = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %59, i32 0, i32 4
  store double %call60, double* %standardDeviation, align 8
  br label %if.end61

if.end61:                                         ; preds = %if.then57, %for.end54, %if.then6, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @testStats() #0 {
entry:
  %i = alloca i32, align 4
  %test = alloca %struct.StatsStruct*, align 8
  %bogon = alloca %struct.NodePtrVecStruct, align 8
  %call = call %struct.StatsStruct* @Stats_new()
  store %struct.StatsStruct* %call, %struct.StatsStruct** %test, align 8
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 %1, i32* %contentSize, align 8
  %2 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call1 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %2, %struct.NodePtrVecStruct* %bogon)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %contentSize2 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 1, i32* %contentSize2, align 8
  %4 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call3 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %4, %struct.NodePtrVecStruct* %bogon)
  %contentSize4 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 4, i32* %contentSize4, align 8
  %5 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call5 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %5, %struct.NodePtrVecStruct* %bogon)
  %contentSize6 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize6, align 8
  %6 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call7 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %6, %struct.NodePtrVecStruct* %bogon)
  %contentSize8 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 6, i32* %contentSize8, align 8
  %7 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call9 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %7, %struct.NodePtrVecStruct* %bogon)
  %contentSize10 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize10, align 8
  %8 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call11 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %8, %struct.NodePtrVecStruct* %bogon)
  %contentSize12 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize12, align 8
  %9 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call13 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %9, %struct.NodePtrVecStruct* %bogon)
  %contentSize14 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 4, i32* %contentSize14, align 8
  %10 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call15 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %10, %struct.NodePtrVecStruct* %bogon)
  %contentSize16 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize16, align 8
  %11 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call17 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %11, %struct.NodePtrVecStruct* %bogon)
  %contentSize18 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 6, i32* %contentSize18, align 8
  %12 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call19 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %12, %struct.NodePtrVecStruct* %bogon)
  %contentSize20 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize20, align 8
  %13 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call21 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %13, %struct.NodePtrVecStruct* %bogon)
  %contentSize22 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %bogon, i32 0, i32 0
  store i32 5, i32* %contentSize22, align 8
  %14 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %call23 = call zeroext i1 @Stats_logPath(%struct.StatsStruct* %14, %struct.NodePtrVecStruct* %bogon)
  %15 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  call void @Stats_calculate(%struct.StatsStruct* %15)
  %16 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %averageLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %16, i32 0, i32 3
  %17 = load double, double* %averageLength, align 8
  %18 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %standardDeviation = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %18, i32 0, i32 4
  %19 = load double, double* %standardDeviation, align 8
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.93, i64 0, i64 0), double %17, double %19)
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1.94, i64 0, i64 0))
  %20 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %minLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %20, i32 0, i32 1
  %21 = load i32, i32* %minLength, align 8
  store i32 %21, i32* %i, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc30, %for.end
  %22 = load i32, i32* %i, align 4
  %23 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %maxLength = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %23, i32 0, i32 2
  %24 = load i32, i32* %maxLength, align 4
  %cmp27 = icmp slt i32 %22, %24
  br i1 %cmp27, label %for.body28, label %for.end32

for.body28:                                       ; preds = %for.cond26
  %25 = load i32, i32* %i, align 4
  %26 = load %struct.StatsStruct*, %struct.StatsStruct** %test, align 8
  %histogram = getelementptr inbounds %struct.StatsStruct, %struct.StatsStruct* %26, i32 0, i32 5
  %27 = load i32*, i32** %histogram, align 8
  %28 = load i32, i32* %i, align 4
  %idxprom = sext i32 %28 to i64
  %arrayidx = getelementptr inbounds i32, i32* %27, i64 %idxprom
  %29 = load i32, i32* %arrayidx, align 4
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2.95, i64 0, i64 0), i32 %25, i32 %29)
  br label %for.inc30

for.inc30:                                        ; preds = %for.body28
  %30 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %30, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond26

for.end32:                                        ; preds = %for.cond26
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.SystemCallMapElementStruct* @SystemCallMapElement_new(i8* %label, i32 %initialSize) #0 {
entry:
  %retval = alloca %struct.SystemCallMapElementStruct*, align 8
  %label.addr = alloca i8*, align 8
  %initialSize.addr = alloca i32, align 4
  %element = alloca %struct.SystemCallMapElementStruct*, align 8
  store i8* %label, i8** %label.addr, align 8
  store i32 %initialSize, i32* %initialSize.addr, align 4
  %call = call noalias i8* @malloc(i64 24) #7
  %0 = bitcast i8* %call to %struct.SystemCallMapElementStruct*
  store %struct.SystemCallMapElementStruct* %0, %struct.SystemCallMapElementStruct** %element, align 8
  %1 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %tobool = icmp ne %struct.SystemCallMapElementStruct* %1, null
  br i1 %tobool, label %if.then, label %if.end12

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %label.addr, align 8
  %call1 = call noalias i8* @strdup(i8* %2) #7
  %3 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %label2 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %3, i32 0, i32 0
  store i8* %call1, i8** %label2, align 8
  %4 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %index = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %4, i32 0, i32 1
  store i32 -1, i32* %index, align 8
  %5 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %label3 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %5, i32 0, i32 0
  %6 = load i8*, i8** %label3, align 8
  %tobool4 = icmp ne i8* %6, null
  br i1 %tobool4, label %if.end, label %if.then5

if.then5:                                         ; preds = %if.then
  %7 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %8 = bitcast %struct.SystemCallMapElementStruct* %7 to i8*
  call void @free(i8* %8) #7
  store %struct.SystemCallMapElementStruct* null, %struct.SystemCallMapElementStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %9 = load i32, i32* %initialSize.addr, align 4
  %call6 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 %9)
  %10 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %10, i32 0, i32 2
  store %struct.NodePtrVecStruct* %call6, %struct.NodePtrVecStruct** %nodes, align 8
  %11 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes7 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %11, i32 0, i32 2
  %12 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes7, align 8
  %tobool8 = icmp ne %struct.NodePtrVecStruct* %12, null
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.end
  %13 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %label10 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %13, i32 0, i32 0
  %14 = load i8*, i8** %label10, align 8
  call void @free(i8* %14) #7
  %15 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %16 = bitcast %struct.SystemCallMapElementStruct* %15 to i8*
  call void @free(i8* %16) #7
  store %struct.SystemCallMapElementStruct* null, %struct.SystemCallMapElementStruct** %retval, align 8
  br label %return

if.end11:                                         ; preds = %if.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %entry
  %17 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  store %struct.SystemCallMapElementStruct* %17, %struct.SystemCallMapElementStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end12, %if.then9, %if.then5
  %18 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %retval, align 8
  ret %struct.SystemCallMapElementStruct* %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @SystemCallMapElement_delete(%struct.SystemCallMapElementStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.SystemCallMapElementStruct*, align 8
  store %struct.SystemCallMapElementStruct* %trash, %struct.SystemCallMapElementStruct** %trash.addr, align 8
  %0 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.SystemCallMapElementStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %trash.addr, align 8
  %label = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %1, i32 0, i32 0
  %2 = load i8*, i8** %label, align 8
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %trash.addr, align 8
  %label3 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %3, i32 0, i32 0
  %4 = load i8*, i8** %label3, align 8
  call void @free(i8* %4) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %trash.addr, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %5, i32 0, i32 2
  %6 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %6)
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.SystemCallMapStruct* @SystemCallMap_new(i32 %initialSize) #0 {
entry:
  %retval = alloca %struct.SystemCallMapStruct*, align 8
  %initialSize.addr = alloca i32, align 4
  %map = alloca %struct.SystemCallMapStruct*, align 8
  %vector = alloca %struct.SystemCallMapElementStruct**, align 8
  store i32 %initialSize, i32* %initialSize.addr, align 4
  store %struct.SystemCallMapStruct* null, %struct.SystemCallMapStruct** %map, align 8
  store %struct.SystemCallMapElementStruct** null, %struct.SystemCallMapElementStruct*** %vector, align 8
  %0 = load i32, i32* %initialSize.addr, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.SystemCallMapStruct* null, %struct.SystemCallMapStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %initialSize.addr, align 4
  %conv = sext i32 %1 to i64
  %mul = mul i64 %conv, 8
  %call = call noalias i8* @malloc(i64 %mul) #7
  %2 = bitcast i8* %call to %struct.SystemCallMapElementStruct**
  store %struct.SystemCallMapElementStruct** %2, %struct.SystemCallMapElementStruct*** %vector, align 8
  %3 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %tobool = icmp ne %struct.SystemCallMapElementStruct** %3, null
  br i1 %tobool, label %if.then1, label %if.end7

if.then1:                                         ; preds = %if.end
  %call2 = call noalias i8* @malloc(i64 16) #7
  %4 = bitcast i8* %call2 to %struct.SystemCallMapStruct*
  store %struct.SystemCallMapStruct* %4, %struct.SystemCallMapStruct** %map, align 8
  %5 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map, align 8
  %tobool3 = icmp ne %struct.SystemCallMapStruct* %5, null
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then1
  %6 = load i32, i32* %initialSize.addr, align 4
  %7 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map, align 8
  %allocatedSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %7, i32 0, i32 1
  store i32 %6, i32* %allocatedSize, align 4
  %8 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %8, i32 0, i32 0
  store i32 0, i32* %contentSize, align 8
  %9 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %10 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map, align 8
  %vector5 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %10, i32 0, i32 2
  store %struct.SystemCallMapElementStruct** %9, %struct.SystemCallMapElementStruct*** %vector5, align 8
  br label %if.end6

if.else:                                          ; preds = %if.then1
  %11 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %12 = bitcast %struct.SystemCallMapElementStruct** %11 to i8*
  call void @free(i8* %12) #7
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %13 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map, align 8
  store %struct.SystemCallMapStruct* %13, %struct.SystemCallMapStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %14 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %retval, align 8
  ret %struct.SystemCallMapStruct* %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @SystemCallMap_delete(%struct.SystemCallMapStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.SystemCallMapStruct*, align 8
  %i = alloca i32, align 4
  store %struct.SystemCallMapStruct* %trash, %struct.SystemCallMapStruct** %trash.addr, align 8
  %0 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.SystemCallMapStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %trash.addr, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %2, i32 0, i32 0
  %3 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %trash.addr, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %4, i32 0, i32 2
  %5 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %5, i64 %idxprom
  %7 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  call void @SystemCallMapElement_delete(%struct.SystemCallMapElementStruct* %7)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @SystemCallMap_insert(%struct.SystemCallMapStruct* %map, i8* %label, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca i1, align 1
  %map.addr = alloca %struct.SystemCallMapStruct*, align 8
  %label.addr = alloca i8*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %i = alloca i32, align 4
  %newElement = alloca %struct.SystemCallMapElementStruct*, align 8
  %success = alloca i8, align 1
  store %struct.SystemCallMapStruct* %map, %struct.SystemCallMapStruct** %map.addr, align 8
  store i8* %label, i8** %label.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  store i32 0, i32* %i, align 4
  store %struct.SystemCallMapElementStruct* null, %struct.SystemCallMapElementStruct** %newElement, align 8
  store i8 0, i8* %success, align 1
  %0 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %tobool = icmp ne %struct.SystemCallMapStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %label.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool3 = icmp ne %struct.NodeStruct* %2, null
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %3, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %label.addr, align 8
  %7 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %7, i32 0, i32 2
  %8 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %8, i64 %idxprom
  %10 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  %label4 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %10, i32 0, i32 0
  %11 = load i8*, i8** %label4, align 8
  %call = call i32 @strcmp(i8* %6, i8* %11) #9
  %cmp5 = icmp eq i32 %call, 0
  br i1 %cmp5, label %if.then6, label %if.end16

if.then6:                                         ; preds = %for.body
  %12 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector7 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %12, i32 0, i32 2
  %13 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector7, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %13, i64 %idxprom8
  %15 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx9, align 8
  %label10 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %15, i32 0, i32 0
  %16 = load i8*, i8** %label10, align 8
  %17 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %label11 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %17, i32 0, i32 2
  store i8* %16, i8** %label11, align 8
  %18 = load i32, i32* %i, align 4
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %labelIdx = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %19, i32 0, i32 3
  store i32 %18, i32* %labelIdx, align 8
  %20 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector12 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %20, i32 0, i32 2
  %21 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector12, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %22 to i64
  %arrayidx14 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %21, i64 %idxprom13
  %23 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx14, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %23, i32 0, i32 2
  %24 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes, align 8
  %25 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call15 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %24, %struct.NodeStruct* %25)
  store i1 %call15, i1* %retval, align 1
  br label %return

if.end16:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %27 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize17 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %27, i32 0, i32 0
  %28 = load i32, i32* %contentSize17, align 8
  %29 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %29, i32 0, i32 1
  %30 = load i32, i32* %allocatedSize, align 4
  %cmp18 = icmp eq i32 %28, %30
  br i1 %cmp18, label %if.then19, label %if.end31

if.then19:                                        ; preds = %for.end
  %31 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector20 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %31, i32 0, i32 2
  %32 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector20, align 8
  %33 = bitcast %struct.SystemCallMapElementStruct** %32 to i8*
  %34 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %allocatedSize21 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %34, i32 0, i32 1
  %35 = load i32, i32* %allocatedSize21, align 4
  %mul = mul nsw i32 %35, 2
  %conv = sext i32 %mul to i64
  %mul22 = mul i64 %conv, 8
  %call23 = call i8* @realloc(i8* %33, i64 %mul22) #7
  %36 = bitcast i8* %call23 to %struct.SystemCallMapElementStruct**
  %37 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector24 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %37, i32 0, i32 2
  store %struct.SystemCallMapElementStruct** %36, %struct.SystemCallMapElementStruct*** %vector24, align 8
  %38 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector25 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %38, i32 0, i32 2
  %39 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector25, align 8
  %tobool26 = icmp ne %struct.SystemCallMapElementStruct** %39, null
  br i1 %tobool26, label %if.then27, label %if.else

if.then27:                                        ; preds = %if.then19
  %40 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %allocatedSize28 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %40, i32 0, i32 1
  %41 = load i32, i32* %allocatedSize28, align 4
  %mul29 = mul nsw i32 %41, 2
  store i32 %mul29, i32* %allocatedSize28, align 4
  br label %if.end30

if.else:                                          ; preds = %if.then19
  store i1 false, i1* %retval, align 1
  br label %return

if.end30:                                         ; preds = %if.then27
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %for.end
  %42 = load i8*, i8** %label.addr, align 8
  %call32 = call %struct.SystemCallMapElementStruct* @SystemCallMapElement_new(i8* %42, i32 8)
  store %struct.SystemCallMapElementStruct* %call32, %struct.SystemCallMapElementStruct** %newElement, align 8
  %43 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  %tobool33 = icmp ne %struct.SystemCallMapElementStruct* %43, null
  br i1 %tobool33, label %if.end35, label %if.then34

if.then34:                                        ; preds = %if.end31
  store i1 false, i1* %retval, align 1
  br label %return

if.end35:                                         ; preds = %if.end31
  %44 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  %nodes36 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %44, i32 0, i32 2
  %45 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes36, align 8
  %46 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %call37 = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %45, %struct.NodeStruct* %46)
  %frombool = zext i1 %call37 to i8
  store i8 %frombool, i8* %success, align 1
  %47 = load i8, i8* %success, align 1
  %tobool38 = trunc i8 %47 to i1
  br i1 %tobool38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end35
  %48 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  call void @SystemCallMapElement_delete(%struct.SystemCallMapElementStruct* %48)
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end35
  %49 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  %label41 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %49, i32 0, i32 0
  %50 = load i8*, i8** %label41, align 8
  %51 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %label42 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %51, i32 0, i32 2
  store i8* %50, i8** %label42, align 8
  %52 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize43 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %52, i32 0, i32 0
  %53 = load i32, i32* %contentSize43, align 8
  %54 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  %index = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %54, i32 0, i32 1
  store i32 %53, i32* %index, align 8
  %55 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %labelIdx44 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %55, i32 0, i32 3
  store i32 %53, i32* %labelIdx44, align 8
  %56 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %newElement, align 8
  %57 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector45 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %57, i32 0, i32 2
  %58 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector45, align 8
  %59 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize46 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %59, i32 0, i32 0
  %60 = load i32, i32* %contentSize46, align 8
  %idxprom47 = sext i32 %60 to i64
  %arrayidx48 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %58, i64 %idxprom47
  store %struct.SystemCallMapElementStruct* %56, %struct.SystemCallMapElementStruct** %arrayidx48, align 8
  %61 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize49 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %61, i32 0, i32 0
  %62 = load i32, i32* %contentSize49, align 8
  %add = add nsw i32 %62, 1
  store i32 %add, i32* %contentSize49, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end40, %if.then34, %if.else, %if.then6, %if.then
  %63 = load i1, i1* %retval, align 1
  ret i1 %63
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodePtrVecStruct* @SystemCallMap_findLabeledNodes(%struct.SystemCallMapStruct* %systemCalls, i8* %label) #0 {
entry:
  %retval = alloca %struct.NodePtrVecStruct*, align 8
  %systemCalls.addr = alloca %struct.SystemCallMapStruct*, align 8
  %label.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct.SystemCallMapStruct* %systemCalls, %struct.SystemCallMapStruct** %systemCalls.addr, align 8
  store i8* %label, i8** %label.addr, align 8
  %0 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCalls.addr, align 8
  %tobool = icmp ne %struct.SystemCallMapStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %label.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %3 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCalls.addr, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %3, i32 0, i32 0
  %4 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %2, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %label.addr, align 8
  %6 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCalls.addr, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %6, i32 0, i32 2
  %7 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %7, i64 %idxprom
  %9 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  %label2 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %9, i32 0, i32 0
  %10 = load i8*, i8** %label2, align 8
  %call = call i32 @strcmp(i8* %5, i8* %10) #9
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %for.body
  %11 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %systemCalls.addr, align 8
  %vector5 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %11, i32 0, i32 2
  %12 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector5, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %12, i64 %idxprom6
  %14 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx7, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %14, i32 0, i32 2
  %15 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes, align 8
  store %struct.NodePtrVecStruct* %15, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end8:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  %17 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %retval, align 8
  ret %struct.NodePtrVecStruct* %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @SystemCallMap_getLabelIndex(%struct.SystemCallMapStruct* %map, i8* %label) #0 {
entry:
  %retval = alloca i32, align 4
  %map.addr = alloca %struct.SystemCallMapStruct*, align 8
  %label.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct.SystemCallMapStruct* %map, %struct.SystemCallMapStruct** %map.addr, align 8
  store i8* %label, i8** %label.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %label.addr, align 8
  %4 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %4, i32 0, i32 2
  %5 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %5, i64 %idxprom
  %7 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  %label1 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %7, i32 0, i32 0
  %8 = load i8*, i8** %label1, align 8
  %call = call i32 @strcmp(i8* %3, i8* %8) #9
  %cmp2 = icmp eq i32 %call, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  store i32 %9, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @SystemCallMap_signatureRepresented(%struct.SystemCallMapStruct* %map, i8** %signature) #0 {
entry:
  %map.addr = alloca %struct.SystemCallMapStruct*, align 8
  %signature.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %foundByLabel = alloca i8, align 1
  store %struct.SystemCallMapStruct* %map, %struct.SystemCallMapStruct** %map.addr, align 8
  store i8** %signature, i8*** %signature.addr, align 8
  store i8 1, i8* %foundByLabel, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8**, i8*** %signature.addr, align 8
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 %idxprom
  %2 = load i8*, i8** %arrayidx, align 8
  %cmp = icmp ne i8* %2, null
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load i8, i8* %foundByLabel, align 1
  %tobool = trunc i8 %3 to i1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %6 = load i8**, i8*** %signature.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i64 %idxprom1
  %8 = load i8*, i8** %arrayidx2, align 8
  %call = call i32 @SystemCallMap_getLabelIndex(%struct.SystemCallMapStruct* %5, i8* %8)
  %cmp3 = icmp slt i32 %call, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i8 0, i8* %foundByLabel, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %10 = load i8, i8* %foundByLabel, align 1
  %tobool4 = trunc i8 %10 to i1
  ret i1 %tobool4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @edgeListPrettyPrint(%struct.EdgeListStruct* %edges, i32 %depth, i8* %header) #0 {
entry:
  %edges.addr = alloca %struct.EdgeListStruct*, align 8
  %depth.addr = alloca i32, align 4
  %header.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct.EdgeListStruct* %edges, %struct.EdgeListStruct** %edges.addr, align 8
  store i32 %depth, i32* %depth.addr, align 4
  store i8* %header, i8** %header.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %depth.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.102, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = load i8*, i8** %header.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.103, i64 0, i64 0), i8* %3)
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc6, %for.end
  %4 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges.addr, align 8
  %cmp3 = icmp ne %struct.EdgeListStruct* %4, null
  br i1 %cmp3, label %for.body4, label %for.end7

for.body4:                                        ; preds = %for.cond2
  %5 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges.addr, align 8
  %targetNodeId = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %5, i32 0, i32 0
  %6 = load i32, i32* %targetNodeId, align 8
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.104, i64 0, i64 0), i32 %6)
  br label %for.inc6

for.inc6:                                         ; preds = %for.body4
  %7 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges.addr, align 8
  %nextEdge = getelementptr inbounds %struct.EdgeListStruct, %struct.EdgeListStruct* %7, i32 0, i32 2
  %8 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %nextEdge, align 8
  store %struct.EdgeListStruct* %8, %struct.EdgeListStruct** %edges.addr, align 8
  br label %for.cond2

for.end7:                                         ; preds = %for.cond2
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.105, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @nodeListPrettyPrint(%struct.NodeListStruct* %nodes, i32 %depth, i8* %separator, i1 zeroext %multiLine) #0 {
entry:
  %nodes.addr = alloca %struct.NodeListStruct*, align 8
  %depth.addr = alloca i32, align 4
  %separator.addr = alloca i8*, align 8
  %multiLine.addr = alloca i8, align 1
  %i = alloca i32, align 4
  store %struct.NodeListStruct* %nodes, %struct.NodeListStruct** %nodes.addr, align 8
  store i32 %depth, i32* %depth.addr, align 4
  store i8* %separator, i8** %separator.addr, align 8
  %frombool = zext i1 %multiLine to i8
  store i8 %frombool, i8* %multiLine.addr, align 1
  %0 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes.addr, align 8
  %tobool = icmp ne %struct.NodeListStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %if.end16

if.end:                                           ; preds = %entry
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes.addr, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %1, i32 0, i32 0
  %2 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %tobool1 = icmp ne %struct.NodeStruct* %2, null
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes.addr, align 8
  %node3 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 0
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %node3, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %id, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4.106, i64 0, i64 0), i32 %5)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes.addr, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %6, i32 0, i32 1
  %7 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  %tobool5 = icmp ne %struct.NodeListStruct* %7, null
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end4
  %8 = load i8, i8* %multiLine.addr, align 1
  %tobool7 = trunc i8 %8 to i1
  br i1 %tobool7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.then6
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.105, i64 0, i64 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then8
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %depth.addr, align 4
  %cmp = icmp slt i32 %9, %10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5.107, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end11

if.end11:                                         ; preds = %for.end, %if.then6
  %12 = load i8*, i8** %separator.addr, align 8
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6.108, i64 0, i64 0), i8* %12)
  %13 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nodes.addr, align 8
  %nextNode13 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %13, i32 0, i32 1
  %14 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode13, align 8
  %15 = load i32, i32* %depth.addr, align 4
  %add = add nsw i32 %15, 1
  %16 = load i8*, i8** %separator.addr, align 8
  %17 = load i8, i8* %multiLine.addr, align 1
  %tobool14 = trunc i8 %17 to i1
  call void @nodeListPrettyPrint(%struct.NodeListStruct* %14, i32 %add, i8* %16, i1 zeroext %tobool14)
  br label %if.end16

if.else:                                          ; preds = %if.end4
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.105, i64 0, i64 0))
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.end11, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @graphPrettyPrint(%struct.GraphStruct* %graph) #0 {
entry:
  %graph.addr = alloca %struct.GraphStruct*, align 8
  %outerPtr = alloca %struct.NodeListStruct*, align 8
  %innerPtr = alloca %struct.NodeListStruct*, align 8
  store %struct.GraphStruct* %graph, %struct.GraphStruct** %graph.addr, align 8
  %0 = load %struct.GraphStruct*, %struct.GraphStruct** %graph.addr, align 8
  %outerNodes = getelementptr inbounds %struct.GraphStruct, %struct.GraphStruct* %0, i32 0, i32 2
  %1 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerNodes, align 8
  store %struct.NodeListStruct* %1, %struct.NodeListStruct** %outerPtr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %entry
  %2 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %cmp = icmp ne %struct.NodeListStruct* %2, null
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  %3 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %3, i32 0, i32 0
  %4 = load %struct.NodeStruct*, %struct.NodeStruct** %node, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %id, align 8
  %6 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node1 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %6, i32 0, i32 0
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %node1, align 8
  %nodeCount = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %7, i32 0, i32 1
  %8 = load i32, i32* %nodeCount, align 4
  %9 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node2 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %9, i32 0, i32 0
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %node2, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %10, i32 0, i32 2
  %11 = load i8*, i8** %label, align 8
  %tobool = icmp ne i8* %11, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %12 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node3 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %12, i32 0, i32 0
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %node3, align 8
  %label4 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 2
  %14 = load i8*, i8** %label4, align 8
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %14, %cond.true ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8.109, i64 0, i64 0), %cond.false ]
  %15 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node5 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %15, i32 0, i32 0
  %16 = load %struct.NodeStruct*, %struct.NodeStruct** %node5, align 8
  %labelIdx = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %16, i32 0, i32 3
  %17 = load i32, i32* %labelIdx, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7.110, i64 0, i64 0), i32 %5, i32 %8, i8* %cond, i32 %17)
  %18 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node6 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %18, i32 0, i32 0
  %19 = load %struct.NodeStruct*, %struct.NodeStruct** %node6, align 8
  %edges = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %19, i32 0, i32 7
  %20 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges, align 8
  call void @edgeListPrettyPrint(%struct.EdgeListStruct* %20, i32 1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9.111, i64 0, i64 0))
  %21 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %node7 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %21, i32 0, i32 0
  %22 = load %struct.NodeStruct*, %struct.NodeStruct** %node7, align 8
  %interiorNodes = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %22, i32 0, i32 6
  %23 = load %struct.NodeListStruct*, %struct.NodeListStruct** %interiorNodes, align 8
  store %struct.NodeListStruct* %23, %struct.NodeListStruct** %innerPtr, align 8
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %cond.end
  %24 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerPtr, align 8
  %cmp9 = icmp ne %struct.NodeListStruct* %24, null
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond8
  %25 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerPtr, align 8
  %node11 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %25, i32 0, i32 0
  %26 = load %struct.NodeStruct*, %struct.NodeStruct** %node11, align 8
  %id12 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %26, i32 0, i32 0
  %27 = load i32, i32* %id12, align 8
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.10.112, i64 0, i64 0), i32 %27)
  %28 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerPtr, align 8
  %node14 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %28, i32 0, i32 0
  %29 = load %struct.NodeStruct*, %struct.NodeStruct** %node14, align 8
  %edges15 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %29, i32 0, i32 7
  %30 = load %struct.EdgeListStruct*, %struct.EdgeListStruct** %edges15, align 8
  call void @edgeListPrettyPrint(%struct.EdgeListStruct* %30, i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9.111, i64 0, i64 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %31 = load %struct.NodeListStruct*, %struct.NodeListStruct** %innerPtr, align 8
  %nextNode = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %31, i32 0, i32 1
  %32 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode, align 8
  store %struct.NodeListStruct* %32, %struct.NodeListStruct** %innerPtr, align 8
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %33 = load %struct.NodeListStruct*, %struct.NodeListStruct** %outerPtr, align 8
  %nextNode17 = getelementptr inbounds %struct.NodeListStruct, %struct.NodeListStruct* %33, i32 0, i32 1
  %34 = load %struct.NodeListStruct*, %struct.NodeListStruct** %nextNode17, align 8
  store %struct.NodeListStruct* %34, %struct.NodeListStruct** %outerPtr, align 8
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.113, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @systemCallMapPrettyPrint(%struct.SystemCallMapStruct* %map) #0 {
entry:
  %map.addr = alloca %struct.SystemCallMapStruct*, align 8
  %element = alloca %struct.SystemCallMapElementStruct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.SystemCallMapStruct* %map, %struct.SystemCallMapStruct** %map.addr, align 8
  store %struct.SystemCallMapElementStruct* null, %struct.SystemCallMapElementStruct** %element, align 8
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  %0 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %tobool = icmp ne %struct.SystemCallMapStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %2, i32 0, i32 0
  %3 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %4 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %vector = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %4, i32 0, i32 2
  %5 = load %struct.SystemCallMapElementStruct**, %struct.SystemCallMapElementStruct*** %vector, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %5, i64 %idxprom
  %7 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %arrayidx, align 8
  store %struct.SystemCallMapElementStruct* %7, %struct.SystemCallMapElementStruct** %element, align 8
  %8 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %label = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %8, i32 0, i32 0
  %9 = load i8*, i8** %label, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12.114, i64 0, i64 0), i8* %9)
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %10 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %10, i32 0, i32 2
  %11 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes, align 8
  %tobool2 = icmp ne %struct.NodePtrVecStruct* %11, null
  br i1 %tobool2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond1
  %12 = load i32, i32* %j, align 4
  %13 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes3 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %13, i32 0, i32 2
  %14 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes3, align 8
  %contentSize4 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %14, i32 0, i32 0
  %15 = load i32, i32* %contentSize4, align 8
  %cmp5 = icmp slt i32 %12, %15
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond1
  %16 = phi i1 [ false, %for.cond1 ], [ %cmp5, %land.rhs ]
  br i1 %16, label %for.body6, label %for.end

for.body6:                                        ; preds = %land.end
  %17 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes7 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %17, i32 0, i32 2
  %18 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes7, align 8
  %vector8 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %18, i32 0, i32 2
  %19 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector8, align 8
  %20 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %20 to i64
  %arrayidx10 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %19, i64 %idxprom9
  %21 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx10, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %21, i32 0, i32 0
  %22 = load i32, i32* %id, align 8
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4.106, i64 0, i64 0), i32 %22)
  %23 = load i32, i32* %j, align 4
  %24 = load %struct.SystemCallMapElementStruct*, %struct.SystemCallMapElementStruct** %element, align 8
  %nodes12 = getelementptr inbounds %struct.SystemCallMapElementStruct, %struct.SystemCallMapElementStruct* %24, i32 0, i32 2
  %25 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %nodes12, align 8
  %contentSize13 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %25, i32 0, i32 0
  %26 = load i32, i32* %contentSize13, align 8
  %sub = sub nsw i32 %26, 1
  %cmp14 = icmp slt i32 %23, %sub
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %for.body6
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13.115, i64 0, i64 0))
  br label %if.end18

if.else:                                          ; preds = %for.body6
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11.113, i64 0, i64 0))
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then15
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %27 = load i32, i32* %j, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %land.end
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %28, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  %29 = load %struct.SystemCallMapStruct*, %struct.SystemCallMapStruct** %map.addr, align 8
  %contentSize22 = getelementptr inbounds %struct.SystemCallMapStruct, %struct.SystemCallMapStruct* %29, i32 0, i32 0
  %30 = load i32, i32* %contentSize22, align 8
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.14.116, i64 0, i64 0), i32 %30)
  br label %return

return:                                           ; preds = %for.end21, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @testGraph() #0 {
entry:
  %retval = alloca i1, align 1
  %graph = alloca %struct.GraphStruct*, align 8
  %outerNode1 = alloca %struct.NodeStruct*, align 8
  %outerNode2 = alloca %struct.NodeStruct*, align 8
  %innerNode11 = alloca %struct.NodeStruct*, align 8
  %innerNode12 = alloca %struct.NodeStruct*, align 8
  %innerNode21 = alloca %struct.NodeStruct*, align 8
  %innerNode22 = alloca %struct.NodeStruct*, align 8
  %innerNode23 = alloca %struct.NodeStruct*, align 8
  %call = call noalias i8* @malloc(i64 40) #7
  %0 = bitcast i8* %call to %struct.GraphStruct*
  store %struct.GraphStruct* %0, %struct.GraphStruct** %graph, align 8
  %call1 = call %struct.NodeStruct* @Node_new(i32 10, i32 0)
  store %struct.NodeStruct* %call1, %struct.NodeStruct** %outerNode1, align 8
  %call2 = call %struct.NodeStruct* @Node_new(i32 20, i32 1)
  store %struct.NodeStruct* %call2, %struct.NodeStruct** %outerNode2, align 8
  %call3 = call %struct.NodeStruct* @Node_new(i32 11, i32 2)
  store %struct.NodeStruct* %call3, %struct.NodeStruct** %innerNode11, align 8
  %call4 = call %struct.NodeStruct* @Node_new(i32 12, i32 3)
  store %struct.NodeStruct* %call4, %struct.NodeStruct** %innerNode12, align 8
  %call5 = call %struct.NodeStruct* @Node_new(i32 21, i32 4)
  store %struct.NodeStruct* %call5, %struct.NodeStruct** %innerNode21, align 8
  %call6 = call %struct.NodeStruct* @Node_new(i32 22, i32 5)
  store %struct.NodeStruct* %call6, %struct.NodeStruct** %innerNode22, align 8
  %call7 = call %struct.NodeStruct* @Node_new(i32 23, i32 6)
  store %struct.NodeStruct* %call7, %struct.NodeStruct** %innerNode23, align 8
  %1 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %tobool = icmp ne %struct.GraphStruct* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode1, align 8
  %call8 = call zeroext i1 @Graph_addOuterNode(%struct.GraphStruct* %2, %struct.NodeStruct* %3)
  %4 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  %5 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode2, align 8
  %call9 = call zeroext i1 @Graph_addOuterNode(%struct.GraphStruct* %4, %struct.NodeStruct* %5)
  %6 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode1, align 8
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %innerNode11, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %6, %struct.NodeStruct* %7)
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode1, align 8
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %innerNode12, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %8, %struct.NodeStruct* %9)
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode2, align 8
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %innerNode21, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %10, %struct.NodeStruct* %11)
  %12 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode2, align 8
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %innerNode22, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %12, %struct.NodeStruct* %13)
  %14 = load %struct.NodeStruct*, %struct.NodeStruct** %outerNode2, align 8
  %15 = load %struct.NodeStruct*, %struct.NodeStruct** %innerNode23, align 8
  call void @Node_addInteriorNode(%struct.NodeStruct* %14, %struct.NodeStruct* %15)
  %16 = load %struct.GraphStruct*, %struct.GraphStruct** %graph, align 8
  call void @graphPrettyPrint(%struct.GraphStruct* %16)
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  %17 = load i1, i1* %retval, align 1
  ret i1 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printStack(%struct.NodePtrVecStruct* %stack) #0 {
entry:
  %stack.addr = alloca %struct.NodePtrVecStruct*, align 8
  %i = alloca i32, align 4
  store %struct.NodePtrVecStruct* %stack, %struct.NodePtrVecStruct** %stack.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %2, i32 0, i32 0
  %3 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 2
  %5 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %5, i64 %idxprom
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %7, i32 0, i32 0
  %8 = load i32, i32* %id, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4.106, i64 0, i64 0), i32 %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call1 = call i32 @fflush(%struct._IO_FILE* %9)
  %10 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %vector2 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %10, i32 0, i32 2
  %11 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector2, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %11, i64 %idxprom3
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx4, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %13, i32 0, i32 2
  %14 = load i8*, i8** %label, align 8
  %tobool5 = icmp ne i8* %14, null
  br i1 %tobool5, label %if.then6, label %if.end13

if.then6:                                         ; preds = %for.body
  %15 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %vector7 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %15, i32 0, i32 2
  %16 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector7, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %17 to i64
  %arrayidx9 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %16, i64 %idxprom8
  %18 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx9, align 8
  %label10 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %18, i32 0, i32 2
  %19 = load i8*, i8** %label10, align 8
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15.117, i64 0, i64 0), i8* %19)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call12 = call i32 @fflush(%struct._IO_FILE* %20)
  br label %if.end13

if.end13:                                         ; preds = %if.then6, %for.body
  %21 = load i32, i32* %i, align 4
  %22 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %stack.addr, align 8
  %contentSize14 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %22, i32 0, i32 0
  %23 = load i32, i32* %contentSize14, align 8
  %sub = sub nsw i32 %23, 1
  %cmp15 = icmp ne i32 %21, %sub
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16.118, i64 0, i64 0))
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call18 = call i32 @fflush(%struct._IO_FILE* %24)
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end13
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.105, i64 0, i64 0))
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call21 = call i32 @fflush(%struct._IO_FILE* %26)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @testStack() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @searchDiagramPrettyPrint(%struct.EdgeReferencesStruct* %diagram) #0 {
entry:
  %diagram.addr = alloca %struct.EdgeReferencesStruct*, align 8
  store %struct.EdgeReferencesStruct* %diagram, %struct.EdgeReferencesStruct** %diagram.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.IntVectorStruct* @IntVector_new(i32 %size) #0 {
entry:
  %retval = alloca %struct.IntVectorStruct*, align 8
  %size.addr = alloca i32, align 4
  %new = alloca %struct.IntVectorStruct*, align 8
  %vector = alloca i32*, align 8
  store i32 %size, i32* %size.addr, align 4
  %call = call noalias i8* @malloc(i64 16) #7
  %0 = bitcast i8* %call to %struct.IntVectorStruct*
  store %struct.IntVectorStruct* %0, %struct.IntVectorStruct** %new, align 8
  %1 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  %tobool = icmp ne %struct.IntVectorStruct* %1, null
  br i1 %tobool, label %if.then, label %if.else6

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %size.addr, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 4
  %call1 = call noalias i8* @malloc(i64 %mul) #7
  %3 = bitcast i8* %call1 to i32*
  store i32* %3, i32** %vector, align 8
  %4 = load i32*, i32** %vector, align 8
  %tobool2 = icmp ne i32* %4, null
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %5 = load i32*, i32** %vector, align 8
  %6 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  %vector4 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %6, i32 0, i32 2
  store i32* %5, i32** %vector4, align 8
  %7 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  %size5 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %7, i32 0, i32 0
  store i32 0, i32* %size5, align 8
  %8 = load i32, i32* %size.addr, align 4
  %9 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  %allocatedSize = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %9, i32 0, i32 1
  store i32 %8, i32* %allocatedSize, align 4
  %10 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  store %struct.IntVectorStruct* %10, %struct.IntVectorStruct** %retval, align 8
  br label %return

if.else:                                          ; preds = %if.then
  %11 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %new, align 8
  %12 = bitcast %struct.IntVectorStruct* %11 to i8*
  call void @free(i8* %12) #7
  store %struct.IntVectorStruct* null, %struct.IntVectorStruct** %retval, align 8
  br label %return

if.else6:                                         ; preds = %entry
  store %struct.IntVectorStruct* null, %struct.IntVectorStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.else6, %if.else, %if.then3
  %13 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %retval, align 8
  ret %struct.IntVectorStruct* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @IntVector_delete(%struct.IntVectorStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.IntVectorStruct*, align 8
  store %struct.IntVectorStruct* %trash, %struct.IntVectorStruct** %trash.addr, align 8
  %0 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.IntVectorStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %trash.addr, align 8
  %vector = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %1, i32 0, i32 2
  %2 = load i32*, i32** %vector, align 8
  %tobool1 = icmp ne i32* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %trash.addr, align 8
  %vector3 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %3, i32 0, i32 2
  %4 = load i32*, i32** %vector3, align 8
  %5 = bitcast i32* %4 to i8*
  call void @free(i8* %5) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %trash.addr, align 8
  %7 = bitcast %struct.IntVectorStruct* %6 to i8*
  call void @free(i8* %7) #7
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @IntVector_insertEnd(%struct.IntVectorStruct* %vector, i32 %datum) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.IntVectorStruct*, align 8
  %datum.addr = alloca i32, align 4
  %current = alloca i32, align 4
  %max = alloca i32, align 4
  store %struct.IntVectorStruct* %vector, %struct.IntVectorStruct** %vector.addr, align 8
  store i32 %datum, i32* %datum.addr, align 4
  store i32 0, i32* %current, align 4
  store i32 0, i32* %max, align 4
  %0 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.IntVectorStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %size = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %size, align 8
  store i32 %2, i32* %current, align 4
  %3 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %3, i32 0, i32 1
  %4 = load i32, i32* %allocatedSize, align 4
  store i32 %4, i32* %max, align 4
  %5 = load i32, i32* %current, align 4
  %6 = load i32, i32* %max, align 4
  %cmp = icmp eq i32 %5, %6
  br i1 %cmp, label %if.then1, label %if.end13

if.then1:                                         ; preds = %if.end
  %7 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %vector2 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %7, i32 0, i32 2
  %8 = load i32*, i32** %vector2, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32, i32* %max, align 4
  %mul = mul nsw i32 2, %10
  %conv = sext i32 %mul to i64
  %mul3 = mul i64 %conv, 4
  %call = call i8* @realloc(i8* %9, i64 %mul3) #7
  %11 = bitcast i8* %call to i32*
  %12 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %vector4 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %12, i32 0, i32 2
  store i32* %11, i32** %vector4, align 8
  %13 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %vector5 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %13, i32 0, i32 2
  %14 = load i32*, i32** %vector5, align 8
  %tobool6 = icmp ne i32* %14, null
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then1
  %15 = load i32, i32* %max, align 4
  %mul8 = mul nsw i32 2, %15
  %16 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %allocatedSize9 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %16, i32 0, i32 1
  store i32 %mul8, i32* %allocatedSize9, align 4
  br label %if.end12

if.else:                                          ; preds = %if.then1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = load i32, i32* %current, align 4
  %mul10 = mul nsw i32 %18, 2
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.125, i64 0, i64 0), i32 %mul10)
  store i1 false, i1* %retval, align 1
  br label %return

if.end12:                                         ; preds = %if.then7
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  %19 = load i32, i32* %datum.addr, align 4
  %20 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %vector14 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %20, i32 0, i32 2
  %21 = load i32*, i32** %vector14, align 8
  %22 = load i32, i32* %current, align 4
  %idxprom = sext i32 %22 to i64
  %arrayidx = getelementptr inbounds i32, i32* %21, i64 %idxprom
  store i32 %19, i32* %arrayidx, align 4
  %23 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %size15 = getelementptr inbounds %struct.IntVectorStruct, %struct.IntVectorStruct* %23, i32 0, i32 0
  %24 = load i32, i32* %size15, align 8
  %add = add nsw i32 %24, 1
  store i32 %add, i32* %size15, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end13, %if.else, %if.then
  %25 = load i1, i1* %retval, align 1
  ret i1 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @IntVector_createFromString(%struct.IntVectorStruct* %vector, i8* %inputString) #0 {
entry:
  %retval = alloca i32, align 4
  %vector.addr = alloca %struct.IntVectorStruct*, align 8
  %inputString.addr = alloca i8*, align 8
  %dataCount = alloca i32, align 4
  %datum = alloca i32, align 4
  store %struct.IntVectorStruct* %vector, %struct.IntVectorStruct** %vector.addr, align 8
  store i8* %inputString, i8** %inputString.addr, align 8
  store i32 0, i32* %dataCount, align 4
  %0 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.IntVectorStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %inputString.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call = call i16** @__ctype_b_loc() #10
  %2 = load i16*, i16** %call, align 8
  %3 = load i8*, i8** %inputString.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx2 = getelementptr inbounds i16, i16* %2, i64 %idxprom
  %5 = load i16, i16* %arrayidx2, align 2
  %conv3 = zext i16 %5 to i32
  %and = and i32 %conv3, 2048
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.end7, label %if.then5

if.then5:                                         ; preds = %if.end
  %6 = load i8*, i8** %inputString.addr, align 8
  %call6 = call i8* @findNextNumber(i8* %6)
  store i8* %call6, i8** %inputString.addr, align 8
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end13, %if.end7
  %7 = load i8*, i8** %inputString.addr, align 8
  %tobool8 = icmp ne i8* %7, null
  br i1 %tobool8, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i8*, i8** %inputString.addr, align 8
  %call9 = call i32 @atoi(i8* %8) #9
  store i32 %call9, i32* %datum, align 4
  %9 = load i8*, i8** %inputString.addr, align 8
  %call10 = call i8* @findNextNumber(i8* %9)
  store i8* %call10, i8** %inputString.addr, align 8
  %10 = load %struct.IntVectorStruct*, %struct.IntVectorStruct** %vector.addr, align 8
  %11 = load i32, i32* %datum, align 4
  %call11 = call zeroext i1 @IntVector_insertEnd(%struct.IntVectorStruct* %10, i32 %11)
  br i1 %call11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %while.body
  %12 = load i32, i32* %dataCount, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %dataCount, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* %dataCount, align 4
  store i32 %13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then12, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @findNextNumber(i8* %input) #0 {
entry:
  %retval = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  store i8* %input, i8** %input.addr, align 8
  %call = call i16** @__ctype_b_loc() #10
  %0 = load i16*, i16** %call, align 8
  %1 = load i8*, i8** %input.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx1 = getelementptr inbounds i16, i16* %0, i64 %idxprom
  %3 = load i16, i16* %arrayidx1, align 2
  %conv2 = zext i16 %3 to i32
  %and = and i32 %conv2, 2048
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else42

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %input.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %input.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %call3 = call i16** @__ctype_b_loc() #10
  %5 = load i16*, i16** %call3, align 8
  %6 = load i8*, i8** %input.addr, align 8
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 0
  %7 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %7 to i32
  %idxprom6 = sext i32 %conv5 to i64
  %arrayidx7 = getelementptr inbounds i16, i16* %5, i64 %idxprom6
  %8 = load i16, i16* %arrayidx7, align 2
  %conv8 = zext i16 %8 to i32
  %and9 = and i32 %conv8, 2048
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %9 = load i8*, i8** %input.addr, align 8
  %10 = load i8, i8* %9, align 1
  %conv11 = sext i8 %10 to i32
  %cmp = icmp ne i32 %conv11, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %11 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %11, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %12 = load i8*, i8** %input.addr, align 8
  %incdec.ptr13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr13, i8** %input.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %13 = load i8*, i8** %input.addr, align 8
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i64 0
  %14 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %14 to i32
  %cmp16 = icmp eq i32 %conv15, 0
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %while.end
  store i8* null, i8** %retval, align 8
  br label %return

if.else:                                          ; preds = %while.end
  br label %while.cond19

while.cond19:                                     ; preds = %while.body33, %if.else
  %call20 = call i16** @__ctype_b_loc() #10
  %15 = load i16*, i16** %call20, align 8
  %16 = load i8*, i8** %input.addr, align 8
  %arrayidx21 = getelementptr inbounds i8, i8* %16, i64 0
  %17 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %17 to i32
  %idxprom23 = sext i32 %conv22 to i64
  %arrayidx24 = getelementptr inbounds i16, i16* %15, i64 %idxprom23
  %18 = load i16, i16* %arrayidx24, align 2
  %conv25 = zext i16 %18 to i32
  %and26 = and i32 %conv25, 2048
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %land.end32, label %land.rhs28

land.rhs28:                                       ; preds = %while.cond19
  %19 = load i8*, i8** %input.addr, align 8
  %20 = load i8, i8* %19, align 1
  %conv29 = sext i8 %20 to i32
  %cmp30 = icmp ne i32 %conv29, 0
  br label %land.end32

land.end32:                                       ; preds = %land.rhs28, %while.cond19
  %21 = phi i1 [ false, %while.cond19 ], [ %cmp30, %land.rhs28 ]
  br i1 %21, label %while.body33, label %while.end35

while.body33:                                     ; preds = %land.end32
  %22 = load i8*, i8** %input.addr, align 8
  %incdec.ptr34 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr34, i8** %input.addr, align 8
  br label %while.cond19

while.end35:                                      ; preds = %land.end32
  br label %if.end

if.end:                                           ; preds = %while.end35
  %23 = load i8*, i8** %input.addr, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %23, i64 0
  %24 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %24 to i32
  %cmp38 = icmp eq i32 %conv37, 0
  br i1 %cmp38, label %if.then40, label %if.else41

if.then40:                                        ; preds = %if.end
  store i8* null, i8** %retval, align 8
  br label %return

if.else41:                                        ; preds = %if.end
  %25 = load i8*, i8** %input.addr, align 8
  store i8* %25, i8** %retval, align 8
  br label %return

if.else42:                                        ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.else42
  %26 = load i8*, i8** %input.addr, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %26, i64 0
  %27 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %27 to i32
  %cmp45 = icmp eq i32 %conv44, 0
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %do.body
  store i8* null, i8** %retval, align 8
  br label %return

if.end48:                                         ; preds = %do.body
  %28 = load i8*, i8** %input.addr, align 8
  %incdec.ptr49 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr49, i8** %input.addr, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end48
  %call50 = call i16** @__ctype_b_loc() #10
  %29 = load i16*, i16** %call50, align 8
  %30 = load i8*, i8** %input.addr, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %30, i64 0
  %31 = load i8, i8* %arrayidx51, align 1
  %conv52 = sext i8 %31 to i32
  %idxprom53 = sext i32 %conv52 to i64
  %arrayidx54 = getelementptr inbounds i16, i16* %29, i64 %idxprom53
  %32 = load i16, i16* %arrayidx54, align 2
  %conv55 = zext i16 %32 to i32
  %and56 = and i32 %conv55, 2048
  %tobool57 = icmp ne i32 %and56, 0
  %lnot = xor i1 %tobool57, true
  br i1 %lnot, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %33 = load i8*, i8** %input.addr, align 8
  store i8* %33, i8** %retval, align 8
  br label %return

return:                                           ; preds = %do.end, %if.then47, %if.else41, %if.then40, %if.then18
  %34 = load i8*, i8** %retval, align 8
  ret i8* %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.CharVectorStruct* @CharVector_new(i32 %size) #0 {
entry:
  %retval = alloca %struct.CharVectorStruct*, align 8
  %size.addr = alloca i32, align 4
  %new = alloca %struct.CharVectorStruct*, align 8
  %string = alloca i8*, align 8
  store i32 %size, i32* %size.addr, align 4
  %call = call noalias i8* @malloc(i64 16) #7
  %0 = bitcast i8* %call to %struct.CharVectorStruct*
  store %struct.CharVectorStruct* %0, %struct.CharVectorStruct** %new, align 8
  %1 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  %tobool = icmp ne %struct.CharVectorStruct* %1, null
  br i1 %tobool, label %if.then, label %if.else6

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %size.addr, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 1
  %call1 = call noalias i8* @malloc(i64 %mul) #7
  store i8* %call1, i8** %string, align 8
  %3 = load i8*, i8** %string, align 8
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** %string, align 8
  %5 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  %string4 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %5, i32 0, i32 2
  store i8* %4, i8** %string4, align 8
  %6 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  %size5 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %6, i32 0, i32 0
  store i32 0, i32* %size5, align 8
  %7 = load i32, i32* %size.addr, align 4
  %8 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  %allocatedSize = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %8, i32 0, i32 1
  store i32 %7, i32* %allocatedSize, align 4
  %9 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  store %struct.CharVectorStruct* %9, %struct.CharVectorStruct** %retval, align 8
  br label %return

if.else:                                          ; preds = %if.then
  %10 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %new, align 8
  %11 = bitcast %struct.CharVectorStruct* %10 to i8*
  call void @free(i8* %11) #7
  store %struct.CharVectorStruct* null, %struct.CharVectorStruct** %retval, align 8
  br label %return

if.else6:                                         ; preds = %entry
  store %struct.CharVectorStruct* null, %struct.CharVectorStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.else6, %if.else, %if.then3
  %12 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %retval, align 8
  ret %struct.CharVectorStruct* %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CharVector_delete(%struct.CharVectorStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.CharVectorStruct*, align 8
  store %struct.CharVectorStruct* %trash, %struct.CharVectorStruct** %trash.addr, align 8
  %0 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.CharVectorStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %trash.addr, align 8
  %string = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %1, i32 0, i32 2
  %2 = load i8*, i8** %string, align 8
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %trash.addr, align 8
  %string3 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %3, i32 0, i32 2
  %4 = load i8*, i8** %string3, align 8
  call void @free(i8* %4) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %trash.addr, align 8
  %6 = bitcast %struct.CharVectorStruct* %5 to i8*
  call void @free(i8* %6) #7
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @CharVector_insertEnd(%struct.CharVectorStruct* %vector, i8 signext %c) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.CharVectorStruct*, align 8
  %c.addr = alloca i8, align 1
  %size = alloca i32, align 4
  %max = alloca i32, align 4
  store %struct.CharVectorStruct* %vector, %struct.CharVectorStruct** %vector.addr, align 8
  store i8 %c, i8* %c.addr, align 1
  store i32 0, i32* %size, align 4
  store i32 0, i32* %max, align 4
  %0 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.CharVectorStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %size1 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %size1, align 8
  store i32 %2, i32* %size, align 4
  %3 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %3, i32 0, i32 1
  %4 = load i32, i32* %allocatedSize, align 4
  store i32 %4, i32* %max, align 4
  %5 = load i32, i32* %size, align 4
  %6 = load i32, i32* %max, align 4
  %cmp = icmp eq i32 %5, %6
  br i1 %cmp, label %if.then2, label %if.end13

if.then2:                                         ; preds = %if.end
  %7 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %string = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %7, i32 0, i32 2
  %8 = load i8*, i8** %string, align 8
  %9 = load i32, i32* %size, align 4
  %mul = mul nsw i32 2, %9
  %conv = sext i32 %mul to i64
  %mul3 = mul i64 %conv, 1
  %call = call i8* @realloc(i8* %8, i64 %mul3) #7
  %10 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %string4 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %10, i32 0, i32 2
  store i8* %call, i8** %string4, align 8
  %11 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %string5 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %11, i32 0, i32 2
  %12 = load i8*, i8** %string5, align 8
  %tobool6 = icmp ne i8* %12, null
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then2
  %13 = load i32, i32* %size, align 4
  %mul8 = mul nsw i32 %13, 2
  %14 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %allocatedSize9 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %14, i32 0, i32 1
  store i32 %mul8, i32* %allocatedSize9, align 4
  br label %if.end12

if.else:                                          ; preds = %if.then2
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load i32, i32* %size, align 4
  %mul10 = mul nsw i32 %16, 2
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.125, i64 0, i64 0), i32 %mul10)
  store i1 false, i1* %retval, align 1
  br label %return

if.end12:                                         ; preds = %if.then7
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  %17 = load i8, i8* %c.addr, align 1
  %18 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %string14 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %18, i32 0, i32 2
  %19 = load i8*, i8** %string14, align 8
  %20 = load i32, i32* %size, align 4
  %idxprom = sext i32 %20 to i64
  %arrayidx = getelementptr inbounds i8, i8* %19, i64 %idxprom
  store i8 %17, i8* %arrayidx, align 1
  %21 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %size15 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %21, i32 0, i32 0
  %22 = load i32, i32* %size15, align 8
  %add = add nsw i32 %22, 1
  store i32 %add, i32* %size15, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end13, %if.else, %if.then
  %23 = load i1, i1* %retval, align 1
  ret i1 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CharVector_getLineFromFile(%struct.CharVectorStruct* %vector, %struct._IO_FILE* %input) #0 {
entry:
  %retval = alloca i32, align 4
  %vector.addr = alloca %struct.CharVectorStruct*, align 8
  %input.addr = alloca %struct._IO_FILE*, align 8
  %notDoneYet = alloca i8, align 1
  %c = alloca i8, align 1
  store %struct.CharVectorStruct* %vector, %struct.CharVectorStruct** %vector.addr, align 8
  store %struct._IO_FILE* %input, %struct._IO_FILE** %input.addr, align 8
  store i8 1, i8* %notDoneYet, align 1
  store i8 0, i8* %c, align 1
  %0 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.CharVectorStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %input.addr, align 8
  %tobool1 = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %size = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %2, i32 0, i32 0
  store i32 0, i32* %size, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %input.addr, align 8
  %call = call i32 @fgetc(%struct._IO_FILE* %3)
  %conv = trunc i32 %call to i8
  store i8 %conv, i8* %c, align 1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %input.addr, align 8
  %call2 = call i32 @feof(%struct._IO_FILE* %4) #7
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.then7, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %do.body
  %5 = load i8, i8* %c, align 1
  %conv5 = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv5, 10
  br i1 %cmp, label %if.then7, label %if.else

if.then7:                                         ; preds = %lor.lhs.false4, %do.body
  store i8 0, i8* %notDoneYet, align 1
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false4
  %6 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %7 = load i8, i8* %c, align 1
  %call8 = call zeroext i1 @CharVector_insertEnd(%struct.CharVectorStruct* %6, i8 signext %7)
  br i1 %call8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then7
  br label %do.cond

do.cond:                                          ; preds = %if.end11
  %8 = load i8, i8* %notDoneYet, align 1
  %tobool12 = trunc i8 %8 to i1
  br i1 %tobool12, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %9 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %call13 = call zeroext i1 @CharVector_insertEnd(%struct.CharVectorStruct* %9, i8 signext 0)
  br i1 %call13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %do.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %do.end
  %10 = load %struct.CharVectorStruct*, %struct.CharVectorStruct** %vector.addr, align 8
  %size16 = getelementptr inbounds %struct.CharVectorStruct, %struct.CharVectorStruct* %10, i32 0, i32 0
  %11 = load i32, i32* %size16, align 8
  store i32 %11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then14, %if.then9, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare dso_local i32 @fgetc(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodePtrVecStruct* @NodePtrVec_new(i32 %initialSize) #0 {
entry:
  %retval = alloca %struct.NodePtrVecStruct*, align 8
  %initialSize.addr = alloca i32, align 4
  %newVector = alloca %struct.NodePtrVecStruct*, align 8
  %vector = alloca %struct.NodeStruct**, align 8
  store i32 %initialSize, i32* %initialSize.addr, align 4
  %0 = load i32, i32* %initialSize.addr, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 8
  %call = call noalias i8* @malloc(i64 %mul) #7
  %1 = bitcast i8* %call to %struct.NodeStruct**
  store %struct.NodeStruct** %1, %struct.NodeStruct*** %vector, align 8
  %2 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %tobool = icmp ne %struct.NodeStruct** %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.1.136, i64 0, i64 0))
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call noalias i8* @malloc(i64 16) #7
  %3 = bitcast i8* %call2 to %struct.NodePtrVecStruct*
  store %struct.NodePtrVecStruct* %3, %struct.NodePtrVecStruct** %newVector, align 8
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %newVector, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %4, null
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.end
  %5 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %6 = bitcast %struct.NodeStruct** %5 to i8*
  call void @free(i8* %6) #7
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.2.137, i64 0, i64 0))
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end6:                                          ; preds = %if.end
  %7 = load i32, i32* %initialSize.addr, align 4
  %8 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %newVector, align 8
  %allocatedSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %8, i32 0, i32 1
  store i32 %7, i32* %allocatedSize, align 4
  %9 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %newVector, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %9, i32 0, i32 0
  store i32 0, i32* %contentSize, align 8
  %10 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %11 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %newVector, align 8
  %vector7 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %11, i32 0, i32 2
  store %struct.NodeStruct** %10, %struct.NodeStruct*** %vector7, align 8
  %12 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %newVector, align 8
  store %struct.NodePtrVecStruct* %12, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end6, %if.then4, %if.then
  %13 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %retval, align 8
  ret %struct.NodePtrVecStruct* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @NodePtrVec_delete(%struct.NodePtrVecStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.NodePtrVecStruct* %trash, %struct.NodePtrVecStruct** %trash.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %trash.addr, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %1, i32 0, i32 2
  %2 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %tobool1 = icmp ne %struct.NodeStruct** %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %trash.addr, align 8
  %vector3 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %3, i32 0, i32 2
  %4 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector3, align 8
  %5 = bitcast %struct.NodeStruct** %4 to i8*
  call void @free(i8* %5) #7
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %trash.addr, align 8
  %7 = bitcast %struct.NodePtrVecStruct* %6 to i8*
  call void @free(i8* %7) #7
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodePtrVecStruct* @NodePtrVec_copy(%struct.NodePtrVecStruct* %from, i1 zeroext %exact_copy) #0 {
entry:
  %retval = alloca %struct.NodePtrVecStruct*, align 8
  %from.addr = alloca %struct.NodePtrVecStruct*, align 8
  %exact_copy.addr = alloca i8, align 1
  %i = alloca i32, align 4
  %to = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.NodePtrVecStruct* %from, %struct.NodePtrVecStruct** %from.addr, align 8
  %frombool = zext i1 %exact_copy to i8
  store i8 %frombool, i8* %exact_copy.addr, align 1
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8, i8* %exact_copy.addr, align 1
  %tobool1 = trunc i8 %1 to i1
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %2, i32 0, i32 1
  %3 = load i32, i32* %allocatedSize, align 4
  %call = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 %3)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  %call2 = call %struct.NodePtrVecStruct* @NodePtrVec_new(i32 %5)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.NodePtrVecStruct* [ %call, %cond.true ], [ %call2, %cond.false ]
  store %struct.NodePtrVecStruct* %cond, %struct.NodePtrVecStruct** %to, align 8
  %6 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %to, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %6, null
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %cond.end
  store %struct.NodePtrVecStruct* null, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

if.end5:                                          ; preds = %cond.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %contentSize6 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %8, i32 0, i32 0
  %9 = load i32, i32* %contentSize6, align 8
  %cmp = icmp slt i32 %7, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %10, i32 0, i32 2
  %11 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %11, i64 %idxprom
  %13 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %14 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %to, align 8
  %vector7 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %14, i32 0, i32 2
  %15 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector7, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %15, i64 %idxprom8
  store %struct.NodeStruct* %13, %struct.NodeStruct** %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %from.addr, align 8
  %contentSize10 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %18, i32 0, i32 0
  %19 = load i32, i32* %contentSize10, align 8
  %20 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %to, align 8
  %contentSize11 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %20, i32 0, i32 0
  store i32 %19, i32* %contentSize11, align 8
  %21 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %to, align 8
  store %struct.NodePtrVecStruct* %21, %struct.NodePtrVecStruct** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  %22 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %retval, align 8
  ret %struct.NodePtrVecStruct* %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %vector, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.NodePtrVecStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %current = alloca i32, align 4
  %max = alloca i32, align 4
  store %struct.NodePtrVecStruct* %vector, %struct.NodePtrVecStruct** %vector.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %contentSize, align 8
  store i32 %2, i32* %current, align 4
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %3, i32 0, i32 1
  %4 = load i32, i32* %allocatedSize, align 4
  store i32 %4, i32* %max, align 4
  %5 = load i32, i32* %current, align 4
  %6 = load i32, i32* %max, align 4
  %cmp = icmp eq i32 %5, %6
  br i1 %cmp, label %if.then1, label %if.end20

if.then1:                                         ; preds = %if.end
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector2 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %7, i32 0, i32 2
  %8 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector2, align 8
  %9 = bitcast %struct.NodeStruct** %8 to i8*
  %10 = load i32, i32* %max, align 4
  %mul = mul nsw i32 2, %10
  %conv = sext i32 %mul to i64
  %mul3 = mul i64 %conv, 8
  %call = call i8* @realloc(i8* %9, i64 %mul3) #7
  %11 = bitcast i8* %call to %struct.NodeStruct**
  %12 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector4 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %12, i32 0, i32 2
  store %struct.NodeStruct** %11, %struct.NodeStruct*** %vector4, align 8
  %13 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector5 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %13, i32 0, i32 2
  %14 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector5, align 8
  %tobool6 = icmp ne %struct.NodeStruct** %14, null
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then1
  %15 = load i32, i32* %max, align 4
  %mul8 = mul nsw i32 2, %15
  %16 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %allocatedSize9 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %16, i32 0, i32 1
  store i32 %mul8, i32* %allocatedSize9, align 4
  br label %if.end19

if.else:                                          ; preds = %if.then1
  %17 = load i32, i32* %max, align 4
  %mul10 = mul nsw i32 2, %17
  %18 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %id = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %18, i32 0, i32 0
  %19 = load i32, i32* %id, align 8
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3.142, i64 0, i64 0), i32 %mul10, i32 %19)
  %20 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %label = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %20, i32 0, i32 2
  %21 = load i8*, i8** %label, align 8
  %tobool12 = icmp ne i8* %21, null
  br i1 %tobool12, label %if.then13, label %if.else16

if.then13:                                        ; preds = %if.else
  %22 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %label14 = getelementptr inbounds %struct.NodeStruct, %struct.NodeStruct* %22, i32 0, i32 2
  %23 = load i8*, i8** %label14, align 8
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4.143, i64 0, i64 0), i8* %23)
  br label %if.end18

if.else16:                                        ; preds = %if.else
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5.144, i64 0, i64 0))
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then13
  store i1 false, i1* %retval, align 1
  br label %return

if.end19:                                         ; preds = %if.then7
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.end
  %24 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %25 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector21 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %25, i32 0, i32 2
  %26 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector21, align 8
  %27 = load i32, i32* %current, align 4
  %idxprom = sext i32 %27 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %26, i64 %idxprom
  store %struct.NodeStruct* %24, %struct.NodeStruct** %arrayidx, align 8
  %28 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize22 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %28, i32 0, i32 0
  %29 = load i32, i32* %contentSize22, align 8
  %add = add nsw i32 %29, 1
  store i32 %add, i32* %contentSize22, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end20, %if.end18, %if.then
  %30 = load i1, i1* %retval, align 1
  ret i1 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeStruct* @NodePtrVec_pop(%struct.NodePtrVecStruct* %vector) #0 {
entry:
  %retval = alloca %struct.NodeStruct*, align 8
  %vector.addr = alloca %struct.NodePtrVecStruct*, align 8
  %top = alloca %struct.NodeStruct*, align 8
  store %struct.NodePtrVecStruct* %vector, %struct.NodePtrVecStruct** %vector.addr, align 8
  store %struct.NodeStruct* null, %struct.NodeStruct** %top, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.NodeStruct* null, %struct.NodeStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %1, i32 0, i32 0
  %2 = load i32, i32* %contentSize, align 8
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %if.then1, label %if.end5

if.then1:                                         ; preds = %if.end
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize2 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %3, i32 0, i32 0
  %4 = load i32, i32* %contentSize2, align 8
  %sub = sub nsw i32 %4, 1
  store i32 %sub, i32* %contentSize2, align 8
  %5 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector3 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %5, i32 0, i32 2
  %6 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector3, align 8
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize4 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %7, i32 0, i32 0
  %8 = load i32, i32* %contentSize4, align 8
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %6, i64 %idxprom
  %9 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  store %struct.NodeStruct* %9, %struct.NodeStruct** %top, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then1, %if.end
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %top, align 8
  store %struct.NodeStruct* %10, %struct.NodeStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %retval, align 8
  ret %struct.NodeStruct* %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodePtrVec_find(%struct.NodePtrVecStruct* %vector, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.NodePtrVecStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %i = alloca i32, align 4
  store %struct.NodePtrVecStruct* %vector, %struct.NodePtrVecStruct** %vector.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %2, i32 0, i32 0
  %3 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector1 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 2
  %5 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector1, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %5, i64 %idxprom
  %7 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %8 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %cmp2 = icmp eq %struct.NodeStruct* %7, %8
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.body
  store i1 true, i1* %retval, align 1
  br label %return

if.end4:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end4
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end, %if.then3, %if.then
  %10 = load i1, i1* %retval, align 1
  ret i1 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodePtrVec_findReverse(%struct.NodePtrVecStruct* %vector, %struct.NodeStruct* %node) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.NodePtrVecStruct*, align 8
  %node.addr = alloca %struct.NodeStruct*, align 8
  %i = alloca i32, align 4
  store %struct.NodePtrVecStruct* %vector, %struct.NodePtrVecStruct** %vector.addr, align 8
  store %struct.NodeStruct* %node, %struct.NodeStruct** %node.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector1 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %1, i32 0, i32 2
  %2 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector1, align 8
  %tobool2 = icmp ne %struct.NodeStruct** %2, null
  br i1 %tobool2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %tobool4 = icmp ne %struct.NodeStruct* %3, null
  br i1 %tobool4, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false3
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  %sub = sub nsw i32 %5, 1
  store i32 %sub, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %6, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %vector.addr, align 8
  %vector5 = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %7, i32 0, i32 2
  %8 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector5, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %8, i64 %idxprom
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %11 = load %struct.NodeStruct*, %struct.NodeStruct** %node.addr, align 8
  %cmp6 = icmp eq %struct.NodeStruct* %10, %11
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.body
  store i1 true, i1* %retval, align 1
  br label %return

if.end8:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %12 = load i32, i32* %i, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %for.end, %if.then7, %if.then
  %13 = load i1, i1* %retval, align 1
  ret i1 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @NodePtrVec_appendVectors(%struct.NodePtrVecStruct* %first, %struct.NodePtrVecStruct* %second, i1 zeroext %keepFirst) #0 {
entry:
  %first.addr = alloca %struct.NodePtrVecStruct*, align 8
  %second.addr = alloca %struct.NodePtrVecStruct*, align 8
  %keepFirst.addr = alloca i8, align 1
  %i = alloca i32, align 4
  store %struct.NodePtrVecStruct* %first, %struct.NodePtrVecStruct** %first.addr, align 8
  store %struct.NodePtrVecStruct* %second, %struct.NodePtrVecStruct** %second.addr, align 8
  %frombool = zext i1 %keepFirst to i8
  store i8 %frombool, i8* %keepFirst.addr, align 1
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %first.addr, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %second.addr, align 8
  %tobool1 = icmp ne %struct.NodePtrVecStruct* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8, i8* %keepFirst.addr, align 1
  %tobool2 = trunc i8 %2 to i1
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %if.end4

if.else:                                          ; preds = %if.end
  store i32 1, i32* %i, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %second.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %3, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %first.addr, align 8
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %second.addr, align 8
  %vector = getelementptr inbounds %struct.NodePtrVecStruct, %struct.NodePtrVecStruct* %7, i32 0, i32 2
  %8 = load %struct.NodeStruct**, %struct.NodeStruct*** %vector, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds %struct.NodeStruct*, %struct.NodeStruct** %8, i64 %idxprom
  %10 = load %struct.NodeStruct*, %struct.NodeStruct** %arrayidx, align 8
  %call = call zeroext i1 @NodePtrVec_push(%struct.NodePtrVecStruct* %6, %struct.NodeStruct* %10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.NodeVecVecStruct* @NodeVecVec_new(i32 %initialSize) #0 {
entry:
  %retval = alloca %struct.NodeVecVecStruct*, align 8
  %initialSize.addr = alloca i32, align 4
  %newVector = alloca %struct.NodeVecVecStruct*, align 8
  %vector = alloca %struct.NodePtrVecStruct**, align 8
  store i32 %initialSize, i32* %initialSize.addr, align 4
  %0 = load i32, i32* %initialSize.addr, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 8
  %call = call noalias i8* @malloc(i64 %mul) #7
  %1 = bitcast i8* %call to %struct.NodePtrVecStruct**
  store %struct.NodePtrVecStruct** %1, %struct.NodePtrVecStruct*** %vector, align 8
  %2 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector, align 8
  %tobool = icmp ne %struct.NodePtrVecStruct** %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.6.151, i64 0, i64 0))
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call2 = call i32 @fflush(%struct._IO_FILE* %3)
  store %struct.NodeVecVecStruct* null, %struct.NodeVecVecStruct** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %call3 = call noalias i8* @malloc(i64 16) #7
  %4 = bitcast i8* %call3 to %struct.NodeVecVecStruct*
  store %struct.NodeVecVecStruct* %4, %struct.NodeVecVecStruct** %newVector, align 8
  %5 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %newVector, align 8
  %tobool4 = icmp ne %struct.NodeVecVecStruct* %5, null
  br i1 %tobool4, label %if.end8, label %if.then5

if.then5:                                         ; preds = %if.end
  %6 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector, align 8
  %7 = bitcast %struct.NodePtrVecStruct** %6 to i8*
  call void @free(i8* %7) #7
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.7.152, i64 0, i64 0))
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call7 = call i32 @fflush(%struct._IO_FILE* %8)
  store %struct.NodeVecVecStruct* null, %struct.NodeVecVecStruct** %retval, align 8
  br label %return

if.end8:                                          ; preds = %if.end
  %9 = load i32, i32* %initialSize.addr, align 4
  %10 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %newVector, align 8
  %allocatedSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %10, i32 0, i32 1
  store i32 %9, i32* %allocatedSize, align 4
  %11 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %newVector, align 8
  %contentSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %11, i32 0, i32 0
  store i32 0, i32* %contentSize, align 8
  %12 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector, align 8
  %13 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %newVector, align 8
  %vector9 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %13, i32 0, i32 2
  store %struct.NodePtrVecStruct** %12, %struct.NodePtrVecStruct*** %vector9, align 8
  %14 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %newVector, align 8
  store %struct.NodeVecVecStruct* %14, %struct.NodeVecVecStruct** %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.then5, %if.then
  %15 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %retval, align 8
  ret %struct.NodeVecVecStruct* %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @NodeVecVec_delete(%struct.NodeVecVecStruct* %trash) #0 {
entry:
  %trash.addr = alloca %struct.NodeVecVecStruct*, align 8
  %i = alloca i32, align 4
  store %struct.NodeVecVecStruct* %trash, %struct.NodeVecVecStruct** %trash.addr, align 8
  %0 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %tobool = icmp ne %struct.NodeVecVecStruct* %0, null
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %2, i32 0, i32 0
  %3 = load i32, i32* %contentSize, align 8
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %vector = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %4, i32 0, i32 2
  %5 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %5, i64 %idxprom
  %7 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %arrayidx, align 8
  call void @NodePtrVec_delete(%struct.NodePtrVecStruct* %7)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %vector1 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %9, i32 0, i32 2
  %10 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector1, align 8
  %tobool2 = icmp ne %struct.NodePtrVecStruct** %10, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %for.end
  %11 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %vector4 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %11, i32 0, i32 2
  %12 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector4, align 8
  %13 = bitcast %struct.NodePtrVecStruct** %12 to i8*
  call void @free(i8* %13) #7
  br label %if.end

if.end:                                           ; preds = %if.then3, %for.end
  %14 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %trash.addr, align 8
  %15 = bitcast %struct.NodeVecVecStruct* %14 to i8*
  call void @free(i8* %15) #7
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @NodeVecVec_insert(%struct.NodeVecVecStruct* %vector, %struct.NodePtrVecStruct* %path) #0 {
entry:
  %retval = alloca i1, align 1
  %vector.addr = alloca %struct.NodeVecVecStruct*, align 8
  %path.addr = alloca %struct.NodePtrVecStruct*, align 8
  %current = alloca i32, align 4
  %max = alloca i32, align 4
  %copy = alloca %struct.NodePtrVecStruct*, align 8
  store %struct.NodeVecVecStruct* %vector, %struct.NodeVecVecStruct** %vector.addr, align 8
  store %struct.NodePtrVecStruct* %path, %struct.NodePtrVecStruct** %path.addr, align 8
  %0 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path.addr, align 8
  %call = call %struct.NodePtrVecStruct* @NodePtrVec_copy(%struct.NodePtrVecStruct* %0, i1 zeroext false)
  store %struct.NodePtrVecStruct* %call, %struct.NodePtrVecStruct** %copy, align 8
  %1 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %tobool = icmp ne %struct.NodeVecVecStruct* %1, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %path.addr, align 8
  %tobool1 = icmp ne %struct.NodePtrVecStruct* %2, null
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %copy, align 8
  %tobool3 = icmp ne %struct.NodePtrVecStruct* %3, null
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i1 false, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %4 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %contentSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %4, i32 0, i32 0
  %5 = load i32, i32* %contentSize, align 8
  store i32 %5, i32* %current, align 4
  %6 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %allocatedSize = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %6, i32 0, i32 1
  %7 = load i32, i32* %allocatedSize, align 4
  store i32 %7, i32* %max, align 4
  %8 = load i32, i32* %current, align 4
  %9 = load i32, i32* %max, align 4
  %cmp = icmp eq i32 %8, %9
  br i1 %cmp, label %if.then4, label %if.end17

if.then4:                                         ; preds = %if.end
  %10 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %vector5 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %10, i32 0, i32 2
  %11 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector5, align 8
  %12 = bitcast %struct.NodePtrVecStruct** %11 to i8*
  %13 = load i32, i32* %max, align 4
  %mul = mul nsw i32 2, %13
  %conv = sext i32 %mul to i64
  %mul6 = mul i64 %conv, 8
  %call7 = call i8* @realloc(i8* %12, i64 %mul6) #7
  %14 = bitcast i8* %call7 to %struct.NodePtrVecStruct**
  %15 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %vector8 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %15, i32 0, i32 2
  store %struct.NodePtrVecStruct** %14, %struct.NodePtrVecStruct*** %vector8, align 8
  %16 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %vector9 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %16, i32 0, i32 2
  %17 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector9, align 8
  %tobool10 = icmp ne %struct.NodePtrVecStruct** %17, null
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.then4
  %18 = load i32, i32* %max, align 4
  %mul12 = mul nsw i32 2, %18
  %19 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %allocatedSize13 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %19, i32 0, i32 1
  store i32 %mul12, i32* %allocatedSize13, align 4
  br label %if.end16

if.else:                                          ; preds = %if.then4
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.8.155, i64 0, i64 0))
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call15 = call i32 @fflush(%struct._IO_FILE* %20)
  store i1 false, i1* %retval, align 1
  br label %return

if.end16:                                         ; preds = %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  %21 = load %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %copy, align 8
  %22 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %vector18 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %22, i32 0, i32 2
  %23 = load %struct.NodePtrVecStruct**, %struct.NodePtrVecStruct*** %vector18, align 8
  %24 = load i32, i32* %current, align 4
  %idxprom = sext i32 %24 to i64
  %arrayidx = getelementptr inbounds %struct.NodePtrVecStruct*, %struct.NodePtrVecStruct** %23, i64 %idxprom
  store %struct.NodePtrVecStruct* %21, %struct.NodePtrVecStruct** %arrayidx, align 8
  %25 = load %struct.NodeVecVecStruct*, %struct.NodeVecVecStruct** %vector.addr, align 8
  %contentSize19 = getelementptr inbounds %struct.NodeVecVecStruct, %struct.NodeVecVecStruct* %25, i32 0, i32 0
  %26 = load i32, i32* %contentSize19, align 8
  %add = add nsw i32 %26, 1
  store i32 %add, i32* %contentSize19, align 8
  store i1 true, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end17, %if.else, %if.then
  %27 = load i1, i1* %retval, align 1
  ret i1 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLOpen() #0 {
entry:
  %rawTime = alloca i64, align 8
  %timeinfo = alloca %struct.tm*, align 8
  %fileName = alloca i8*, align 8
  %timeStr = alloca i8*, align 8
  store %struct.tm* null, %struct.tm** %timeinfo, align 8
  %call = call noalias i8* @calloc(i64 200, i64 1) #7
  store i8* %call, i8** %fileName, align 8
  %call1 = call noalias i8* @calloc(i64 200, i64 1) #7
  store i8* %call1, i8** %timeStr, align 8
  %call2 = call i64 @time(i64* %rawTime) #7
  %call3 = call %struct.tm* @localtime(i64* %rawTime) #7
  store %struct.tm* %call3, %struct.tm** %timeinfo, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %fileName, align 8
  %cmp4 = icmp eq i8* %1, null
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %2 = load i8*, i8** %timeStr, align 8
  %cmp6 = icmp eq i8* %2, null
  br i1 %cmp6, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false5
  %3 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %cmp8 = icmp eq %struct.tm* %3, null
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false5, %lor.lhs.false, %entry
  br label %if.end24

if.end:                                           ; preds = %lor.lhs.false7
  %4 = load i8*, i8** %fileName, align 8
  %5 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_year = getelementptr inbounds %struct.tm, %struct.tm* %5, i32 0, i32 5
  %6 = load i32, i32* %tm_year, align 4
  %add = add nsw i32 %6, 1900
  %7 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %7, i32 0, i32 4
  %8 = load i32, i32* %tm_mon, align 8
  %add9 = add nsw i32 %8, 1
  %9 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %9, i32 0, i32 3
  %10 = load i32, i32* %tm_mday, align 4
  %11 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %11, i32 0, i32 2
  %12 = load i32, i32* %tm_hour, align 8
  %13 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %13, i32 0, i32 1
  %14 = load i32, i32* %tm_min, align 4
  %15 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %15, i32 0, i32 0
  %16 = load i32, i32* %tm_sec, align 8
  %call10 = call i32 (i8*, i8*, ...) @sprintf(i8* %4, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.158, i64 0, i64 0), i32 %add, i32 %add9, i32 %10, i32 %12, i32 %14, i32 %16) #7
  %17 = load i8*, i8** %timeStr, align 8
  %18 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_year11 = getelementptr inbounds %struct.tm, %struct.tm* %18, i32 0, i32 5
  %19 = load i32, i32* %tm_year11, align 4
  %add12 = add nsw i32 %19, 1900
  %20 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_mon13 = getelementptr inbounds %struct.tm, %struct.tm* %20, i32 0, i32 4
  %21 = load i32, i32* %tm_mon13, align 8
  %add14 = add nsw i32 %21, 1
  %22 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_mday15 = getelementptr inbounds %struct.tm, %struct.tm* %22, i32 0, i32 3
  %23 = load i32, i32* %tm_mday15, align 4
  %24 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_hour16 = getelementptr inbounds %struct.tm, %struct.tm* %24, i32 0, i32 2
  %25 = load i32, i32* %tm_hour16, align 8
  %26 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_min17 = getelementptr inbounds %struct.tm, %struct.tm* %26, i32 0, i32 1
  %27 = load i32, i32* %tm_min17, align 4
  %28 = load %struct.tm*, %struct.tm** %timeinfo, align 8
  %tm_sec18 = getelementptr inbounds %struct.tm, %struct.tm* %28, i32 0, i32 0
  %29 = load i32, i32* %tm_sec18, align 8
  %call19 = call i32 (i8*, i8*, ...) @sprintf(i8* %17, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1.159, i64 0, i64 0), i32 %add12, i32 %add14, i32 %23, i32 %25, i32 %27, i32 %29) #7
  %30 = load i8*, i8** %fileName, align 8
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.160, i64 0, i64 0), i8* %30)
  %31 = load i8*, i8** %fileName, align 8
  %call21 = call %struct._IO_FILE* @fopen(i8* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.161, i64 0, i64 0))
  store %struct._IO_FILE* %call21, %struct._IO_FILE** @output, align 8
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp22 = icmp ne %struct._IO_FILE* %32, null
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end
  call void @YAMLWriteString(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.162, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5.163, i64 0, i64 0))
  call void @YAMLWriteString(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6.166, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7.167, i64 0, i64 0))
  %33 = load i8*, i8** %timeStr, align 8
  call void @YAMLWriteString(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8.168, i64 0, i64 0), i8* %33)
  call void @YAMLWriteString(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9.169, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10.170, i64 0, i64 0))
  call void @YAMLWriteString(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11.171, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10.170, i64 0, i64 0))
  call void @YAMLWriteString(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12.172, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13.173, i64 0, i64 0))
  call void @YAMLWriteString(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14.174, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13.173, i64 0, i64 0))
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end, %if.then
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLWriteString(i8* %tag, i8* %data) #0 {
entry:
  %tag.addr = alloca i8*, align 8
  %data.addr = alloca i8*, align 8
  store i8* %tag, i8** %tag.addr, align 8
  store i8* %data, i8** %data.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %2 = load i8*, i8** %tag.addr, align 8
  %3 = load i8*, i8** %data.addr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15.175, i64 0, i64 0), i8* %2, i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLClose() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %call = call i32 @fclose(%struct._IO_FILE* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLWriteInt(i8* %tag, i32 %data) #0 {
entry:
  %tag.addr = alloca i8*, align 8
  %data.addr = alloca i32, align 4
  store i8* %tag, i8** %tag.addr, align 8
  store i32 %data, i32* %data.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %2 = load i8*, i8** %tag.addr, align 8
  %3 = load i32, i32* %data.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16.180, i64 0, i64 0), i8* %2, i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLWriteDouble(i8* %tag, double %data) #0 {
entry:
  %tag.addr = alloca i8*, align 8
  %data.addr = alloca double, align 8
  store i8* %tag, i8** %tag.addr, align 8
  store double %data, double* %data.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %2 = load i8*, i8** %tag.addr, align 8
  %3 = load double, double* %data.addr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17.181, i64 0, i64 0), i8* %2, double %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @YAMLWriteFloat(i8* %tag, float %data) #0 {
entry:
  %tag.addr = alloca i8*, align 8
  %data.addr = alloca float, align 4
  store i8* %tag, i8** %tag.addr, align 8
  store float %data, float* %data.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %cmp = icmp ne %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @output, align 8
  %2 = load i8*, i8** %tag.addr, align 8
  %3 = load float, float* %data.addr, align 4
  %conv = fpext float %3 to double
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18.182, i64 0, i64 0), i8* %2, double %conv)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.0 (https://github.com/llvm/llvm-project.git 5917097ca4f32811a55cc637ad8556143497c1e6)"}
!1 = !{i32 1, !"wchar_size", i32 4}
