import 'dart:io';

List<String> getInput() {
  return File('day9/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
