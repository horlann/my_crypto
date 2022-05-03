import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/presentation/blocs/app_starter/app_starter_bloc.dart';
import 'package:my_crypto/presentation/blocs/app_starter/app_starter_event.dart';
import 'package:my_crypto/presentation/blocs/app_starter/app_starter_state.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_event.dart';
import 'package:my_crypto/presentation/screens/splash_screen.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class ScreenSelector extends StatelessWidget {
  const ScreenSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AbstractTheme theme = Provider.of<ThemesBloc>(context).theme;
    precacheImage(Image.asset('assets/logo.png').image, context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.backgroundColor, // navigation bar color
      statusBarColor: theme.backgroundColor, // status bar color
    ));
    FlutterNativeSplash.remove();

    return BlocProvider(
        lazy: false,
        create: (BuildContext context) => getIt<AppStarterBloc>()..add(InitAppEvent()),
        child: BlocBuilder<AppStarterBloc, AppStarterState>(
          builder: (context, state) {
            bool canLoadFarther = (state as CanStartAppState).result;
            return canLoadFarther
                ? BlocProvider(
                    lazy: false,
                    create: (BuildContext context) => getIt<UserBloc>()..add(InitUserEvent()),
                    child: Builder(builder: (context) {
                      return AutoRouter(
                        placeholder: (context) => const SplashScreenPlaceHolder(),
                      );
                    }),
                  )
                : const SplashScreenPlaceHolder();
          },
        ));
  }
}
