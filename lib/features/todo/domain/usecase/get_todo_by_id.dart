import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/damain/entities/todo.dart';
import 'package:study_flutter/features/todo/damain/repositories/todo_repository.dart';

  class GetTodoById {
    final TodoRepository todoRepository;

    GetTodoById({required this.todoRepository});

    Future<Either<AppError, Todo>> call(String todoId) async {
      final result = await todoRepository.getTodos();

      return result.fold(
        (error) => Left(error),
        (todos) {
          final filteredTodo = todos.where((t) => t.todoId == todoId).firstOrNull;

          if (filteredTodo == null) {
            return Left(AppError(
              message: "Todo avec l'ID $todoId non trouvé",
              type: ErrorType.notFound,
            ));
          }

          return Right(filteredTodo);
        },
      );
    }
  }