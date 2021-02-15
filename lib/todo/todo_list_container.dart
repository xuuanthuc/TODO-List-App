import 'package:flutter/material.dart';
import 'package:todo_list/todo/todo_header.dart';
import 'package:todo_list/todo/todo_list.dart';
class ToDoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TodoHeader(),
              )),
          Expanded(
              child: TodoList(),
          ),
        ],
      ),
    );
  }
}