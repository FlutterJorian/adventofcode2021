import 'dart:io';

void main() async {
  var file = File('./input');
  var lines = await file.readAsLines();
  print('hello');
}
