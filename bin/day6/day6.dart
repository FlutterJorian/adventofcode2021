import 'dart:io';

List<String> getInput() {
  return File('day6/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
