import 'package:everpobre/domain/note.dart';
import 'package:everpobre/extensions/jsp_math.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

//! El ChangeNotifier es un mixin
class Notebook with ChangeNotifier {
  //! Properties
  String _title = "";
  final List<Note> _notes = [];

  int get length => _notes.length;
  String get title => _title;

  //! Constructors
  Notebook(String title) : _title = title;
  Notebook.testDataBuilder(String title) {
    _title = title;
    _notes.addAll(List.generate(generateRandomPositive(10),
        (index) => Note("$TextResources.note $index + 1")));
  }

  //! Public functions
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
  // esté escuchando se entere de que el modelo ha cambiado
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
