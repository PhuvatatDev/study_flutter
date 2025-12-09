import 'package:study_flutter/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel(
      {required super.content,
      required super.todoId,
      super.tagId,
      super.createdAt,
      super.deadLineAt,
      super.isDone,
      super.isPriority});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      content: json['content'],
      todoId: json['todoId'],
      tagId: json['tagId'],
      createdAt: json['createdAt'],
      deadLineAt: json['deadLineAt'],
      isDone: json['isDone'],
      isPriority: json['isPriority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'todoId': todoId,
      'tagId': tagId,
      'createdAt': createdAt,
      'deadLineAt': deadLineAt,
      'isDone': isDone,
      'isPriority': isPriority
    };
  }

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
        content: todo.content,
        todoId: todo.todoId,
        tagId: todo.tagId,
        createdAt: todo.createdAt,
        deadLineAt: todo.deadLineAt,
        isDone: todo.isDone,
        isPriority: todo.isPriority);
  }
}
