import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/damain/entities/todo.dart';
import 'package:study_flutter/features/todo/damain/repositories/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository todoRepository;

  DeleteTodoUseCase({required this.todoRepository});

  Future<Either<AppError, void>> execute(Todo todo) async {
    return todoRepository.deleteTodo(todo);
  }
}
