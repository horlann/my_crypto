import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/data/api/db_api/local/app_settings_dao.dart';
import 'package:my_crypto/data/data_sources/apllication/application_local_ds.dart';
import 'package:my_crypto/data/data_sources/user/remote_user_datasource.dart';
import 'package:my_crypto/data/repositories/application_repo.dart';
import 'package:my_crypto/data/repositories/user_repo.dart';
import 'package:my_crypto/domain/repositories/i_application_repo.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/locator/locator.config.dart';
import 'package:my_crypto/presentation/blocs/app_starter/app_starter_bloc.dart';
import 'package:my_crypto/presentation/blocs/auth/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> setupLocators(String environment) async {
  final gh = GetItHelper(getIt, environment);
  await $initGetIt(getIt, environment: environment);
  //blocs
  gh.factory<AuthBloc>(() => AuthBloc(getIt.call(), getIt.call(), getIt.call(), getIt.call()));
  gh.factory<AppStarterBloc>(() => AppStarterBloc(getIt.call(), getIt.call()));

  //useCases

  //dataSources
  gh.lazySingleton<IRemoteUserDataSource>(() => RemoteUserDataSource(getIt.call(), getIt.call()));
  gh.lazySingleton<IApplicationDataSource>(() => ApplicationDataSource(getIt.call()));

  //repositories
  gh.lazySingleton<IUserRepository>(() => UserRepository(getIt.call()));
  gh.lazySingleton<IApplicationRepository>(() => ApplicationRepository(getIt.call()));

  //dao
  gh.lazySingleton<IAppSettingsDao>(() => AppSettingsDao(getIt.call()));

  //external
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final shards = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => shards);
}
