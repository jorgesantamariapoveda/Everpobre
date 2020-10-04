//! Arguments for routes
import 'package:everpobre/domain/notebook.dart';

class ArgumentsRoute {
  //! Properties
  final Notebook _notebook;
  Notebook get notebook => _notebook;

  //! Constructor
  ArgumentsRoute(Notebook notebook) : _notebook = notebook;
}
