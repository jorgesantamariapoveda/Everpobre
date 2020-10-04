import 'package:everpobre/domain/notebook.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebooks.dart';

void main() {
  group("Constructors", () {
    test("Notebooks.shared", () {
      expect(Notebooks.shared, isNotNull);
    });
    test("Notebook default is empty", () {
      final notebooks = Notebooks();

      expect(notebooks, isNotNull);
      expect(notebooks.length, 0);
    });
  });

  group("Setters", () {
    test("Public function add", () {
      final notebooks = Notebooks();
      final notebook = Notebook("nb");

      notebooks.add(notebook);
      expect(notebooks.length, 1);
    });
    test("Public function removeAt", () {
      final notebooks = Notebooks();
      final notebook = Notebook("nb");

      notebooks.add(notebook);
      notebooks.removeAt(0);
      expect(notebooks.length, 0);
    });
  });
}
