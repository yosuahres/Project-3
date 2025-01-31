import 'package:flutter/material.dart';
import '../models/note.dart';
import 'note_detail_screen.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];

  void _addNote() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailScreen(onSave: (note) {
        setState(() {
          notes.add(note);
        });
      })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.blueAccent,
      ),
      body: notes.isEmpty
          ? Center(
              child: Text(
                'No notes yet. Add a new note!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(notes[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(notes[index].content),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}