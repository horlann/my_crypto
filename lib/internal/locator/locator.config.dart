// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/api/db_api/local/shards_dao.dart' as _i11;
import '../../domain/repositories/i_application_repo.dart' as _i5;
import '../../domain/repositories/user/i_remote_user_repo.dart' as _i9;
import '../../domain/use_cases/application/get_is_on_boarding_shown.dart' as _i10;
import '../../domain/use_cases/application/get_theme_usecase.dart' as _i4;
import '../../domain/use_cases/application/set_is_on_boarding_shown.dart' as _i14;
import '../../domain/use_cases/application/update_theme_usecase.dart' as _i13;
import '../../domain/use_cases/user/get_current_user_usecase.dart' as _i8;
import '../../domain/use_cases/user/user_sign_in_usecase.dart' as _i15;
import '../../domain/use_cases/user/user_sign_out_usecase.dart' as _i16;
import '../../domain/use_cases/user/user_sign_up_usecase.dart' as _i17;
import '../../services/app_module.dart' as _i18;
import '../../services/firebase.dart' as _i7;
import '../connection_checker.dart' as _i6;
import '../navigation/router.gr.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AppRouter>(appModule.appRouter);
  gh.lazySingleton<_i4.ApplicationThemeUseCase>(() => _i4.ApplicationThemeUseCase(get<_i5.IApplicationRepository>()));
  gh.singleton<_i6.ConnectionChecker>(_i6.ConnectionChecker());
  await gh.factoryAsync<_i7.FirebaseService>(() => appModule.fireService, preResolve: true);
  gh.lazySingleton<_i8.GetCurrentUserUseCase>(() => _i8.GetCurrentUserUseCase(get<_i9.IUserRepository>()));
  gh.lazySingleton<_i10.IsOnBoardingShownUseCase>(
      () => _i10.IsOnBoardingShownUseCase(get<_i5.IApplicationRepository>()));
  gh.factory<_i11.SharedPreferencesDao>(() => _i11.SharedPreferencesDao(get<_i12.SharedPreferences>()));
  gh.lazySingleton<_i13.UpdateApplicationThemeUseCase>(
      () => _i13.UpdateApplicationThemeUseCase(get<_i5.IApplicationRepository>()));
  gh.lazySingleton<_i14.UpdateOnBoardingStatusUseCase>(
      () => _i14.UpdateOnBoardingStatusUseCase(get<_i5.IApplicationRepository>()));
  gh.lazySingleton<_i15.UserSignInUseCase>(() => _i15.UserSignInUseCase(get<_i9.IUserRepository>()));
  gh.lazySingleton<_i16.UserSignOutUseCase>(() => _i16.UserSignOutUseCase(get<_i9.IUserRepository>()));
  gh.lazySingleton<_i17.UserSignUpUseCase>(() => _i17.UserSignUpUseCase(get<_i9.IUserRepository>()));
  return get;
}

class _$AppModule extends _i18.AppModule {}
