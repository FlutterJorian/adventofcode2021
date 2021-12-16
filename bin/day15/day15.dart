import 'dart:io';

int safestRoute(List<List<int>> riskLevelMap) {
  for (int i = 0; i < riskLevelMap.length; i++) {
    for (int j = 0; j < riskLevelMap.length; j++) {}
  }
  return 0;
}

List<List<int>> getInput() {
  var lines = File('day15/input.txt').readAsLinesSync();
  List<List<int>> riskLevelMap = [];
  for (var line in lines) {
    riskLevelMap.add(line.split('').map((e) => int.parse(e)).toList());
  }
  return riskLevelMap;
}

void main() {
  var riskLevelMap = getInput();
  var total = safestRoute(riskLevelMap);

  print(total);
}
