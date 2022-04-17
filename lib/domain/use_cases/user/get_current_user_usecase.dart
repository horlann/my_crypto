import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class GetCurrentUserUseCase extends UseCase<UserEntity?, NoParams> {
  final IUserRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) {
    return repository.loadUser();
  }
}
