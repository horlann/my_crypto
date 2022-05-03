import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class ApplicationThemeUseCase extends UseCase<String?, NoParams> {
  final IApplicationRepository repository;

  ApplicationThemeUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return repository.getCurrentTheme();
  }
}
