import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotebooksListView extends StatefulWidget {
  //! Properties
  final Notebooks _model;

  //! Constructor
  const NotebooksListView(Notebooks model) : _model = model;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  //! Private functions
  void _modelDidChange() {
    setState(() {});
  }

  //! Life cycle
  @override
  void initState() {
    // aquí no podemos darnos de alta todavía porque en esto momento
    // no está conectado ni el widget ni el elemento
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // aquí nos damos de alta, ideal porque ya tenemos acceso al widget y por
    // tanto a sus propiedades.
    // Siempre que nos damos de alta en una notificación habrá que darse de baja
    // ello se realiza en dispose() que también forma parte del ciclo de vida
    widget._model.addListener(_modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // aquí nos damos de baja antes de ser destruido
    widget._model.removeListener(_modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const FlutterLogo(),
            title: Text(widget._model[index].title),
            subtitle: Text(_getTextNotebook(widget._model[index])),
            onTap: () => print("celda ontap222"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    );
  }
}

String _getTextNotebook(Notebook notebook) {
  final int length = notebook.length;
  if (length == 0) {
    return TextResources.empty;
  } else if (length == 1) {
    return "$length note";
  } else {
    return "$length notes";
  }
}
