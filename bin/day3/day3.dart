import 'dart:io';

String findUnCommonV2(List<String> report) {
  int ones = 0;
  int zeros = 0;

  int len = report[0].length;
  for (int x = 0; x < len; x++) {
    var aa = numLeft(report);
    if (aa.isNotEmpty) {
      return aa;
    }
    for (var num in report) {
      if (num.isNotEmpty) {
        if (num[x] == '1') {
          ones++;
        } else {
          zeros++;
        }
      }
    }
    if (ones < zeros) {
      for (int i = 0; i < report.length; i++) {
        if (report[i].isNotEmpty && report[i][x] == '0') {
          report[i] = '';
        }
      }
    } else if (ones >= zeros) {
      for (int i = 0; i < report.length; i++) {
        if (report[i].isNotEmpty && report[i][x] == '1') {
          report[i] = '';
        }
      }
    }
    ones = 0;
    zeros = 0;
  }
  return numLeft(report);
}

String findCommonV2(List<String> report) {
  int ones = 0;
  int zeros = 0;

  int len = report[0].length;
  for (int x = 0; x < len; x++) {
    var aa = numLeft(report);
    if (aa.isNotEmpty) {
      return aa;
    }
    for (var num in report) {
      if (num.isNotEmpty) {
        if (num[x] == '1') {
          ones++;
        } else {
          zeros++;
        }
      }
    }
    if (ones >= zeros) {
      for (int i = 0; i < report.length; i++) {
        if (report[i].isNotEmpty && report[i][x] == '0') {
          report[i] = '';
        }
      }
    } else if (ones < zeros) {
      for (int i = 0; i < report.length; i++) {
        if (report[i].isNotEmpty && report[i][x] == '1') {
          report[i] = '';
        }
      }
    }
    ones = 0;
    zeros = 0;
  }
  return numLeft(report);
}

String numLeft(List<String> r) {
  int a = 0;
  String l = '';
  for (var i in r) {
    if (i.isNotEmpty) {
      a++;
      l = i;
    }
  }
  if (a == 1) return l;
  return '';
}

String findCommon(List<String> report) {
  int ones = 0;
  int zeros = 0;
  String result = '';

  int len = report[0].length;
  for (int i = 0; i < len; i++) {
    for (var num in report) {
      if (num[i] == '1') {
        ones++;
      } else {
        zeros++;
      }
    }
    if (ones > zeros) {
      result += '1';
    } else {
      result += '0';
    }
    ones = 0;
    zeros = 0;
  }
  return result;
}

String findUnCommon(List<String> report) {
  int ones = 0;
  int zeros = 0;
  String result = '';

  int len = report[0].length;
  for (int i = 0; i < len; i++) {
    for (var num in report) {
      if (num[i] == '1') {
        ones++;
      } else {
        zeros++;
      }
    }
    if (ones < zeros) {
      result += '1';
    } else {
      result += '0';
    }
    ones = 0;
    zeros = 0;
  }
  return result;
}

List<String> getDiagnosticReport() {
  var file = File('day3/input.txt');
  var lines = file.readAsLinesSync();

  return lines;
}

void main() {
  var report = getDiagnosticReport();
  // var gamma = findCommon(report);
  // var epsilon = findUnCommon(report);
//  var r = int.parse(gamma, radix: 2) * int.parse(epsilon, radix: 2);
  var oxy = findCommonV2(report);
  report = getDiagnosticReport();
  var scrub = findUnCommonV2(report);
  var r = int.parse(oxy, radix: 2) * int.parse(scrub, radix: 2);
//4790390
  print(r);
}
