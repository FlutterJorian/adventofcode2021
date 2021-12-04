import 'dart:io';

List<String> getInput() {
  return File('./bin/day5/input').readAsLinesSync();
}

void day5() {
  var list = getInput();

  print(list);
}
