import 'dart:io';

int getTotal(List<List<String>> segments) {
  //1 = 2
  //4 = 4
  //7 = 3
  //8 = 7
  List<int> uniqueSegLength = [2, 4, 3, 7];
  int total = 0;
  for (var lines in segments) {
    for (var segment in lines) {
      if (uniqueSegLength.contains(segment.length)) {
        total++;
      }
    }
  }
  return total;
}

// int getTotalV2(List<List<List<String>>> lines) {
//   Map<int, int> uniqueLengths = {};
//   uniqueLengths[2] = 1;
//   uniqueLengths[4] = 4;
//   uniqueLengths[3] = 7;
//   uniqueLengths[7] = 8;
//   String chars = 'abcdefg';

//   for (var line in lines) {
//     var signalPatterns = line[0];
//     var outputValues = line[1];

//     Map<String, int> map = {};
//     for (var pattern in signalPatterns) {
//       if (uniqueLengths.containsValue(pattern.length)) {
//         map[pattern] = uniqueLengths[pattern.length]!;
//       } else if (pattern.length == 6) {
//         //0
//         //9
//         //6
//       } else if (pattern.length == 5) {
//         //5
//         //3
//         //2
//       }
//     }
//   }
// }

int getTotalV2(List<List<List<String>>> lines) {
  List<int> segmentMap = [
    126,
    48,
    109,
    121,
    51,
    91,
    95,
    112,
    127,
    123,
  ];
  int total = 0;

  for (var line in lines) {
    var signalPatterns = line[0];
    var outputValues = line[1];

    var l = 'abcdefg'.split('');
    String fullNum = '';
    while (fullNum.isEmpty) {
      List<int> values = [];
      for (var pattern in signalPatterns) {
        var val = '0' +
            c(l[0], pattern) +
            c(l[1], pattern) +
            c(l[2], pattern) +
            c(l[3], pattern) +
            c(l[4], pattern) +
            c(l[5], pattern) +
            c(l[6], pattern);

        var num = int.parse(val, radix: 2);

        if (!segmentMap.contains(num)) {
          break;
        } else {
          values.add(num);
        }
      }
      if (values.length == segmentMap.length) {
        for (var pattern in outputValues) {
          var val = '0' +
              c(l[0], pattern) +
              c(l[1], pattern) +
              c(l[2], pattern) +
              c(l[3], pattern) +
              c(l[4], pattern) +
              c(l[5], pattern) +
              c(l[6], pattern);

          var num = int.parse(val, radix: 2);

          fullNum += segmentMap.indexOf(num).toString();
        }
        total += int.parse(fullNum);
      }
      l.shuffle();
    }
  }
  return total;
}

bool checkSeg(String pattern, String segment) {
  var seg = segment.split('');
  for (var p in pattern.split('')) {
    if (!seg.contains(p)) return false;
  }
  return true;
}

int getTotalV3(List<List<List<String>>> lines) {
  List<String> segmentMap = [
    'abcefg',
    'fc',
    'acdeg',
    'acdfg',
    'bdcf',
    'abdfg',
    'abdefg',
    'acf',
    'abcdefg',
    'abcdfg',
  ];
  int total = 0;

  for (var line in lines) {
    var signalPatterns = line[0];
    var outputValues = line[1];

    var l = 'abcdefg'.split('');
    String fullNum = '';
    while (fullNum.isEmpty) {
      List<int> values = [];
      for (var pattern in signalPatterns) {
        for (var segment in segmentMap) {
          if (segment.length == pattern.length && checkSeg(pattern, segment)) {
          } else {
            break;
          }
        }
      }
      if (values.length == segmentMap.length) {
        for (var out in outputValues) {
          fullNum += segmentMap.indexOf(out).toString();
        }
        total += int.parse(fullNum);
      }
      l.shuffle();
    }
  }
  return total;
}

List<List<String>> getInput() {
  var lines = File('day8/input.txt').readAsLinesSync();
  return lines.map((e) => e.split(' | ')[1].split(' ')).toList();
}

List<List<List<String>>> getInputV2() {
  var lines = File('day8/input.txt').readAsLinesSync();
  return lines.map((e) {
    return [
      e.split(' | ')[0].split(' '),
      e.split(' | ')[1].split(' '),
    ];
  }).toList();
}

String c(String letter, String code) {
  return code.contains(letter) ? '1' : '0';
}

void main() {
  // var segments = getInput();
  // var total = getTotal(segments);
  var lines = getInputV2();
  var total = getTotalV2(lines);
  print(total);
  //1011284
}
