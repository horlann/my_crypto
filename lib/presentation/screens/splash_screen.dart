import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_state.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is AuthorizedState || state is UnauthorizedState) {
          getIt<AppRouter>().replaceNamed('mainRoute');
        } else if (state is AuthorizationErrorState) {
          Flushbar(
            title: "Error",
            message: "Something went wrong...",
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      },
      child: Builder(
        builder: (context) {
          final AbstractTheme theme = BlocProvider.of<ThemesBloc>(context).theme;
          return Scaffold(
            body: Container(
              color: theme.backgroundColor,
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        'assets/logo.png',
                        width: 120,
                        height: 120,
                      ),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.hardEdge),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    easy_local.tr('dataIsLoading'),
                    style: TextStyle(color: theme.infoTextColor, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SpinKitWanderingCubes(
                    color: theme.accentColor,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
