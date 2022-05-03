import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/utils/languages/languages_info.dart';

late Logger logger;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await easy_local.EasyLocalization.ensureInitialized();
  _initLogger();
  await setupLocators(Environment.dev);

  runApp(
    EasyLocalization(
        supportedLocales: LangArraysInfo.getTranslateList(), path: 'assets/langList', child: const Application()),
  );
}

void _initLogger() {
  logger = Logger(
      printer: PrettyPrinter(
    methodCount: 1,
  ));
}
