import 'dart:io';

int getTotalOfFishAfterDays(List<int> fish, int days) {
  for (int day = 1; day <= days; day++) {
    int newFish = 0;
    for (int i = 0; i < fish.length; i++) {
      if (fish[i] == 0) {
        fish[i] = 6;
        newFish++;
      } else {
        fish[i]--;
      }
    }
    fish.addAll(List.generate(newFish, (i) => 8));
  }
  return fish.length;
}

int getTotalOfFishAfterDaysV2(List<int> fish, int days) {
  Map<int, int> fishMap = {};
  for (var f in fish) {
    if (fishMap.containsKey(f)) {
      fishMap[f] = fishMap[f]! + 1;
    } else {
      fishMap[f] = 1;
    }
  }
  for (int day = 1; day <= days; day++) {
    Map<int, int> newFishMap = {};
    for (int i = 0; i <= 8; i++) {
      newFishMap[i] = fishMap[i] ?? 0;
    }
    for (int i = 0; i <= 8; i++) {
      if (i == 6) {
        fishMap[i] = newFishMap[0]! + newFishMap[7]!;
      } else if (i < 8) {
        fishMap[i] = newFishMap[i + 1]!;
      } else {
        fishMap[i] = newFishMap[0]!;
      }
    }
  }
  int total = 0;
  for (var f in fishMap.entries) {
    total += f.value;
  }
  return total;
}

List<int> getFish() {
  var fish = File('day6/input.txt').readAsLinesSync()[0];
  return fish.split(',').map((e) => int.parse(e)).toList();
}

void main() {
  var fish = getFish();
  var total = getTotalOfFishAfterDaysV2(fish, 256);
  print(total);
}
