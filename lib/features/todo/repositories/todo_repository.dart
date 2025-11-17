
import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/entities/todo.dart';

abstract class TodoRepository {
  // creat une todo 
  Future<Either<AppError, void>> createTodo (Todo todo);
   
  // recuperer tout les todo 
  Future<Either<AppError, List<Todo>>> getTodos ();

  // recuperer une todo par son ID.
  Future<Either<AppError, Todo>> getTodoById (String todoId);

  // update le todo 
  Future<Either<AppError, void>> updateTodo (Todo todo);

  // Supprimer une todo 
  Future<Either<AppError, void>> deleteTodo (Todo todo); 
}