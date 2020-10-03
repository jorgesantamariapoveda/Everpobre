import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

/*
class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeData.light().copyWith, hace una copia y sobre ella hago
    // las modificaciones que quiera
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TextResources.appName),
        ),
        body: NotesListView(model),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.add(Note("Una nueva nota"));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
*/
class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeData.light().copyWith, hace una copia y sobre ella hago
    // las modificaciones que quiera
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TextResources.appName),
        ),
        body: NotebooksListView(model),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("gila");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
