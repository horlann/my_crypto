import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.title,
    required this.text,
    required this.lottieAsset,
    required this.theme,
  }) : super(key: key);
  final String title;
  final String text;
  final String lottieAsset;
  final AbstractTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 60,
        ),
        Text(
          "MyCrypto",
          style: TextStyle(
            fontSize: 36,
            color: theme.infoTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Lottie.asset(lottieAsset),
          flex: 3,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: TextStyle(color: theme.infoTextColor, fontSize: 28, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(color: theme.infoTextColor, fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
