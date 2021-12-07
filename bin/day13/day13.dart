import 'dart:io';

List<String> getInput() {
  return File('day13/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
