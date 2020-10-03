import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Constructor title", () {
      expect(Notebook("Notebook"), isNotNull);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb1 = Notebook("nb1");
      final nb2 = Notebook("nb2");
      final note = Note("Lorem Ipsum");

      expect(nb1.length, 0);

      nb2.add(note);
      expect(nb2.length, 1);

      nb2.remove(note);
      expect(nb2.length, 0);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note note = Note("hola");
      final Notebook nb = Notebook("nb");

      // Se empaqueta dentro de un clousre porque queremos evaluar algo
      // que puede lanzar una excepción
      nb.add(note);
      expect(() => nb.removeAt(0), returnsNormally);

      nb.add(note);
      expect(nb.removeAt(0), note);
    });
  });
}
