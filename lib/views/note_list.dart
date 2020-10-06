import 'package:fesha_note/models/notes.dart';
import 'package:fesha_note/views/note.dart';
import 'package:flutter/material.dart';

import 'note_delete.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final notes = [
    new Notes(
        id: "1",
        title: "TItle",
        subTitle: "sub title",
        published: DateTime.now(),
        updated: DateTime.now()),
    new Notes(
        id: "2",
        title: "TItle",
        subTitle: "sub title",
        published: DateTime.now(),
        updated: DateTime.now()),
    new Notes(
        id: "3",
        title: "TItle",
        subTitle: "sub title",
        published: DateTime.now(),
        updated: DateTime.now())
  ];

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Note()));
        },
        child: Icon(Icons.add),
      ),
      body: new ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.blue,
        ),
        itemCount: notes.length,
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete()
              );
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete, color: Colors.white,), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(notes[index].title),
              subtitle:
                  Text('Last edited on ${formatDate(notes[index].updated)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Note(
                          id: notes[index].id,
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}
