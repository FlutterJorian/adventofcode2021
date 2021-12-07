import 'dart:io';

List<String> getInput() {
  return File('day11/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
