import 'package:dartz/dartz.dart';
import 'package:my_crypto/data/api/db_api/local/app_settings_dao.dart';
import 'package:my_crypto/internal/core/failures.dart';

abstract class IApplicationDataSource {
  Future<Either<Failure, void>> setTheme(String theme);

  Future<Either<Failure, String?>> getCurrentTheme();

  Future<Either<Failure, void>> setIsOnBoardingShown(bool isShown);

  Future<Either<Failure, bool>> isOnBoardingShown();
}

class ApplicationDataSource extends IApplicationDataSource {
  final IAppSettingsDao appSettingsDao;

  ApplicationDataSource(this.appSettingsDao);

  @override
  Future<Either<Failure, String?>> getCurrentTheme() async {
    return Right(appSettingsDao.themeMode);
  }

  @override
  Future<Either<Failure, bool>> isOnBoardingShown() {
    // TODO: implement isOnBoardingShown
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setIsOnBoardingShown(bool isShown) {
    // TODO: implement setIsOnBoardingShown
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setTheme(String theme) async {
    return Right(appSettingsDao.setThemeMode(theme));
  }
}
