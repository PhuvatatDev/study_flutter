import 'package:equatable/equatable.dart';


class Todo extends Equatable {
  final String todoId;
  final String content;
  final String? tagId;
  final DateTime? createdAt;
  final DateTime? deadLineAt;
  final bool? isPriority;
  final bool? isDone;

  const Todo(
      {required this.todoId,
      required this.content,
      this.tagId,
      this.createdAt,
      this.deadLineAt,
      this.isPriority,
      this.isDone = false});

  Todo copyWith({
    String? todoId,
    String? content,
    String? tagId,
    DateTime? createdAt,
    DateTime? deadLineAt,
    bool? isPriority,
    bool? isDone,
  }) {
    return Todo(
      todoId: todoId ?? this.todoId,
      content: content ?? this.content,
      tagId: tagId ?? this.tagId,
      createdAt: createdAt ?? this.createdAt,
      deadLineAt: deadLineAt ?? this.deadLineAt,
      isPriority: isPriority ?? this.isPriority,
      isDone: isDone ?? this.isDone,
    );
  }
  @override
  List<Object?> get props =>
      [todoId, content, tagId, createdAt, deadLineAt, isPriority, isDone];
}
