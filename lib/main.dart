import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/presentation/application.dart';

late Logger logger;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initLogger();
  setupLocators(Environment.dev);
  await easy_local.EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Application());
}

void _initLogger() {
  logger = Logger(
      printer: PrettyPrinter(
    methodCount: 1,
  ));
}
