// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../services/app_module.dart' as _i6;
import '../../services/firebase.dart' as _i5;
import '../connection_checker.dart' as _i4;
import '../navigation/router.gr.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AppRouter>(appModule.appRouter);
  gh.singleton<_i4.ConnectionChecker>(_i4.ConnectionChecker());
  await gh.factoryAsync<_i5.FirebaseService>(() => appModule.fireService,
      preResolve: true);
  return get;
}

class _$AppModule extends _i6.AppModule {}
