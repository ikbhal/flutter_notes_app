import 'package:flutter/material.dart';
// import 'package:note.dart';
import 'note.dart';

class NoteDetailsScreen extends StatefulWidget {
  final int noteIndex;

  const NoteDetailsScreen({Key? key, required this.noteIndex}) : super(key: key);

  @override
  _NoteDetailsScreenState createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.noteIndex >= 0) {
      final note = ModalRoute.of(context)?.settings.arguments as Note?;
      _titleController.text = note?.title ?? '';
      _contentController.text = note?.content ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteIndex >= 0 ? 'Edit Note' : 'Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _contentController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final note = Note(
                  title: _titleController.text.trim(),
                  content: _contentController.text.trim(),
                );
                Navigator.pop(context, note);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
