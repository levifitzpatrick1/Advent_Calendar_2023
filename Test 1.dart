import 'dart:collection';
import 'dart:io';


void main() {
var lines = ReadFile(r'C:\Users\lfitzpatrick\Downloads\input.txt');
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
  num answer = 0;
  for (String row in rows) {
    Map<num, String> rowNumbers = {};

    RegExp digits = RegExp(r'(?=(\d|one|two|three|four|five|six|seven|eight|nine))', caseSensitive: false);

    Iterable<RegExpMatch> digitMatches = digits.allMatches(row);

    for (final match in digitMatches) {
      String value = match.group(0)!;
      num location = match.start;
      rowNumbers.addEntries([MapEntry(location, value)]);
    }

    // for (int i = 0; i < row.length; ++i) {
    //   numbers.forEach((key, value) {
    //     if (row.substring(i).startsWith(key)) {
    //       rowNumbers.addEntries([MapEntry(i, value)]);
    //     }
    //   });
    // }


    var sortedNumbers = new SplayTreeMap<num, String>.from(rowNumbers);

    sortedNumbers.forEach((key, value) {
      if(numbers.keys.contains(value)) {
        sortedNumbers[key] = numbers[value]!;
      }
    });

    if (sortedNumbers.length <= 1) {
      num val = num.parse('${sortedNumbers.values.first}${sortedNumbers.values.first}');
      answer += val;
      print(val);
    } else {
      num val = num.parse('${sortedNumbers.values.first}${sortedNumbers.values.last}');
      answer += val;
      print(val);
    }
    print(row);
  }
  return answer;
}

num ChallengeTwo(List<String> rows) {
  num answer = 0;
  Map<String, num> maxValues = {
    'red' : 12,
    'green' : 13,
    'blue' : 14
  };
  Map<String, num> gameValues = {};
  num gameID;

  RegExp digitFinder = RegExp(r'\d');

  for(String row in rows) {
    gameID = digitFinder.firstMatch(row.split(':').first) as num;
    print(gameID);
  }


  return answer;
}