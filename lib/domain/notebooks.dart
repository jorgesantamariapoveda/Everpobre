import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/extensions/jsp_math.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  //! Singleton
  static final shared = Notebooks();

  //! Properties
  final List<Notebook> _notebooks = [];
  int get length => _notebooks.length;

  //! Constructor
  Notebooks();
  Notebooks.testDataBuilder() {
    _notebooks.addAll(List.generate(generateRandomPositive(5),
        (index) => Notebook.testDataBuilder("Notebook ${index + 1}")));
  }

  //! Public functions
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

  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  Notebook removeAt(int index) {
    final Notebook n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }
}
