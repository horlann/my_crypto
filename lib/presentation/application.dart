import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/utils/languages/languages_info.dart';

class Application extends StatelessWidget {
  static final appRouter = getIt<AppRouter>();

  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return easy_local.EasyLocalization(
        supportedLocales: LangArraysInfo.getTranslateList(),
        path: 'assets/langList',
        child: Builder(builder: (context) {
          return MaterialApp.router(
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            color: Colors.green,
            builder: (context, router) => router!,
          );
        }));
  }
}