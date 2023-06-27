import 'package:flutter/material.dart';
import 'add_note_screen.dart';
import 'note_list_screen.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteListScreen(),
      routes: {
        '/addNote': (context) => AddNoteScreen(),
      },
    );
  }
}
