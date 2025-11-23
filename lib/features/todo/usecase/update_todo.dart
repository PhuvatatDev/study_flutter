import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/entities/todo.dart';
import 'package:study_flutter/features/todo/repositories/todo_repository.dart';

class UpdateTodoUsecase {
  final TodoRepository todoRepository;

  UpdateTodoUsecase({required this.todoRepository});

  Future<Either<AppError, Todo>> edit(Todo todo) async {
    return todoRepository.updateTodo(todo);
  }
}
