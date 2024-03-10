// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Book {
  final String photo;
  final String title;
  final String writer;
  final String description;
  final List<String> notes;

  Book({
    required this.photo,
    required this.title,
    required this.writer,
    required this.description,
    required this.notes,
  });
}

class BookDetailsPage extends StatefulWidget {
  final Book book;

  // ignore: prefer_const_constructors_in_immutables
  BookDetailsPage({required this.book});

  @override
  // ignore: library_private_types_in_public_api
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  String newNote = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.book.photo,
                  width: 120,
                  height: 180,
                ),
                const SizedBox(height: 16),
                Text(
                  'Writer: ${widget.book.writer}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description: ${widget.book.description}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.book.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.book.notes[index]),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        newNote = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Add a note...',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.book.notes.add(newNote);
                      newNote = '';
                    });
                  },
                  child: const Text('Add Note'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
