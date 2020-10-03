import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebooks.dart';

void main() {
  group("construction", () {
    test("Notebooks.shared", () {
      expect(Notebooks.shared, isNotNull);
    });
  });
}
