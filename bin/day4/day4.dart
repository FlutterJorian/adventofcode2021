import 'dart:io';

int getScoreOfWinningBoard(Bingo bingo) {
  for (var number in bingo.numbers) {
    for (var board in bingo.boards) {
      for (var row in board) {
        for (int i = 0; i < row.length; i++) {
          if (row[i] == number) {
            row[i] = -1;
          }
        }
      }
      if (won(board)) {
        calculateScore(number, board);
      }
    }
  }
  return -1;
}

int getScoreOfLastWinningBoard(Bingo bingo) {
  List<int> boardsWon = [];

  for (var number in bingo.numbers) {
    for (int i = 0; i < bingo.boards.length; i++) {
      for (var row in bingo.boards[i]) {
        for (int j = 0; j < row.length; j++) {
          if (row[j] == number) {
            row[j] = -1;
          }
        }
      }
      if (!boardsWon.contains(i) && won(bingo.boards[i])) {
        boardsWon.add(i);
        if (boardsWon.length == bingo.boards.length) {
          return calculateScore(number, bingo.boards[i]);
        }
      }
    }
  }
  return -1;
}

int calculateScore(int number, List<List<int>> board) {
  int total = 0;
  for (var row in board) {
    for (var num in row) {
      if (num != -1) total += num;
    }
  }
  return total * number;
}

bool won(List<List<int>> board) {
  for (int i = 0; i < board.length; i++) {
    int totalCol = 0;
    int totalRow = 0;
    for (int j = 0; j < board.length; j++) {
      totalCol += board[j][i];
      totalRow += board[i][j];
    }
    if (totalCol == -5 || totalRow == -5) return true;
  }
  return false;
}

Future<Bingo> getBingoData() async {
  var lines = await File('./bin/day4/input').readAsLines();
  var bingo = Bingo();
  bingo.numbers = lines[0].split(',').map<int>((e) => int.parse(e)).toList();

  List<List<int>> board = [];
  for (int i = 2; i < lines.length; i++) {
    if (lines[i].isNotEmpty) {
      List<int> numbers = lines[i]
          .trim()
          .split(RegExp(r' +'))
          .map<int>((e) => int.parse(e.trim()))
          .toList();
      board.add(numbers);
    } else {
      bingo.boards.add(board);
      board = [];
    }
  }
  return bingo;
}

void day4() async {
  var bingo = await getBingoData();
  var score = getScoreOfLastWinningBoard(bingo);
  print(score);
}

class Bingo {
  List<int> numbers = [];
  List<List<List<int>>> boards = [];
}
