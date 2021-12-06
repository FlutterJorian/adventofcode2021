import 'dart:io';
import 'dart:math';

Map<Point, int> getCoveredMap(List<Line> lines) {
  Map<Point, int> covered = {};
  for (var line in lines) {
    //if (!line.isDiagonal()) {
    for (var point in line.getPoints()) {
      if (covered.containsKey(point)) {
        covered[point] = covered[point]! + 1;
      } else {
        covered[point] = 1;
      }
    }
    //}
  }
  return covered;
}

int numberOfTwoOverlap(Map<Point, int> covered) {
  int total = 0;
  for (var entry in covered.entries) {
    if (entry.value > 1) total++;
  }
  return total;
}

List<Line> getLines() {
  var textLines = File('day5/input.txt').readAsLinesSync();
  List<Line> lines = [];
  for (var textLine in textLines) {
    var points = textLine.split(' -> ');
    var point1 = points[0].split(',');
    var point2 = points[1].split(',');
    var line = Line(
      Point(
        int.parse(point1[0]),
        int.parse(point1[1]),
      ),
      Point(
        int.parse(point2[0]),
        int.parse(point2[1]),
      ),
    );
    lines.add(line);
  }
  return lines;
}

void main() {
  var lines = getLines();
  var map = getCoveredMap(lines);
  var total = numberOfTwoOverlap(map);
  print(total);
}

class Line {
  Line(this.from, this.to);
  Point from;
  Point to;

  bool isDiagonal() {
    return from.x != to.x && from.y != to.y;
  }

  List<Point> getPoints() {
    List<Point> points = [];

    num diffx = from.x - to.x;
    num diffy = from.y - to.y;

    num x = from.x;
    num y = from.y;

    points.add(Point(x, y));
    for (int i = 0; i < max(diffx.abs(), diffy.abs()); i++) {
      if (diffx < 0) {
        x++;
      } else if (diffx > 0) {
        x--;
      }
      if (diffy < 0) {
        y++;
      } else if (diffy > 0) {
        y--;
      }
      points.add(Point(x, y));
    }
    return points;
  }
}
