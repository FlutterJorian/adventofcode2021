import 'dart:io';

int createPolymer(Formula formula, int steps) {
  String polymer = formula.template;

  List<String> newElements = [];
  for (int step = 1; step <= steps; step++) {
    newElements = [];
    for (int i = 0; i < polymer.length; i++) {
      if (i + 1 < polymer.length) {
        var pair = polymer[i] + polymer[i + 1];
        newElements.add(formula.pairInsertions[pair]!);
      }
    }

    var chars = polymer.split('');
    polymer = '';
    for (var i = 0; i < chars.length; i++) {
      polymer += chars[i] + (i < newElements.length ? newElements[i] : '');
    }
  }

  Map<String, int> counts = {};
  for (var char in polymer.split('')) {
    counts[char] = (counts[char] ?? 0) + 1;
  }

  int min = -1;
  int max = 0;
  for (var value in counts.values) {
    if (value > max) max = value;
    if (value < min || min == -1) min = value;
  }
  return max - min;
}

int createPolymerV2(Formula formula, int steps) {
  Map<String, int> pairCount = {};
  for (var entry in formula.pairInsertions.entries) {
    pairCount[entry.key] = 0;
  }

  for (int i = 0; i < formula.template.length - 1; i++) {
    var pair = formula.template[i] + formula.template[i + 1];
    pairCount[pair] = pairCount[pair]! + 1;
  }

  Map<String, int> charCount = {};
  for (var char in formula.template.split('')) {
    charCount[char] = (charCount[char] ?? 0) + 1;
  }

  for (int step = 1; step <= steps; step++) {
    var newPairCount = {};
    for (var entry in pairCount.entries) {
      var element = formula.pairInsertions[entry.key]!;
      var pair1 = entry.key[0] + element;
      var pair2 = element + entry.key[1];

      charCount[element] = (charCount[element] ?? 0) + entry.value;

      newPairCount[pair1] = (newPairCount[pair1] ?? 0) + entry.value;
      newPairCount[pair2] = (newPairCount[pair2] ?? 0) + entry.value;
    }
    pairCount = {...newPairCount};
  }

  int min = -1;
  int max = 0;
  for (var value in charCount.values) {
    if (value > max) max = value;
    if (value < min || min == -1) min = value;
  }
  return max - min;
}

Formula getInput() {
  var lines = File('day14/input.txt').readAsLinesSync();
  var formula = Formula();
  formula.template = lines[0];
  for (int i = 2; i < lines.length; i++) {
    var pairs = lines[i].split(' -> ');
    formula.pairInsertions[pairs[0]] = pairs[1];
  }
  return formula;
}

void main() {
  var formula = getInput();
  var total = createPolymerV2(formula, 40);

  print(total);
}

class Formula {
  String template = '';
  Map<String, String> pairInsertions = {};
}
