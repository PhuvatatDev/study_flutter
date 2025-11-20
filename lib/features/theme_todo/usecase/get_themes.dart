import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/theme_todo/entities/theme.dart';
import 'package:study_flutter/features/theme_todo/repositories/theme_repository.dart';

class GetThemeUsecase {
  final ThemeRepository themeRepository;

  GetThemeUsecase({required this.themeRepository});

  Future<Either<AppError, List<Theme>>> call() async {
    return themeRepository.getThemes();
  }
}
