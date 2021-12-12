import 'dart:io';

Map<dynamic, dynamic> buildTreeStart(List<List<String>> lines) {
  var tree = {};

  tree['start'] = {};
  for (var line in lines) {
    if (line.contains('start')) {
      var cave = line.singleWhere((e) => e != 'start');
      tree['start'][cave] = {};
      var subTree = tree['start'];
      buildTree(lines, subTree, cave, 'start', tree);
    }
  }
  return tree;
}

void buildTree(List<List<String>> lines, Map<dynamic, dynamic> tree,
    String caveName, String prevCave, Map<dynamic, dynamic> full) {
  if (caveName == 'end') return;
  for (var line in lines) {
    if (line.contains(caveName) && !line.contains(prevCave)) {
      var cave = line.singleWhere((e) => e != caveName);
      if (!mapContainsKey(full, cave)) {
        tree[caveName][cave] = {};
        var subTree = tree[caveName];
        buildTree(lines, subTree, cave, caveName, full);
      }
    }
  }
}

bool mapContainsKey(Map<dynamic, dynamic> tree, String key) {
  if (tree.containsKey(key) &&
      (RegExp('[a-z]').hasMatch(key) && key != 'end')) {
    return true;
  } else {
    for (var entry in tree.entries) {
      if (mapContainsKey(entry.value, key)) {
        return true;
      }
    }
  }
  return false;
}

List<List<String>> getInput() {
  var lines = File('day12/test.txt').readAsLinesSync();
  return lines.map((e) => e.split('-').toList()).toList();
}

void countTree(Map<dynamic, dynamic> tree, List<int> count) {
  if (tree.entries.isNotEmpty) {
    for (var branch in tree.entries) {
      countTree(branch.value, count);
    }
  }
  count[0]++;
}

void main() {
  var lines = getInput();
  var tree = buildTreeStart(lines);

  List<int> i = [0];
  countTree(tree, i);
  print(i);
}
