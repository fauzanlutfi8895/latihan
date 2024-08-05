import 'package:flutter/material.dart';
import 'package:latihan/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar API Call", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child){
        if(value.isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final todos = value.todo;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index){
              final todo = todos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                      todo.id.toString()
                  ),
                ),
                title: Text(todo.title, style: TextStyle(color: todo.completed ? Colors.grey : Colors.black)),
              );
            });
      }),
    );
  }
}
