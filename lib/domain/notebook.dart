import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

//! El ChangeNotifier es un mixin
class Notebook with ChangeNotifier {
  //! Properties
  // TODO el singleton habrá que borrarlo, quizás nos sirva la idea
  // para crear un notebooks
  //static final shared = Notebook();

  String _title = "";
  final List<Note> _notes = [];

  int get length => _notes.length;
  String get title => _title;

  //! Constructores
  Notebook(String title) : _title = title;
  Notebook.testDataBuilder(String title) {
    _title = title;
    _notes.addAll(List.generate(5, (index) => Note("Note $index + 1")));
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Notebook &&
          other._title == _title &&
          other._notes.length == _notes.length &&
          other._notes == _notes;
    }
  }

  @override
  int get hashCode {
    return _title.hashCode + _notes.hashCode;
  }
}
