import 'dart:collection';
import 'dart:io';


void main() {
var lines = ReadFile(r'C:\Users\lfitzpatrick\Downloads\two1nine.txt');
num sum = ChallengeOne(lines);
print('The Sum is: $sum');
}

List<String> ReadFile(String filePath) {
  var config = new File(filePath);
  List<String> lines = config.readAsLinesSync();
  return lines;
}

num ChallengeOne(List<String> rows) {
  final Map<String, String> numbers = {
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9'
  };
  num sum = 0;
  for (String row in rows) {
    Map<num, String> rowNumbers = {};

    RegExp digits = RegExp(r'\d', caseSensitive: false);

    Iterable<RegExpMatch> digitMatches = digits.allMatches(row);

    for (final match in digitMatches) {
      String value = match.group(0)!;
      num location = match.start;
      rowNumbers.addEntries([MapEntry(location, value)]);
    }

    for (int i = 0; i < row.length; ++i) {
      numbers.forEach((key, value) {
        if (row.startsWith(key)) {
          rowNumbers.addEntries([MapEntry(i, value)]);
        }
      });
    }


    var sortedNumbers = new SplayTreeMap<num, String>.from(rowNumbers);

    if (sortedNumbers.length <= 1) {
      num val = num.parse('${sortedNumbers.values.first}${sortedNumbers.values.first}');
      sum += val;
      print(val);
    } else {
      num val = num.parse('${sortedNumbers.values.first}${sortedNumbers.values.last}');
      sum += val;
      print(val);
    }
    print(row);
  }
  return sum;
}