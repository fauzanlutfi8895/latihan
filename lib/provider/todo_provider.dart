import 'package:flutter/foundation.dart';
import 'package:latihan/services/todo_services.dart';
import '../model/todo.dart';

class TodoProvider extends ChangeNotifier{
  final _services = TodoServices();
  bool isLoading = false;
  List<Todo> _todo = [];
  List<Todo> get todo => _todo;
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _services.getAll();
    _todo = response;

    isLoading = false;
    notifyListeners();
  }
}