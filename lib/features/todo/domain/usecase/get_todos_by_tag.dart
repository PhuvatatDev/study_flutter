import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/damain/entities/todo.dart';
import 'package:study_flutter/features/todo/damain/repositories/todo_repository.dart';

class GetTodosByTagUseCase {
  final TodoRepository todoRepository;

  GetTodosByTagUseCase({required this.todoRepository});

  Future<Either<AppError, List<Todo>>> call(String tagId) async {
    // 1. Récupérer tous les todos
    final result = await todoRepository.getTodos();

    // 2. Filtrer par tagId
    return result.fold(
      (error) => Left(error), // Propagate l'erreur
      (todos) {
        final filteredTodos = todos
            .where((todo) => todo.tagId == tagId)
            .toList();
        return Right(filteredTodos);
      },
    );
  }
}
