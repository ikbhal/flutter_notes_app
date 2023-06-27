import 'package:flutter/material.dart';
import 'note.dart';
import 'note_details_screen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            onTap: () {
              _navigateToNoteDetailsScreen(index);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteNoteDialog(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNoteDetailsScreen(-1);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToNoteDetailsScreen(int noteIndex) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailsScreen(noteIndex: noteIndex)),
    );

    if (result != null && noteIndex == -1) {
      setState(() {
        notes.add(result);
      });
    } else if (result != null && noteIndex >= 0) {
      setState(() {
        notes[noteIndex] = result;
      });
    }
  }

  void _deleteNoteDialog(int noteIndex) {
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
                setState(() {
                  notes.removeAt(noteIndex);
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
