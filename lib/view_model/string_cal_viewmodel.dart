import 'package:flutter/material.dart';

class StringCalViewmodel extends ChangeNotifier {
  TextEditingController inputStringController = TextEditingController();
  int count = 0;

  int add(String inputString) {
    if (inputString.isEmpty) {
      count = 0;
      notifyListeners();
      return 0;
    }
      String delimiter = ',';
      //fetch the delimiter
      if (inputString.contains('//')) {
        delimiter = inputString[2];

        //replace the delimiter string from the inputString
        inputString = inputString.replaceAll('//', '');
        inputString = inputString.substring(1, inputString.length);
      }

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
      int negNum = 0;
      if (commaSplit.isNotEmpty) {
        //convert the string to int
        List<int> commaSplitInt = commaSplit.map((e) => int.parse(e)).toList();
        checkNegNumber(commaSplitInt);
        if (newlineSplit.isNotEmpty) {
          List<int> newlineSplitInt =
              newlineSplit.map((e) => int.parse(e)).toList();
          //reduce method used to sum the int
          checkNegNumber(newlineSplitInt);
          int sum = commaSplitInt.reduce((a, b) => a + b);
          count = sum + newlineSplitInt.reduce((a, b) => a + b);
        } else {
          count = commaSplitInt.reduce((a, b) => a + b);
        }
      } else {
        List<int> newlineSplitInt =
            newlineSplit.map((e) => int.parse(e)).toList();
        checkNegNumber(newlineSplitInt);
        count = newlineSplitInt.reduce((a, b) => a + b);
      }
      notifyListeners();
      return count;
  }

  checkNegNumber(List<int> numList) {
    int negNum = 0;
    numList.any((element) {
      if (element < 0) {
        negNum = element;
        return true;
      }
      return false;
    });
    if (negNum < 0) {
      throw Exception('negative numbers not allowed: $negNum');
    }
  }
}
