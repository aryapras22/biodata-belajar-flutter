import 'package:flutter/material.dart';
import '../bio_kucing.dart';
import './feedbacksection.dart';
import './profilesection.dart';

class Homepage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.account_circle_rounded),
              ),
              Tab(
                icon: Icon(Icons.nature_people),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ProfileSection(),
            FeedbackSection(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.pets), // Customize icon
                title: Text('Bio Kucing'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BioKucingPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list), // Customize icon
                title: Text('To-Do List'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ()),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
