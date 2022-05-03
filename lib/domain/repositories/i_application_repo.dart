import 'package:dartz/dartz.dart';
import 'package:my_crypto/internal/core/failures.dart';

abstract class IApplicationRepository {
  const IApplicationRepository();

  Future<Either<Failure, void>> setTheme(String theme);

  Future<Either<Failure, String?>> getCurrentTheme();

  Future<Either<Failure, void>> setIsOnBoardingShown(bool isShown);

  Future<Either<Failure, bool>> isOnBoardingShown();
}
