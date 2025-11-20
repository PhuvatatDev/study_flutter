import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/theme_todo/entities/theme.dart';
import 'package:study_flutter/features/theme_todo/repositories/theme_repository.dart';

class CreateThemeUsecase {
  final ThemeRepository themeRepository;

  CreateThemeUsecase({required this.themeRepository});

  Future<Either<AppError, void>> create(Theme theme) async {
    // verifier que le theme a bien un titre
    if (theme.name.trim().isEmpty) {
      return Left(AppError(
          message: "Le theme dois avoire un nom", type: ErrorType.validation));
    }
    // Vlidation: nom minimum 3 caracteres
    if (theme.name.trim().length < 3) {
      return Left(AppError(
          type: ErrorType.validation,
          message: "Le nom du theme doit contenir au moins 3 caracteres"));
    }
    // Validation: nom maximum 100 caractères
    if (theme.name.length > 100) {
      return Left(AppError(
          type: ErrorType.validation,
          message: "Le nom du thème ne peut pas dépasser 100 caractères"));
    }

    return themeRepository.createTheme(theme);
  }
}
