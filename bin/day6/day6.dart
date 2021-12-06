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
  List<int> fishCount = List.filled(9, 0);
  for (var f in fish) {
    if (fishCount[f] > 0) {
      fishCount[f] = fishCount[f] + 1;
    } else {
      fishCount[f] = 1;
    }
  }
  for (int day = 1; day <= days; day++) {
    List<int> newFishCount = List.from(fishCount);
    for (int i = 0; i < fishCount.length; i++) {
      if (i == 6) {
        fishCount[i] = newFishCount[0] + newFishCount[7];
      } else if (i < 8) {
        fishCount[i] = newFishCount[i + 1];
      } else {
        fishCount[i] = newFishCount[0];
      }
    }
  }
  int total = 0;
  for (var f in fishCount) {
    total += f;
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
