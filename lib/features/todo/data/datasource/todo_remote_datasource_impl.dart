import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:study_flutter/features/todo/data/datasource/todo_remote_datasource.dart';
import 'package:study_flutter/features/todo/data/model/todo_model.dart';

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  final FirebaseFirestore firestore;

  TodoRemoteDatasourceImpl({required this.firestore});

  @override
  Future<TodoModel> createTodo(TodoModel todo) async {
    final docRef = firestore.collection('todos').doc();
    final todoWithId = TodoModel(
      todoId: docRef.id,
      content: todo.content,
      tagId: todo.tagId,
      createdAt: todo.createdAt,
      deadLineAt: todo.deadLineAt,
      isDone: todo.isDone,
      isPriority: todo.isPriority,
    );

    await docRef.set(todoWithId.toJson());
    return todoWithId;
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final snapshot = await firestore.collection('todos').get();
    return snapshot.docs.map((doc) => TodoModel.fromJson(doc.data())).toList();
  }

  @override
  Future<TodoModel> getTodoById(String id) async {
    final doc = await firestore.collection('todos').doc(id).get();
    if (!doc.exists) {
      throw Exception('Todo not found');
    }
    return TodoModel.fromJson(doc.data()!);
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todo) async {
    await firestore.collection('todos').doc(todo.todoId).update(todo.toJson());
    return todo;
  }

  @override
  Future<void> deleteTodo(String id) async {
    await firestore.collection('todos').doc(id).delete();
  }
}
