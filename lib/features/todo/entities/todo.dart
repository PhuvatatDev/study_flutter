import 'package:equatable/equatable.dart';


class Todo extends Equatable {
  final String todoId;
  final String content;
  final String? themeId;
  final DateTime? createdAt;
  final DateTime? deadLineAt;
  final bool? isPriority;
  final bool? isDone;

  const Todo(
      {required this.todoId,
      required this.content,
      this.themeId,
      this.createdAt,
      this.deadLineAt,
      this.isPriority,
      this.isDone = false});

  Todo copyWith({
    String? todoId,
    String? content,
    String? themeId,
    DateTime? createdAt,
    DateTime? deadLineAt,
    bool? isPriority,
    bool? isDone,
  }) {
    return Todo(
      todoId: todoId ?? this.todoId,
      content: content ?? this.content,
      themeId: themeId ?? this.themeId,
      createdAt: createdAt ?? this.createdAt,
      deadLineAt: deadLineAt ?? this.deadLineAt,
      isPriority: isPriority ?? this.isPriority,
      isDone: isDone ?? this.isDone,
    );
  }
  @override
  List<Object?> get props =>
      [todoId, content, themeId, createdAt, deadLineAt, isPriority, isDone];
}
