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
    this.callbackForBackButton,
  }) : super(key: key);
  final bool bottomLeftDecoration;
  final bool bottomRightDecoration;
  final VoidCallback? callbackForBackButton;

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
          child,
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
          if (callbackForBackButton != null)
            Positioned(
              top: 0,
              left: 0,
              child: CustomBackButton(
                theme: theme,
                callback: callbackForBackButton!,
              ),
            ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.callback, required this.theme}) : super(key: key);
  final VoidCallback callback;
  final AbstractTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(20, 35, 0, 15),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
            color: theme.infoTextColor,
          ),
        ),
      ),
    );
  }
}
