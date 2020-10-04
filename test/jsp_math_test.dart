import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/extensions/jsp_math.dart';

void main() {
  test("generateRandomPositive", () {
    final int length = generateRandomPositive(10);
    expect(length, isPositive);
  });
}
