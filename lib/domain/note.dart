import 'package:everpobre/extensions/date_time.dart';
import 'package:flutter/material.dart';

class Note with ChangeNotifier {
  //! Properties
  String _body = "";

  String get body => _body;
  set body(String newValue) {
    _body = newValue;
    _modificationDate = DateTime.now();
    notifyListeners();
  }

  DateTime _creationDate;
  DateTime get creationDate => _creationDate;
  DateTime _modificationDate;
  DateTime get modificationDate => _modificationDate;

  //! Constructors
  Note(String contents) : _body = contents {
    _modificationDate = DateTime.now();
    _creationDate = DateTime.now();
  }

  //! Public functions
  Note.empty() : this("");

  //! Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $body>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Note &&
          (other.body == body) &&
          (other.creationDate.almostEqual(_creationDate)) &&
          (other.modificationDate.almostEqual(_modificationDate));
    }
  }

  // Dos fechas que se consideran iguales (con un precision) y que se
  // verifica con el operator== deben devolver el mismo hashCode
  // El patrón del pringao -> Proxy, le endosas el trabajo que tu no
  // quieres hacer
  // año-mes-dia-hora-min-seg--decseg--milseg, si considero hasta los
  // segundos, ambos DateTime son iguales, eso es lo que hace el proxy
  // 2020-8-3-14-53-09--12-900
  // 2020-8-3-14-53-09--2-32
  @override
  int get hashCode {
    final proxy = DateTime(
        _creationDate.year,
        _creationDate.month,
        _creationDate.day,
        _creationDate.hour,
        _creationDate.minute,
        _creationDate.second);
    return proxy.hashCode;
  }
}
