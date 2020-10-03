import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotebooksListView extends StatelessWidget {
  //! Properties
  final Notebooks _model;

  //! Constructor
  const NotebooksListView(Notebooks model) : _model = model;

  //! Life cycle
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const FlutterLogo(),
            title: Text(_model[index].title),
            subtitle: Text(_getTextNotebook(_model[index])),
            onTap: () => print("celda ontap"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    );
  }
}

String _getTextNotebook(Notebook notebook) {
  final int length = notebook.length;
  if (length > 1) {
    return "$length notes";
  } else {
    return "$length note";
  }
}
