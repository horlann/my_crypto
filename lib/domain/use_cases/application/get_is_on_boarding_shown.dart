import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class IsOnBoardingShownUseCase extends UseCase<bool, NoParams> {
  final IApplicationRepository repository;

  IsOnBoardingShownUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.isOnBoardingShown();
  }
}
