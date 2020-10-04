//! Arguments for routes
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

class ArgumentsRoute {
  //! Properties
  final Notebook _notebook;
  Notebook get notebook => _notebook;

  final Note _note;
  Note get note => _note;

  //! Constructor
  ArgumentsRoute.notebook(Notebook notebook)
      : _notebook = notebook,
        _note = null;
  ArgumentsRoute.note(Note note)
      : _notebook = null,
        _note = note;
}
