import 'package:flutter/material.dart';

class StringCalViewmodel extends ChangeNotifier {
  TextEditingController inputStringController = TextEditingController();
  int count = 0;

  void add(String inputString) {
    if (inputString.isEmpty) {
      count = 0;
      notifyListeners();
    }
    String delimiter = ',';
    //fetch the delimiter
    if (inputString.contains('//')) {
      delimiter = inputString[2];
    }
    //replace the delimiter string from the inputString
    inputString = inputString.replaceAll('//', '');
    inputString = inputString.substring(1, inputString.length);

    //split the string based on the delimiter
    List<String> commaSplit = inputString.split(delimiter);
    List<String> newlineSplit = [];
    if (commaSplit.isNotEmpty) {
      List<String> temp = [];
      temp.addAll(commaSplit);
      commaSplit.asMap().forEach((index, value) {
        //verify the string contains \n
        if (value.contains('\\n')) {
          newlineSplit.addAll(value.split('\\n'));
          commaSplit[index] = '0';
        }
      });
    }
    if (commaSplit.isNotEmpty) {
      //convert the string to int
      List<int> commaSplitInt = commaSplit.map((e) => int.parse(e)).toList();
      if (newlineSplit.isNotEmpty) {
        List<int> newlineSplitInt =
            newlineSplit.map((e) => int.parse(e)).toList();
        //reduce method used to sum the int
        int sum = commaSplitInt.reduce((a, b) => a + b);
        count = sum + newlineSplitInt.reduce((a, b) => a + b);
      } else {
        count = commaSplitInt.reduce((a, b) => a + b);
      }
    } else {
      List<int> newlineSplitInt =
          newlineSplit.map((e) => int.parse(e)).toList();
      count = newlineSplitInt.reduce((a, b) => a + b);
    }
    notifyListeners();
  }
}
