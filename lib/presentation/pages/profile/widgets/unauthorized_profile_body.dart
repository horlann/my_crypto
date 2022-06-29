import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/widgets/main_rounded_button.dart';

class UnauthorizedProfile extends StatelessWidget {
  const UnauthorizedProfile({Key? key, required this.theme}) : super(key: key);
  final AbstractTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.3,
        child: Column(
          children: [
            Expanded(flex: 2, child: Lottie.asset('assets/lottie/man_with_phone.json')),
            Expanded(
              child: Column(
                children: [
                  AutoSizeText(easy_local.tr('sign_in_to_try'),
                      maxFontSize: 24,
                      minFontSize: 18,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: theme.infoTextColor, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 24,
                  ),
                  MainRoundedButton(
                      text: easy_local.tr('sign_in'),
                      color: theme.accentColor,
                      callback: () {
                        getIt<AppRouter>().pushNamed('login');
                      },
                      paddingVert: 16,
                      theme: theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
