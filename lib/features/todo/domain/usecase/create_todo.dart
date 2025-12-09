import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/damain/entities/todo.dart';
import 'package:study_flutter/features/todo/damain/repositories/todo_repository.dart';

class CreateTodoUsecase {
  final TodoRepository todoRepository;

  CreateTodoUsecase({required this.todoRepository});

  Future<Either<AppError, Todo>> execute(Todo todo) async {
    // 1. Vérifier que le content n'est pas vide
    if (todo.content.trim().isEmpty) {
      return Left(AppError(
          message: "Le contenu du todo ne peut pas être vide",
          type: ErrorType.validation));
    }
    // 2. Valider que deadlineAt n'est pas dans le passé (si présente)
    if (todo.deadLineAt != null && todo.deadLineAt!.isBefore(DateTime.now())) {
      return Left(AppError(
          type: ErrorType.validation,
          message: "Le deadline dois etre apres la date de creation!"));
    }
    // 3. Créer un nouveau todo avec createdAt = maintenant
    final todoWithTimestamp = todo.copyWith(
      createdAt: DateTime.now(),
    );

    // 4. Déléguer la création au repository
    return todoRepository.createTodo(todoWithTimestamp);
  }
}
