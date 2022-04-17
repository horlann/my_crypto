// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repositories/user/i_remote_user_repo.dart' as _i7;
import '../../domain/use_cases/user/get_current_user_usecase.dart' as _i6;
import '../../domain/use_cases/user/user_sign_in_usecase.dart' as _i8;
import '../../domain/use_cases/user/user_sign_out_usecase.dart' as _i9;
import '../../domain/use_cases/user/user_sign_up_usecase.dart' as _i10;
import '../../services/app_module.dart' as _i11;
import '../../services/firebase.dart' as _i5;
import '../connection_checker.dart' as _i4;
import '../navigation/router.gr.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AppRouter>(appModule.appRouter);
  gh.singleton<_i4.ConnectionChecker>(_i4.ConnectionChecker());
  await gh.factoryAsync<_i5.FirebaseService>(() => appModule.fireService, preResolve: true);
  gh.lazySingleton<_i6.GetCurrentUserUseCase>(() => _i6.GetCurrentUserUseCase(get<_i7.IUserRepository>()));
  gh.lazySingleton<_i8.UserSignInUseCase>(() => _i8.UserSignInUseCase(get<_i7.IUserRepository>()));
  gh.lazySingleton<_i9.UserSignOutUseCase>(() => _i9.UserSignOutUseCase(get<_i7.IUserRepository>()));
  gh.lazySingleton<_i10.UserSignUpUseCase>(() => _i10.UserSignUpUseCase(get<_i7.IUserRepository>()));
  return get;
}

class _$AppModule extends _i11.AppModule {}
