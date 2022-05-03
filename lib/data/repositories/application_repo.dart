import 'package:dartz/dartz.dart';
import 'package:my_crypto/data/data_sources/apllication/application_local_ds.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';

class ApplicationRepository extends IApplicationRepository {
  final IApplicationDataSource dataSource;

  ApplicationRepository(this.dataSource);

  @override
  Future<Either<Failure, String?>> getCurrentTheme() async {
    return await dataSource.getCurrentTheme();
  }

  @override
  Future<Either<Failure, bool>> isOnBoardingShown() async {
    return await dataSource.isOnBoardingShown();
  }

  @override
  Future<Either<Failure, void>> setIsOnBoardingShown(bool isShown) async {
    return await dataSource.setIsOnBoardingShown(isShown);
  }

  @override
  Future<Either<Failure, void>> setTheme(String theme) async {
    return await dataSource.setTheme(theme);
  }
}
