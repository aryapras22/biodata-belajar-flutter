import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas1_187221026',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 255, 1),
          useMaterial3: true,
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // late final TextEditingController _kritikSaran;
  // late final TextEditingController _email;

  // @override
  // void initState() {
  //   _kritikSaran = TextEditingController();
  //   _email = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _kritikSaran.dispose();
  //   _email.dispose();
  //   super.dispose();
  // }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
              bottom: const TabBar(tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.account_circle_rounded),
                ),
                Tab(
                  icon: Icon(Icons.nature_people),
                )
              ])),
          body: TabBarView(children: <Widget>[
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              children: const <Widget>[
                Center(
                  child: Column(
                    children: [
                      Text("Arya Prasetya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      ClipOval(
                          child: Image(
                        image: AssetImage('assets/profile_pict.png'),
                        height: 150,
                        width: 150,
                      ))
                    ],
                  ),
                ),
                Text(
                  "Biograpy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                    "Hi, I'm a second-year Information Systems student at Airlangga University. Skilled in team communication, leadership, and problem-solving, I'm driven by a passion for continuous growth. Open to new experiences, I'm eager to contribute and learn. Let's connect and discuss how I can bring value to your team or project"),
                Text(
                  "Education",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListTile(
                  leading: Icon(Icons.auto_awesome_rounded),
                  title: Text("Airlangga University"),
                  subtitle: Text("Information System Undergraduate"),
                  trailing: SizedBox(
                    child: Text("GPA 3.75/4.00"),
                  ),
                ),
                Text(
                  "Organizational Experience",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListTile(
                    leading: Text(
                      "Dec 2023 — Present",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "  Chairman of HIMSI UNAIR",
                      style: TextStyle(fontSize: 13),
                    )),
                ListTile(
                    leading: Text(
                      "Dec 2022 — Nov 2023",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Organizational Supervisory Board HIMSI UNAIR",
                      style: TextStyle(fontSize: 13),
                    )),
                ListTile(
                    leading: Text(
                      "Apr 2023 — Aug 2023",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Event Staff Pendekar FST Universitas Airlangga",
                      style: TextStyle(fontSize: 13),
                    )),
                ListTile(
                    leading: Text(
                      "Feb 2023 — Mar 2023",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Liaison OfficerGet to Know Airlangga 2.0",
                      style: TextStyle(fontSize: 13),
                    )),
                Text(
                  "Achivement",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListTile(
                    leading: Text(
                      "Nov 2022",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "Finalist Komescom 2022",
                      style: TextStyle(fontSize: 13),
                    )),
                ListTile(
                    leading: Text(
                      "May 2023",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "3rd Place at Jogja Information Technology Sessions UGM",
                      style: TextStyle(fontSize: 13),
                    )),
                Text("Favorite Painting",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Image(
                    image:
                        NetworkImage("https://mdl.artvee.com/ft/102430ab.jpg"))
              ],
            ),
            // ListView(
            //   children: [
            //     Container(
            //       alignment: Alignment.topLeft,
            //       color: const Color.fromARGB(255, 176, 80, 80),
            //       height: 200,
            //       width: 400,
            //       margin: const EdgeInsets.all(20),
            //       padding: const EdgeInsets.only(top: 20),
            //       transform: Matrix4.rotationX(0.5),
            //       child: const Column(
            //         children: [Text("HTML & CSS"), Text("React & Angular")],
            //       ),
            //     )
            //   ],
            // ),
            // ListView(
            //   children: [
            //     const Center(
            //         child: Column(
            //       children: [
            //         Text("Kirim kritik dan saran!"),
            //         TextField(
            //           decoration: InputDecoration(
            //               hintText: 'Masukan Kritik dan Saran',
            //               border: OutlineInputBorder()),
            //           cursorHeight: BorderSide.strokeAlignInside,
            //         ),
            //         Text("Email Anda :"),
            //         TextField(
            //           // controller: _email,
            //           decoration: InputDecoration(
            //               hintText: 'Email', border: OutlineInputBorder()),
            //           cursorHeight: BorderSide.strokeAlignInside,
            //         ),
            //         // TextButton(
            //         //   onPressed: () {},
            //         // )
            //       ],
            //     ))
            //   ],
            // )
            const Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Kritik dan Saran"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Email"),
                )
              ],
            )
          ]),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Text("Argh"),
                )
              ],
            ),
          )),
    );
  }
}
