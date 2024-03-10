import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addbooks.dart';

class BookNotesPage extends StatefulWidget {
  @override
  _BookNotesPageState createState() => _BookNotesPageState();
}

class _BookNotesPageState extends State<BookNotesPage> {
  List<Book> books = [
    Book(
      photo: 'assets/bookcovers/thestranger.jpg',
      title: 'The Stranger',
      writer: 'Albert Camus',
      description:
          'The novel tells the story of Meursault, a detached and indifferent Algerian man who experiences life in a manner that is considered unconventional by society. Meursaults indifference and his actions, particularly towards his relationships and the events that unfold, challenge societal norms and conventions, leading to profound philosophical reflections on the absurdity of existence and the nature of human morality',
      notes: [],
    ),
    Book(
      photo: 'assets/bookcovers/republic.jpg',
      title: 'Republic',
      writer: 'Plato',
      description:
          '"Republic" is a philosophical dialogue where Socrates engages in discussions with various interlocutors to explore the concept of justice, the ideal state, and the nature of the soul. The dialogue delves into various themes such as the nature of reality, the role of education in society, and the idea of the philosopher-king. Through intricate arguments and thought experiments, Plato presents his vision of an ideal society governed by reason and justice.',
      notes: [],
    ),
    Book(
      photo: 'assets/bookcovers/thinkingfastandslow.jpg',
      title: 'Thinking, Fast and Slow',
      writer: 'Daniel Kahneman',
      description:
          'In this groundbreaking book, Nobel laureate Daniel Kahneman explores the two systems of thinking that drive the way humans make decisions: System 1, which is fast, intuitive, and emotional, and System 2, which is slow, deliberate, and rational. Kahneman discusses various cognitive biases and heuristics that affect decision-making, shedding light on why people often make irrational choices. Through engaging examples and psychological experiments, the book offers insights into how we can make better decisions by understanding the workings of our minds.',
      notes: [],
    ),
    Book(
      photo: 'assets/bookcovers/idiot.jpg',
      title: 'The Idiot',
      writer: 'Fyndor Dotosvsky',
      description:
          'The novel follows Prince Myshkin, a compassionate and innocent man who returns to Russia after being treated for epilepsy in Switzerland. Myshkins purity and naivety contrast sharply with the corrupt and cynical society around him. As he navigates the complexities of human relationships and societal norms, Myshkins interactions with various characters lead to tragic consequences. Dostoevsky explores themes of innocence, morality, and the nature of goodness in a world filled with moral ambiguity and suffering.',
      notes: [],
    )
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Provide the custom theme data to this page
      data: ThemeData(
        primaryColor: Theme.of(context).primaryColor,
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // You can access other theme properties similarly
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Notes'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            childAspectRatio: 0.7,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return buildBookContainer(context, books[index]);
          },
        ),
      ),
    );
  }

  Widget buildBookContainer(BuildContext context, Book book) {
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                book.photo,
                width: 80,
                height: 120,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: bookHeading(), // Use theme here
            ),
            const SizedBox(height: 8),
            Text(
              book.writer,
              style: bookHeading(), // Use theme here
            ),
          ],
        ),
      ),
    );
  }

  TextStyle bookHeading() {
    return TextStyle(
        fontSize: 15,
        fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
        fontWeight: FontWeight.bold);
  }
}
