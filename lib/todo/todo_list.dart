import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/ListTodo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ListToDo>(context, listen: false).fetchAndSetTodo(),
      builder: (ctx, snapshot) =>
      snapshot.connectionState ==
          ConnectionState.waiting
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Consumer<ListToDo>(
          child: Center(child: Image.asset('assets/images/empty.png')),
          builder: (context, todoList, child) =>
          todoList.items.length <= 0
              ? child
              : ListView.builder(
            itemBuilder: (ctx, index) =>
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.amber[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(todoList.items[index].title),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent,),
                          onPressed: ()=> {
                            Provider.of<ListToDo>(context, listen: false)
                                .deleteTodo(todoList.items[index].id),
                            Provider.of<ListToDo>(context, listen: false).fetchAndSetTodo(),
                          }
                      ),
                    ),
                  ),
                ),
            itemCount: todoList.items.length,
          )),
    );
  }
}
