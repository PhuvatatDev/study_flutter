import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/data/datasource/tag_remote_datasource.dart';
import 'package:study_flutter/features/tag/data/model/tag_model.dart';
import 'package:study_flutter/features/tag/entities/tag.dart';
import 'package:study_flutter/features/tag/repositories/tag_repository.dart';

class TagRepositoryImpl implements TagRepository {
  final TagRemoteDataSource remoteDataSource;

  TagRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, Tag>> createTag(Tag tag) async {
    try {
      final tagModel = TagModel.fromEntity(tag);
      final result = await remoteDataSource.createTag(tagModel);
      return Right(result);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to create tag: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, List<Tag>>> getTags() async {
    try {
      final tags = await remoteDataSource.getTags();
      return Right(tags);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to get tags: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, Tag>> getTagWithId(String tagId) async {
    try {
      final tag = await remoteDataSource.getTagById(tagId);
      return Right(tag);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to get tag: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, Tag>> updateTag(Tag tag) async {
    try {
      final tagModel = TagModel.fromEntity(tag);
      final result = await remoteDataSource.updateTag(tagModel);
      return Right(result);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to update tag: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }

  @override
  Future<Either<AppError, void>> deleteTag(Tag tag) async {
    try {
      await remoteDataSource.deleteTag(tag.tagId);
      return const Right(null);
    } catch (e) {
      return Left(AppError(
        message: 'Failed to delete tag: ${e.toString()}',
        type: ErrorType.server,
      ));
    }
  }
}
