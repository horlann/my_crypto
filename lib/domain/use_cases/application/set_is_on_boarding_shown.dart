import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class UpdateOnBoardingStatusUseCase extends UseCase<void, UpdateOnBoardingStatusParams> {
  final IApplicationRepository repository;

  UpdateOnBoardingStatusUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateOnBoardingStatusParams params) {
    return repository.setIsOnBoardingShown(params.isShown);
  }
}

class UpdateOnBoardingStatusParams {
  final bool isShown;

  UpdateOnBoardingStatusParams(this.isShown);
}
