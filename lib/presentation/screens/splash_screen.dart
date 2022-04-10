import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/main.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/screens.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      appRouter.replaceNamed('app');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          final ThemesBloc bloc = BlocProvider.of<ThemesBloc>(context);

          return Scaffold(
            body: Container(
              color: bloc.theme.backgroundColor,
              child: Center(
                  child: GestureDetector(
                child: Text("Splash"),
                onTap: () {
                //  appRouter.push(Selector());
                },
              )),
            ),
          );
        },
    );
  }
}
