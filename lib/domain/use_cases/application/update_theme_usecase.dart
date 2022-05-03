import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class UpdateApplicationThemeUseCase extends UseCase<void, UpdateApplicationThemeParams> {
  final IApplicationRepository repository;

  UpdateApplicationThemeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateApplicationThemeParams params) {
    return repository.setTheme(params.theme);
  }
}

class UpdateApplicationThemeParams {
  final String theme;

  UpdateApplicationThemeParams(this.theme);
}
