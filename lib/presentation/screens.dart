import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_event.dart';
import 'package:my_crypto/presentation/screens/splash_screen.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_event.dart';

class ScreenSelector extends StatefulWidget {
  const ScreenSelector({Key? key}) : super(key: key);

  @override
  State<ScreenSelector> createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset('assets/logo.png').image, context);
    return BlocProvider(
        create: (BuildContext context) => ThemesBloc()..add(const ThemeInitEvent()),
        child: BlocProvider(
          lazy: false,
          create: (BuildContext context) => getIt<UserBloc>()..add(InitUserEvent()),
          child: Builder(builder: (context) {
            return AutoRouter(
              placeholder: (BuildContext context) {
                return const SplashScreen();
              },
            );
          }),
        ));
  }
}
