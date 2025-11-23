import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/entities/tag.dart';
import 'package:study_flutter/features/tag/repositories/tag_repository.dart';

class UpdateTagUsecase {
  final TagRepository tagRepository;

  UpdateTagUsecase({required this.tagRepository});

  Future<Either<AppError, Tag>> execute(Tag tag) async {
    // Validation: nom non vide, 3-100 caractères (comme create)
    if (tag.name.trim().isEmpty) {
      return Left(AppError(
        type: ErrorType.validation,
        message: "Le tag doit avoir un nom"
      ));
    }

    if (tag.name.trim().length < 3) {
      return Left(AppError(
        type: ErrorType.validation,
        message: "Le nom doit contenir au moins 3 caractères"
      ));
    }

    if (tag.name.length > 100) {
      return Left(AppError(
        type: ErrorType.validation,
        message: "Le nom ne peut pas dépasser 100 caractères"
      ));
    }

    return tagRepository.updateTag(tag);
  }
}
