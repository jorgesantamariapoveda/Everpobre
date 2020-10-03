import 'package:everpobre/domain/notebook.dart';

class Notebooks {
  //! Singleton
  static final shared = Notebooks();

  //! Properties
  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  //! Constructor
  Notebooks();
  Notebooks.testDataBuilder() {
    /*
    _notebooks
        .addAll(List.generate(10, (index) => Notebook("Item ${index + 1}")));
*/
    _notebooks.addAll(List.generate(
        10, (index) => Notebook.testDataBuilder("Notebook ${index + 1}")));
  }

  //! Accesores
  Notebook operator [](int index) {
    //! Esto habría que plantearlo mejor
    /*
    try {
      return _notes[index];
    } catch (e) {
      print(e.toString());
      return null;
    }
    */
    return _notebooks[index];
  }
}
