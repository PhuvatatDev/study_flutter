import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/tag/domain/entities/tag.dart';
import 'package:study_flutter/features/tag/domain/repositories/tag_repository.dart';

class CreateTagUsecase {
  final TagRepository tagRepository;

  CreateTagUsecase({required this.tagRepository});

  Future<Either<AppError, Tag>> create(Tag tag) async {
    // verifier que le tag a bien un titre
    if (tag.name.trim().isEmpty) {
      return Left(AppError(
          message: "Le tag doit avoir un nom", type: ErrorType.validation));
    }
    // Validation: nom minimum 3 caracteres
    if (tag.name.trim().length < 3) {
      return Left(AppError(
          type: ErrorType.validation,
          message: "Le nom du tag doit contenir au moins 3 caracteres"));
    }
    // Validation: nom maximum 100 caractères
    if (tag.name.length > 100) {
      return Left(AppError(
          type: ErrorType.validation,
          message: "Le nom du tag ne peut pas dépasser 100 caractères"));
    }

    return tagRepository.createTag(tag);
  }
}
