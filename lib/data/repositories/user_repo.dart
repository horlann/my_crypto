import 'package:dartz/dartz.dart';
import 'package:my_crypto/data/data_sources/user/remote_user_datasource.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';

class UserRepository extends IUserRepository {
  final IRemoteUserDataSource dataSource;

  UserRepository(this.dataSource);

  @override
  Future<Either<Failure, UserEntity?>> loadUser() {
    return dataSource.loadUser();
  }

  @override
  Future<Either<Failure, bool>> logout() {
    return dataSource.logout();
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(String email, String password) async {
    return dataSource.signIn(email, password);
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(UserEntity userEntity) async {
    return dataSource.signUp(userEntity);
  }
}
