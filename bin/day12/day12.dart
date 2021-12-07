import 'dart:io';

List<String> getInput() {
  return File('day12/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
