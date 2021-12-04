import 'dart:io';

List<String> getInput() {
  return File('day5/input').readAsLinesSync();
}

void main() {
  var list = getInput();

  print(list);
}
