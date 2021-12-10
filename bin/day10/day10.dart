import 'dart:io';

int syntaxErrors(List<List<String>> lines) {
  List<String> open = ['(', '[', '{', '<'];
  List<String> closed = [')', ']', '}', '>'];
  Map<String, int> scores = {
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137,
  };
  int score = 0;

  for (var line in lines) {
    List<String> stack = [];
    for (var char in line) {
      if (open.contains(char)) {
        stack.add(char);
      } else if (char == closed[open.indexOf(stack[stack.length - 1])]) {
        stack.removeLast();
      } else {
        stack.removeLast();
        score += scores[char]!;
      }
    }
  }
  return score;
}

int syntaxErrorsV2(List<List<String>> lines) {
  List<String> open = ['(', '[', '{', '<'];
  List<String> closed = [')', ']', '}', '>'];
  List<List<String>> incompleteLines = [];

  for (var line in lines) {
    List<String> stack = [];
    bool corrupted = false;
    for (var char in line) {
      if (open.contains(char)) {
        stack.add(char);
      } else if (char == closed[open.indexOf(stack[stack.length - 1])]) {
        stack.removeLast();
      } else {
        stack.removeLast();
        corrupted = true;
        break;
      }
    }
    if (!corrupted) {
      incompleteLines.add(line);
    }
  }

  List<int> scores = [];
  for (var incompleteLine in incompleteLines) {
    List<String> stack = [];
    for (var char in incompleteLine) {
      if (open.contains(char)) {
        stack.add(char);
      } else if (char == closed[open.indexOf(stack[stack.length - 1])]) {
        stack.removeLast();
      } else {
        print('error');
      }
    }
    int score = 0;
    for (var item in stack.reversed) {
      var expected = closed[open.indexOf(item)];
      var point = closed.indexOf(expected) + 1;
      score = score * 5;
      score += point;
    }
    scores.add(score);
  }
  scores.sort();
  return scores[scores.length ~/ 2];
}

List<List<String>> getInput() {
  var lines = File('day10/input.txt').readAsLinesSync();
  return lines.map((e) => e.split('')).toList();
}

void main() {
  var lines = getInput();
  //var score = syntaxErrors(lines);
  var score = syntaxErrorsV2(lines);
  print(score);
}
