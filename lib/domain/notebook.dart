import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

//! El ChangeNotifier es un mixin
class Notebook with ChangeNotifier {
  //! Properties
  // TODO el singleton habrá que borrarlo, quizás nos sirva la idea
  // para crear un notebooks
  static final shared = Notebook();

  final List<Note> _notes = [];

  int get length => _notes.length;

  //! Constructores
  Notebook(); // de forma ímplicita se genera solo salvo cuando se crean más constructores
  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(10, (index) => Note("Item $index")));
  }

  //! Accesores
  Note operator [](int index) {
    //! Esto habría que plantearlo mejor
    /*
    try {
      return _notes[index];
    } catch (e) {
      print(e.toString());
      return null;
    }
    */
    return _notes[index];
  }

  //! Mutadores
  // En los mutadores serán los sitios donde pego el grito para que quién
  // esté escuchando se entere que el modelo ha cambiado
  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  //! Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }

  // TODO Implementar el operator== y el hashcode porque voy a tener varios
  // notebooks
}
