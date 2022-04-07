import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/internal/locator/locator.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> setupLocators(String environment) async =>await $initGetIt(getIt,environment:environment );
