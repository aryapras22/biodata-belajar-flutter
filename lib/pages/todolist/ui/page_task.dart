import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/element.dart';
import './page_detail.dart';
import './'

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  int index = 1;
  List<Map<String, dynamic>> taskLists = [
    {
      "name": "Shopping",
      "tasks": [
        {"name": "Buy milk", "isDone": false},
        {"name": "Buy bread", "isDone": true},
        {"name": "Buy eggs", "isDone": false}
      ],
      "color": Colors.blue.value
    },
    {
      "name": "Work",
      "tasks": [
        {"name": "Write report", "isDone": false},
        {"name": "Prepare presentation", "isDone": false},
      ],
      "color": Colors.green.value
    },
    // Add more task lists as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _getToolbar(context),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Task',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Lists',
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _addTaskPressed,
                        iconSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text('Add List',
                          style: TextStyle(color: Colors.black45)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Container(
              height: 360.0,
              padding: EdgeInsets.only(bottom: 25.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: taskLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTaskListCard(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Widget _buildTaskListCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => DetailPage(
              currentList: taskLists[index],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.50,
                    1.00,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Interval(
                      0.00,
                      0.50,
                      curve: Curves.linear,
                    ),
                  ),
                ),
                child: child,
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        color: Color(taskLists[index]["color"]),
        child: Container(
          width: 220.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Container(
                  child: Text(
                    taskLists[index]["name"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 50.0),
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 5.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 220.0,
                      child: ListView.builder(
                        itemCount: taskLists[index]["tasks"].length,
                        itemBuilder: (BuildContext ctxt, int i) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                taskLists[index]["tasks"][i]["isDone"]
                                    ? FontAwesomeIcons.checkCircle
                                    : FontAwesomeIcons.circle,
                                color: taskLists[index]["tasks"][i]["isDone"]
                                    ? Colors.white70
                                    : Colors.white,
                                size: 14.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                              ),
                              Flexible(
                                child: Text(
                                  taskLists[index]["tasks"][i]["name"],
                                  style: taskLists[index]["tasks"][i]["isDone"]
                                      ? TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.white70,
                                          fontSize: 17.0,
                                        )
                                      : TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                        ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTaskPressed() async {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => NewTaskPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: Tween<double>(
            begin: 1.5,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.50,
                1.00,
                curve: Curves.linear,
              ),
            ),
          ),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Padding _getToolbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            image: AssetImage('assets/list.png'),
          ),
        ],
      ),
    );
  }
}
