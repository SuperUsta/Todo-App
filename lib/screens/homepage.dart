import 'package:auth/database/database_helper.dart';
import 'package:auth/screens/taskpage.dart';
import 'package:auth/widgets/ScrollBehaviour.dart';
import 'package:auth/widgets/TaskCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 212, 212, 212),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 32),
                      child: Image(
                          image: AssetImage("assets/images/nintendologo.png"))),
                  Expanded(
                    child: FutureBuilder(
                        future: _dbHelper.getTasks(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return ListView.builder(
                              itemCount: snapshot.data.lenght,
                              itemBuilder: (context, index) {
                                return TaskCardWidget(
                                  title: snapshot.data[index].title,
                                );
                              });
                        }),
                  )
                ],
              ),
              Positioned(
                bottom: 20.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Taskpage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 96, 184, 255),
                          Color.fromARGB(255, 1, 124, 224)
                        ], begin: Alignment(0, -1), end: Alignment(0, 1)),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.add),
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
