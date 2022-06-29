import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/screens/onboarding/onboarding_content_tile.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/themes/dark_theme.dart';
import 'package:my_crypto/presentation/widgets/main_rounded_button.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Map<String, String>> data = <Map<String, String>>[];
  late AbstractTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemesBloc>(context).theme;
    data = [
      {
        "title": "Lets try",
        "text": "Small introduce to the app",
        'imagePath':
            theme is DarkTheme ? 'assets/lottie/bitcoin_in_cup_dark.json' : 'assets/lottie/bitcoin_in_cup_light.json'
      },
      {
        "title": "Crypto Wallet",
        "text": "You can safely store your coins here and increase them by stacking",
        'imagePath': 'assets/lottie/bitcoin_wallet.json'
      },
      {
        "title": "Crypto Exchange",
        "text": "You can instantly trade between different coins without any commissions",
        'imagePath': 'assets/lottie/exchange_cryptocurrency.json'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: PageView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: data.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    title: data[index]['title'] ?? 'error',
                    text: data[index]['text'] ?? 'error',
                    lottieAsset: data[index]['imagePath'] ?? 'error',
                    theme: theme,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(
                        flex: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          data.length,
                              (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 2),
                      Row(
                        children: [
                          Expanded(
                            child: MainRoundedButton(
                              text: easy_local.tr('skip'),
                              paddingVert: 16,
                              callback: () {
                                if (currentPage != data.length - 1) {
                                  _pageController.animateToPage((data.length - 1),
                                      duration: const Duration(milliseconds: 500), curve: Curves.linear);
                                } else {
                                  getIt<AppRouter>().replaceNamed('mainRoute');
                                }
                              },
                              theme: theme,
                              textStyle: TextStyle(color: theme.infoTextColor, fontWeight: FontWeight.w500),
                              border: Border.all(color: theme.accentColor, width: 3),
                              color: theme.backgroundColor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: MainRoundedButton(
                              text: easy_local.tr(currentPage == data.length - 1 ? 'sign_in' : 'continue'),
                              paddingVert: 16,
                              callback: () {
                                if (currentPage == data.length - 1) {
                                  getIt<AppRouter>().pushNamed('login');
                                } else {
                                  _pageController.animateToPage(++currentPage,
                                      duration: const Duration(milliseconds: 500), curve: Curves.linear);
                                }
                              },
                              theme: theme,
                              color: theme.accentColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
