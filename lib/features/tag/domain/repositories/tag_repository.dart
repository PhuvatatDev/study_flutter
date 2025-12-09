import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/domain/entities/tag.dart';

abstract class TagRepository {

  // all generic methode CRUD for tag operation.

  // creat methode
  Future<Either<AppError, Tag>> createTag (Tag tag);

  // read methode
  Future<Either<AppError, List<Tag>>> getTags ();

  // get tag with id
  Future<Either<AppError, Tag>> getTagWithId (String tagId);

  // update methode
  Future<Either<AppError, Tag>> updateTag (Tag tag);

  // delete methode
  Future<Either<AppError, void>> deleteTag (Tag tag);
}
