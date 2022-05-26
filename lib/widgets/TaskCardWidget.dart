import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  const TaskCardWidget({Key? key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title ?? ("d"),
                style: GoogleFonts.damion(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                desc ?? ("s"),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            )
          ]),
        ));
  }
}
