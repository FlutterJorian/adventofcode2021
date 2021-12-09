import 'dart:io';

int sumRiskLevels(List<List<int>> map) {
  int sum = 0;
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map.length; j++) {
      var val = map[i][j];
      var left = inBounds(j - 1) ? map[i][j - 1] : 9;
      var right = inBounds(j + 1) ? map[i][j + 1] : 9;
      var up = inBounds(i - 1) ? map[i - 1][j] : 9;
      var down = inBounds(i + 1) ? map[i + 1][j] : 9;
      if (val < left && val < right && val < up && val < down) {
        sum += val + 1;
      }
    }
  }
  return sum;
}

int sum3LargestBasins(List<List<int>> map) {
  List<int> basinLenghts = [];
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map.length; j++) {
      // var val = map[i][j];
      // var left = inBounds(j - 1) ? map[i][j - 1] : 9;
      // var right = inBounds(j + 1) ? map[i][j + 1] : 9;
      // var up = inBounds(i - 1) ? map[i - 1][j] : 9;
      // var down = inBounds(i + 1) ? map[i + 1][j] : 9;
      // if (val < left && val < right && val < up && val < down) {
      var basinLength = test(i, j, map, 0);
      basinLenghts.add(basinLength);
      // }
    }
  }
  basinLenghts.sort();
  print(basinLenghts);
  return basinLenghts[0] * basinLenghts[1] * basinLenghts[2];
}

int test(int row, int col, List<List<int>> map, int sum) {
  var val = inBounds(col) && inBounds(row) ? map[row][col] : 9;
  if (val < 9) {
    sum++;
    map[row][col] = 9;
    var left = inBounds(col - 1) ? map[row][col - 1] : 9;
    var right = inBounds(col + 1) ? map[row][col + 1] : 9;
    var up = inBounds(row - 1) ? map[row - 1][col] : 9;
    var down = inBounds(row + 1) ? map[row + 1][col] : 9;

    if (left < 9) test(row, col - 1, map, sum++);
    if (right < 9) test(row, col + 1, map, sum++);
    if (up < 9) test(row - 1, col, map, sum++);
    if (down < 9) test(row + 1, col, map, sum++);
  }
  return sum++;
}

bool inBounds(int index) {
  return index >= 0 && index < 100;
}

List<List<int>> getInput() {
  var lines = File('day9/input.txt').readAsLinesSync();
  List<List<int>> result = [];
  for (var line in lines) {
    result.add(line.split('').map((e) => int.parse(e)).toList());
  }
  return result;
}

void main() {
  var map = getInput();
  //var sum = sumRiskLevels(map);
  var sum = sum3LargestBasins(map); //1600104

  print(sum);
}
