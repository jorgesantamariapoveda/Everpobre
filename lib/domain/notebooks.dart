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
    _notebooks
        .addAll(List.generate(10, (index) => Notebook("Item ${index + 1}")));
  }
}
