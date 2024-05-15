import 'package:daily_execises/constant.dart';
import 'package:daily_execises/model/todo.dart';
import 'package:daily_execises/widgets/to_do_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todosList = ToDo.todoList();
  final _todoContoller = TextEditingController();
  
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todosList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> result = [];
    if (enteredKeyword.isEmpty) {
      result = todosList;
    } else {
      result = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = result;
    });
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDOitem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoContoller.clear();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _builappbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchedBox(
                 onChanged: _runFilter,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        TodoListComp(
                          todo: todoo,
                          onToDochanged: _handleToDoChange,
                          onDeleteItem: _deleteToDOitem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      
                      controller: _todoContoller,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoContoller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _builappbar() {
    return AppBar(
      backgroundColor: tdBGColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/profile_men.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class searchedBox extends StatelessWidget {
   final Function(String) onChanged;

  const searchedBox({
    super.key,
    required this.onChanged,
  });

  // const searchedBox({
  //   super.key,
  // });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}
