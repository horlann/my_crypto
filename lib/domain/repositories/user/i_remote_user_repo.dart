import 'package:dartz/dartz.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/internal/core/failures.dart';

abstract class IUserRepository {
  const IUserRepository();

  Future<Either<Failure, UserEntity?>> loadUser();

  Future<Either<Failure, UserEntity>> signUp(UserEntity userEntity);

  Future<Either<Failure, UserEntity>> signIn(String email, String password);

  Future<Either<Failure, bool>> logout();
}
