  import 'package:dartz/dartz.dart';
  import 'package:study_flutter/core/error/app_error.dart';
  import 'package:study_flutter/features/todo/entities/todo.dart';
  import 'package:study_flutter/features/todo/repositories/todo_repository.dart';

  class GetTodosByThemeUseCase {
    final TodoRepository todoRepository;

    GetTodosByThemeUseCase({required this.todoRepository});

    Future<Either<AppError, List<Todo>>> call(String themeId) async {
      // 1. Récupérer tous les todos
      final result = await todoRepository.getTodos();

      // 2. Filtrer par themeId
      return result.fold(
        (error) => Left(error), // Propagate l'erreur
        (todos) {
          final filteredTodos = todos
              .where((todo) => todo.themeId == themeId)
              .toList();
          return Right(filteredTodos);
        },
      );
    }
  }

  