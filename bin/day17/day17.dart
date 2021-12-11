import 'dart:io';

List<String> getInput() {
  return File('day15/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
