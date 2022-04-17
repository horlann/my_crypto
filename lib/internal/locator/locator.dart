import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/data/data_sources/user/remote_user_datasource.dart';
import 'package:my_crypto/data/repositories/user_repo.dart';
import 'package:my_crypto/domain/repositories/user/i_remote_user_repo.dart';
import 'package:my_crypto/internal/locator/locator.config.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> setupLocators(String environment) async {
  final gh = GetItHelper(getIt, environment);
  await $initGetIt(getIt, environment: environment);
  //blocs
  gh.factory<UserBloc>(() => UserBloc(getIt.call(), getIt.call(), getIt.call(), getIt.call()));

  //useCases

  //dataSources
  gh.lazySingleton<IRemoteUserDataSource>(() => RemoteUserDataSource(getIt.call(), getIt.call()));

  //repositories
  gh.lazySingleton<IUserRepository>(() => UserRepository(getIt.call()));

  //external
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
}
