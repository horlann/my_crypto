import 'package:flutter/material.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/screens/onboarding/onboarding_content_tile.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    data = [
      {"title": "Lets try", "text": "Small introduce to the app", 'imagePath': 'assets/logo.png'},
      {"title": "Lets try", "text": "Small introduce to the app", 'imagePath': 'assets/logo.png'},
      {"title": "Register", "text": "Create an account and try all features", 'imagePath': 'assets/logo.png'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    AbstractTheme theme = Provider.of<ThemesBloc>(context).theme;
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
                    imagePath: data[index]['imagePath'] ?? 'error',
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
                              text: "Skip",
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
                              text: "Continue",
                              paddingVert: 16,
                              callback: () {
                                if (currentPage == data.length - 1) {
                                  getIt<AppRouter>().replaceNamed('login');
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
