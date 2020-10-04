import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  //! Properties
  final Notebook _model;

  //! Constructor
  const NotesListView(Notebook model) : _model = model;

  //! State
  // flutter se "encabrona" mucho si createState no hace otra cosa
  // que llamar al constructor implícito
  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
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
        return NoteSliver(widget._model, index);
      },
    );
  }
}

class NoteSliver extends StatefulWidget {
  //! Properties
  final Notebook notebook;
  final int index;

  //! Constructores
  const NoteSliver(this.notebook, this.index);
  // Otra forma de sintaxis del constructos cuando coinciden los parámetros
  // con las propiedades a asignar de la clase
  /*
  const NoteSliver(Notebook notebook, int index)
      : this.notebook = notebook,
        this.index = index;
  */

  //! State
  @override
  _NoteSliverState createState() => _NoteSliverState();
}

class _NoteSliverState extends State<NoteSliver> {
  @override
  Widget build(BuildContext context) {
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(TextResources.noteDeleted),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebook[widget.index].body),
          subtitle:
              Text(fmt.format(widget.notebook[widget.index].modificationDate)),
        ),
      ),
    );
  }
}
