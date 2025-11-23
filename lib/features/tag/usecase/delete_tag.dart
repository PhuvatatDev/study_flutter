import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/entities/tag.dart';
import 'package:study_flutter/features/tag/repositories/tag_repository.dart';

class DeleteTagUsecase {
  final TagRepository tagRepository;
  DeleteTagUsecase ({required this.tagRepository});

  Future<Either<AppError, void>> execute (Tag tag)async {
    return tagRepository.deleteTag(tag);
  }
}
