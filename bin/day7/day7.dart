import 'dart:io';

int getTotalFuel(List<int> positions) {
  positions.sort();
  List<int> f = [];
  for (int i = 0; i < positions.last; i++) {
    int sum = 0;
    for (var positions in positions) {
      sum += (positions - i).abs();
    }
    f.add(sum);
  }
  f.sort();
  return f.first;
}

int getTotalFuelV2(List<int> positions) {
  positions.sort();
  List<int> f = [];
  for (int i = 0; i < positions.last; i++) {
    int sum = 0;
    for (var position in positions) {
      int n = (position - i).abs();
      sum += (n * (n + 1) / 2).floor();
    }
    f.add(sum);
  }
  f.sort();
  return f.first;
}

List<int> getCrabSubPositions() {
  var positions = File('day7/input.txt').readAsStringSync().split(',');
  return positions.map((e) => int.parse(e)).toList();
}

void main() {
  var positions = getCrabSubPositions();
  var r = getTotalFuelV2(positions);
  print(r);
}
