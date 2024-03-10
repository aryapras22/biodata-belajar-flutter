import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './ui/page_task.dart';

class ToDoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<ToDoList>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  final List<Widget> _children = [
    TaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.deepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarCheck),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.sliders),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
