import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/todo/domain/entities/todo.dart';
import 'package:study_flutter/features/todo/domain/repositories/todo_repository.dart';
import 'package:study_flutter/features/todo/data/datasource/todo_remote_datasource.dart';
import 'package:study_flutter/features/todo/data/model/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource todoRemoteDatasource;

  TodoRepositoryImpl({required this.todoRemoteDatasource});

  @override
  Future<Either<AppError, Todo>> createTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final result = await todoRemoteDatasource.createTodo(todoModel);
      return Right(result);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to create todo: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, void>> deleteTodo(Todo todo) async {
    try {
      await todoRemoteDatasource.deleteTodo(todo.todoId);
      return const Right(null);
    } catch (e) {
      return Left(AppError(
          message: 'Failed to delete todo: ${e.toString()}',
          type: ErrorType.server));
    }
  }

  @override
  Future<Either<AppError, Todo>> getTodoById(String todoId) async {
    try {
      final result = await todoRemoteDatasource.getTodoById(todoId);
      return Right(result);
    } catch (e) {
      return Left(AppError(
          message: 'Failed to get todo: ${e.toString()}',
          type: ErrorType.server));
    }
  }

  @override
  Future<Either<AppError, List<Todo>>> getTodos() async {
    try {
      final result = await todoRemoteDatasource.getTodos();
      return Right(result);
    } catch (e) {
      return Left(AppError(
        message: 'Faile to get todos: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, Todo>> updateTodo(Todo todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final result = await todoRemoteDatasource.updateTodo(todoModel);
      return Right(result);
    } catch (e) {
      return Left(AppError(
        type: ErrorType.server,
        message: 'Faile to update todo: ${e.toString()}',
      ));
    }
  }
}
