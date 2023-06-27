import 'package:flutter/material.dart';
import 'add_note_screen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: NoteList(notes: notes),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.pushNamed(context, '/addNote');
          if (newNote != null) {
            setState(() {
              notes.add(newNote as String);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  final List<String> notes;

  const NoteList({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index]),
          onTap: () {
            // TODO: Open the screen to edit the note
          },
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // TODO: Delete the note from Firebase
              _deleteNote(context, index);
            },
          ),
        );
      },
    );
  }


  void _deleteNote(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Delete the note
                setState(() {
                  notes.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


