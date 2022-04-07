import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators(Environment.dev);
  await easy_local.EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Application());
}
