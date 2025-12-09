import 'package:study_flutter/features/todo/data/model/todo_model.dart';

abstract class TodoRemoteDatasource {

  Future<TodoModel> createTodo(TodoModel todo);

  Future<List<TodoModel>> getTodos();

  Future<TodoModel> getTodoById(String id);

  Future<void> deleteTodo(String id);
  
  Future<TodoModel> updateTodo(TodoModel todo);
}
