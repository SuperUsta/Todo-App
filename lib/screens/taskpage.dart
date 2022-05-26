import 'package:auth/database/database_helper.dart';
import 'package:auth/models/task.dart';
import 'package:auth/widgets/TodoWidget.dart';
import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({Key? key}) : super(key: key);

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: TextField(
                            onSubmitted: (value) {
                              print("Field value: $value");
                              if (value != "") {
                                DatabaseHelper _dbHelper = DatabaseHelper();
                                Task _newTask =
                                    Task(title: value, description: value);
                                print("New Task");
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter your title...",
                                border: InputBorder.none),
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter description for the tast...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 24)),
                    ),
                  ),
                  TodoWidget(
                    text: "Create your fist task",
                    isDone: true,
                  ),
                  TodoWidget(
                    text: "Create your first toto as well",
                    isDone: true,
                  ),
                  TodoWidget(
                    text: "TJust another todo",
                    isDone: false,
                  ),
                  TodoWidget(
                    text: "Todo Widget",
                    isDone: false,
                  )
                ],
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 113, 113),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.delete_forever,
                  ),
                ),
                bottom: 24,
                right: 24,
                width: 60,
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
