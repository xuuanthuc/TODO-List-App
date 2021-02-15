import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/ListTodo.dart';

class TodoHeader extends StatefulWidget {
  @override
  _TodoHeaderState createState() => _TodoHeaderState();
}

class _TodoHeaderState extends State<TodoHeader> {
  void _addTodo() {
    if (_txtToDoController.text.isEmpty) {
      return;
    }
    Provider.of<ListToDo>(context, listen: false)
        .addTodo(_txtToDoController.text);
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _txtToDoController.text = '';
    });
  }

  final _txtToDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _txtToDoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(15) ),
              labelText: 'Add TODO',
              hintText: 'Add TODO',
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(15)
          ),

          height: 60,
          width: 60,
          child: IconButton(
            onPressed: _addTodo,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
