import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

@lazySingleton
class UserSignInUseCase extends UseCase<UserEntity, SignInParams> {
  final IUserRepository repository;

  UserSignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    return await repository.signIn(params.email, params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams(this.email, this.password);
}
