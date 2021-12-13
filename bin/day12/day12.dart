import 'dart:io';

Map<String, List> getInput() {
  Map<String, List> map = {};
  var lines = File('day12/input.txt').readAsLinesSync();
  for (var line in lines) {
    var parts = line.split('-');
    if (map[parts[0]] != null) {
      map[parts[0]]!.add(parts[1]);
    } else {
      map[parts[0]] = [parts[1]];
    }
    if (map[parts[1]] != null) {
      map[parts[1]]!.add(parts[0]);
    } else {
      map[parts[1]] = [parts[0]];
    }
  }
  return map;
}

int totalPaths(Map<String, List> map) {
  List<String> paths = [];
  exploreV2(map, 'start', paths, '', false);
  for (var path in paths) {
    print(path.substring(0, path.length - 1));
  }
  return paths.length;
}

List<String> explore(
    Map<String, List> map, String node, List<String> paths, String path) {
  path += '$node,';
  if (node == 'end') {
    paths.add(path);
    return paths;
  }
  for (String cave in map[node]!) {
    if (RegExp('[a-z]+').hasMatch(cave) && path.contains(cave)) {
      continue;
    }
    explore(map, cave, paths, path);
  }
  return paths;
}

List<String> exploreV2(Map<String, List> map, String node, List<String> paths,
    String path, bool visitedTwice) {
  path += '$node,';
  if (node == 'end') {
    visitedTwice = false;
    paths.add(path);
    return paths;
  }
  for (String cave in map[node]!) {
    if (RegExp('[a-z]+').hasMatch(cave) && path.contains(cave)) {
      if (_smallCaveVisitedTwice(path) || cave == 'start') {
        continue;
      }
    }
    exploreV2(map, cave, paths, path, visitedTwice);
  }
  return paths;
}

bool _smallCaveVisitedTwice(String path) {
  List<String> smallCaves = [];
  for (var cave in path.split(',')) {
    if (RegExp('[a-z]+').hasMatch(cave)) {
      if (smallCaves.contains(cave)) return true;
      smallCaves.add(cave);
    }
  }
  return false;
}

void main() {
  var map = getInput();
  var result = totalPaths(map);

  print(result); //155477
}
