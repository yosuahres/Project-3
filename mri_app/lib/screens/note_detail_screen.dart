import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteDetailScreen extends StatefulWidget {
  final Function(Note) onSave;

  NoteDetailScreen({required this.onSave});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() {
    final note = Note(
      title: _titleController.text,
      content: _contentController.text,
    );
    widget.onSave(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {-
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note', style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}