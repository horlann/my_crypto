import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class UserSignOutUseCase extends UseCase<bool, NoParams> {
  final IUserRepository repository;

  UserSignOutUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.logout();
  }
}
