import 'package:flutter/material.dart';
import 'package:everpobre/route/arguments_route.dart';
import 'package:everpobre/route/description_route.dart';
import 'package:everpobre/text_resources.dart';

class NoteWidget extends StatefulWidget {
  //! Properties
  static const routeName = DescriptionRoute.detailNote;

  //! State (el pringao)
  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  //! Properties
  TextEditingController bodyTestController = TextEditingController();

  //! Life cycle
  @override
  void dispose() {
    bodyTestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ArgumentsRoute arguments =
        ModalRoute.of(context).settings.arguments as ArgumentsRoute;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.note.body),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: TextResources.body),
                controller: bodyTestController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: Colors.grey,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(TextResources.cancel),
                  ),
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      arguments.note.body = bodyTestController.text;
                      Navigator.pop(context);
                    },
                    child: Text(TextResources.ok),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
