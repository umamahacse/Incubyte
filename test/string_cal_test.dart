import 'package:incubyte/view_model/string_cal_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';  

void main() {
  var calculator = StringCalViewmodel();

  test('Empty string should return 0', () {
    expect(calculator.add(""), equals(0));
  });

  test('Single number should return the number itself', () {
    expect(calculator.add("1"), equals(1));
  });

  test('Two numbers should return their sum', () {
    expect(calculator.add("1,5"), equals(6));
  });

  test('Custom delimiter should be supported', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  test('Negative numbers should throw an exception', () {
    expect(() => calculator.add("1,-2,3"), throwsA(isA<Exception>()));
  });
}
