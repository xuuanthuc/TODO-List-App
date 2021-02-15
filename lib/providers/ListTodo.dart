import 'package:flutter/cupertino.dart';
import 'package:todo_list/helper/db_todo.dart';
import 'package:todo_list/models/todo.dart';

class ListToDo with ChangeNotifier {
  List<ToDo> _items = [];

  List<ToDo> get items {
    return [..._items];
  }

  void addTodo(String title) {
    final newTodo = ToDo(
      id: DateTime.now().toString(),
      title: title,
    );
    _items.add(newTodo);
    notifyListeners();
    DBHelper.insert('todo_list', {
      'id': newTodo.id,
      'title': newTodo.title,
    });
  }

  Future<void> fetchAndSetTodo() async {
    final dataList = await DBHelper.getData('todo_list');
    _items = dataList
        .map(
          (e) => ToDo(
            id: e['id'],
            title: e['title'],
          ),
        ).toList();
    notifyListeners();
  }
  Future<void> deleteTodo(String id) async{
    await DBHelper.delete('todo_list', where: 'id =?', whereArgs:[id]);
    notifyListeners();
    // final delete = await DBHelper.delete('todo_list',_items.remove(id));
  }
}
