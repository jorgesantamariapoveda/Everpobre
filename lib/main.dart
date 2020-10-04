import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/route/arguments_route.dart';
import 'package:everpobre/route/description_route.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextResources.appName,
      routes: {
        NotebooksWidget.routeName: (context) => NotebooksWidget(),
        NotebookWidget.routeName: (context) => NotebookWidget(),
      },
      initialRoute: NotebooksWidget.routeName,
    );
  }
}

class NotebooksWidget extends StatelessWidget {
  //! Properties
  static const routeName = DescriptionRoute.root;

  //! Life cycle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: NotebooksListView(model),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add(Notebook(TextResources.newNotebook));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotebookWidget extends StatelessWidget {
  //! Properties
  static const routeName = DescriptionRoute.detailNotebook;

  //! Life cycle
  @override
  Widget build(BuildContext context) {
    final ArgumentsRoute arguments =
        ModalRoute.of(context).settings.arguments as ArgumentsRoute;

    return Scaffold(
      appBar: AppBar(
        title: const Text("TextResources.appName"),
      ),
      body: NotesListView(arguments.notebook),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add(Notebook(TextResources.newNotebook));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
