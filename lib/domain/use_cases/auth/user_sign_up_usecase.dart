import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class UserSignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final IUserRepository repository;

  UserSignUpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) {
    return repository.signUp(params.userEntity);
  }
}

class SignUpParams {
  final UserEntity userEntity;

  SignUpParams(this.userEntity);
}
