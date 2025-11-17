import 'package:dartz/dartz.dart';
import 'package:study_flutter/core/error/app_error.dart';
import 'package:study_flutter/features/theme_todo/entities/theme.dart';

abstract class ThemeRepository {

  // all generic methode CRUD for theme operation.

  // creat methode
  Future<Either<AppError, void>> createTheme (Theme theme);

  // read methode 
  Future<Either<AppError, List<Theme>>> getThemes ();

  // get theme with id 
  Future<Either<AppError, Theme>> getThemeWithId (String themeId);

  // update methode
  Future<Either<AppError, void>> updateTheme (Theme theme);

  // delete methode
  Future<Either<AppError, void>> deleteTheme (Theme theme);
}

