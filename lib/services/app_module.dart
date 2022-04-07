import 'package:injectable/injectable.dart';
import 'package:my_crypto/services/firebase.dart';

import '../internal/navigation/router.gr.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();

  @singleton
  AppRouter get appRouter => AppRouter();


}