import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
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
      home: Scaffold(
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
      ),
    );
  }
}
