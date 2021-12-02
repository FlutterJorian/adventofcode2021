import 'dart:io';

int getFinalPositions(List<SubmarineCommand> commands) {
  int depth = 0;
  int horizontal = 0;

  for (var command in commands) {
    switch (command.move) {
      case 'forward':
        horizontal += command.value;
        break;
      case 'down':
        depth += command.value;
        break;
      case 'up':
        depth -= command.value;
        break;
    }
  }

  return depth * horizontal;
}

int getFinalPositionsV2(List<SubmarineCommand> commands) {
  int depth = 0;
  int horizontal = 0;
  int aim = 0;

  for (var command in commands) {
    switch (command.move) {
      case 'forward':
        horizontal += command.value;
        depth += (aim * command.value);
        break;
      case 'down':
        aim += command.value;
        break;
      case 'up':
        aim -= command.value;
        break;
    }
  }

  return depth * horizontal;
}

Future<List<SubmarineCommand>> getSubmarineCommands() async {
  var file = File('./bin/day2/input');
  var lines = await file.readAsLines();

  List<SubmarineCommand> commands = [];
  for (var line in lines) {
    var v = line.split(' ');
    commands.add(SubmarineCommand(v[0], int.parse(v[1])));
  }
  return commands;
}

class SubmarineCommand {
  SubmarineCommand(this.move, this.value);
  String move;
  int value;
}

void day2() async {
  var commands = await getSubmarineCommands();
  print(getFinalPositionsV2(commands));
}
