import 'package:flutter/material.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/main.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:my_crypto/presentation/utils/languages/languages_info.dart';


class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}
final appRouter = getIt<AppRouter>();

class _ApplicationState extends State<Application> {
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
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            );
          }
        ));
  }
}
