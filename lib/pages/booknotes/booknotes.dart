import 'package:flutter/material.dart';

class BookNotesPage extends StatefulWidget {
  @override
  _BookNotesPageState createState() => _BookNotesPageState();
}

class _BookNotesPageState extends State<BookNotesPage> {
  List<Book> books = [
    Book(
      photo: 'assets/book1.jpg',
      title: 'Book 1',
      writer: 'Author 1',
      description: 'Description 1',
      notes: [],
    ),
    Book(
      photo: 'assets/book2.jpg',
      title: 'Book 2',
      writer: 'Author 2',
      description: 'Description 2',
      notes: [],
    ),
    Book(
      photo: 'assets/book2.jpg',
      title: 'Book 2',
      writer: 'Author 2',
      description: 'Description 2',
      notes: [],
    )
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Notes'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
          childAspectRatio: 0.7,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return buildBookContainer(books[index]);
        },
      ),
    );
  }

  Widget buildBookContainer(Book book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsPage(book: book),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.photo,
              width: 80,
              height: 120,
            ),
            SizedBox(height: 16),
            Text(
              book.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              book.writer,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              book.description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

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

  BookDetailsPage({required this.book});

  @override
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
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.book.photo,
                  width: 120,
                  height: 180,
                ),
                SizedBox(height: 16),
                Text(
                  'Writer: ${widget.book.writer}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Description: ${widget.book.description}',
                  style: TextStyle(fontSize: 16),
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
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        newNote = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Add a note...',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.book.notes.add(newNote);
                      newNote = '';
                    });
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
