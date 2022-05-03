import 'package:flutter/material.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
    this.bottomLeftDecoration = false,
    this.bottomRightDecoration = false,
  }) : super(key: key);
  final bool bottomLeftDecoration;
  final bool bottomRightDecoration;

  @override
  Widget build(BuildContext context) {
    AbstractTheme theme = Provider.of<ThemesBloc>(context).theme;

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/pngIcons/signup_top.png",
              color: theme.accentColor,
              width: size.width * 0.32,
            ),
          ),
          if (bottomRightDecoration)
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/pngIcons/login_bottom.png",
                color: theme.accentColor,
                width: size.width * 0.35,
              ),
            ),
          if (bottomLeftDecoration)
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/pngIcons/main_bottom.png",
                color: theme.accentColor,
                width: size.width * 0.25,
              ),
            ),
          child,
        ],
      ),
    );
  }
}
