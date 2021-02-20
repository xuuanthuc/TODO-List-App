import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/ListTodo.dart';
import 'package:todo_list/todo/todo_list_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: ChangeNotifierProvider(
        create: (ctx) => ListToDo(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hello',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(

              elevation: 0,
              centerTitle: true,

              backgroundColor: Colors.pinkAccent,
              title: Text('TODO List')
            ),
            body: ToDoListContainer(),
          ),
        ),
      ),
    );
  }
}
