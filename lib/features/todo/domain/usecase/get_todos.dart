
import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/domain/entities/todo.dart';
import 'package:study_flutter/features/todo/domain/repositories/todo_repository.dart';

class GetTodosusecase {
  final TodoRepository todoRepository;
  GetTodosusecase({required this.todoRepository});

  Future<Either<AppError, List<Todo>>> call() async{
    return todoRepository.getTodos();
  }
}