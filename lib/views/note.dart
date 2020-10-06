import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String id;

  bool get isEditing => id == null;

  Note({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Add Note' : 'Edit Note'),
      ),
      body: new Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Note title',
            ),
          ),
          Container(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Note content',
            ),
          ),
          Container(
            height: 10,
          ),
          RaisedButton(
            child: Text(isEditing ? 'create' : 'update'),
            onPressed: () {
              if (isEditing) {
                //create
              } else {
                //update
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
