import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/entities/tag.dart';
import 'package:study_flutter/features/tag/repositories/tag_repository.dart';

class GetTagWithIdUsecase {

  final TagRepository tagRepository;

  GetTagWithIdUsecase({required this.tagRepository});

  Future<Either<AppError, Tag>> call(String id) async {
    return tagRepository.getTagWithId(id);
  }
}
