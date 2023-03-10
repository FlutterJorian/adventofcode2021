import 'dart:io';

int numOfMeasureWindowIncreases(List<int> measurements) {
  int prev = 0;
  int total = 0;

  for (int i = 0; i < measurements.length; i++) {
    if (i + 2 < measurements.length) {
      int current = measurements[i] + measurements[i + 1] + measurements[i + 2];
      if (prev > 0 && current > prev) {
        total++;
      }
      prev = current;
    }
  }
  return total;
}

int numOfDepthMeasureIncreases(List<int> measurements) {
  int prev = 0;
  int total = 0;

  for (var measurement in measurements) {
    if (prev > 0 && measurement > prev) {
      total++;
    }
    prev = measurement;
  }
  return total;
}

List<int> getMeasurements() {
  var file = File('day1/input.txt');
  var lines = file.readAsLinesSync();

  List<int> numbers = [];
  for (var line in lines) {
    numbers.add(int.parse(line));
  }
  return numbers;
}

void main() {
  var measurements = getMeasurements();
  var r = numOfMeasureWindowIncreases(measurements);

  print(r);
}
