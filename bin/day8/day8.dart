import 'dart:io';

List<String> getInput() {
  return File('day8/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
