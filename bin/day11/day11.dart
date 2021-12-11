import 'dart:io';

void printOct(int size, List<List<int>> octopuses) {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      stdout.write(octopuses[i][j]);
    }
    stdout.write('\n');
  }
}

int totalOfFlashes(int steps, List<List<int>> octopuses) {
  int size = octopuses.length;
  int flashes = 0;

  for (int step = 1; step <= steps; step++) {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        octopuses[i][j] = octopuses[i][j] + 1;
      }
    }

    while (octopuses.any((oct) => oct.any((oct) => oct > 9))) {
      for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
          if (octopuses[i][j] > 9) {
            addEnergy(i - 1, j, octopuses, size);
            addEnergy(i + 1, j, octopuses, size);
            addEnergy(i, j - 1, octopuses, size);
            addEnergy(i, j + 1, octopuses, size);

            addEnergy(i - 1, j - 1, octopuses, size);
            addEnergy(i - 1, j + 1, octopuses, size);
            addEnergy(i + 1, j - 1, octopuses, size);
            addEnergy(i + 1, j + 1, octopuses, size);

            octopuses[i][j] = 0;
            flashes++;
          }
        }
      }
      if (octopuses.every((oct) => oct.every((oct) => oct == 0))) {
        print('Flash simultaneously at step $step');
      }
    }
  }
  return flashes;
}

void addEnergy(int x, int y, List<List<int>> octopuses, int size) {
  if (x < size && y < size && x >= 0 && y >= 0) {
    if (octopuses[x][y] != 0) {
      octopuses[x][y] += 1;
    }
  }
}

List<List<int>> getInput() {
  var lines = File('day11/input.txt').readAsLinesSync();
  return lines
      .map((line) => line.split('').map((number) => int.parse(number)).toList())
      .toList();
}

void main() {
  var lines = getInput();
  var total = totalOfFlashes(700, lines);

  print('total $total');
}
