import 'dart:io';

List<String> getInput() {
  return File('day14/input.txt').readAsLinesSync();
}

void main() {
  var lines = getInput();
}
