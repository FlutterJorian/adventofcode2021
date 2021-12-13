import 'dart:io';

import 'dart:math';

Manual getInput() {
  var manual = Manual();
  var lines = File('day13/input.txt').readAsLinesSync();
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].isNotEmpty) {
      if (i >= 716) {
        var values = lines[i].split('=');
        var fold = values[0][values[0].length - 1] == 'x' ? Fold.left : Fold.up;
        manual.instructions.add(Instruction(fold, int.parse(values[1])));
      } else {
        var numbers = lines[i].split(',');
        var point = Point(int.parse(numbers[0]), int.parse(numbers[1]));
        manual.points.add(point);
      }
    }
  }
  return manual;
}

void main() {
  var lines = getInput();
}

enum Fold { left, up }

class Manual {
  List<Point> points = [];
  List<Instruction> instructions = [];
}

class Instruction {
  Instruction(this.fold, this.value);
  Fold fold;
  int value;
}
