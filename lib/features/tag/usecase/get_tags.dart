import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/entities/tag.dart';
import 'package:study_flutter/features/tag/repositories/tag_repository.dart';

class GetTagsUsecase {
  final TagRepository tagRepository;

  GetTagsUsecase({required this.tagRepository});

  Future<Either<AppError, List<Tag>>> call() async {
    return tagRepository.getTags();
  }
}
