import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  final String? text;
  final bool isDone;
  const TodoWidget({Key? key, this.text, required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Icon(isDone ? Icons.check : Icons.close),
            decoration: BoxDecoration(
                color: isDone ? Colors.blue : Colors.red,
                borderRadius: BorderRadius.circular(5)),
          ),
          Text(
            text ?? ("l"),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
              color: isDone ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
