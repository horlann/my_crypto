import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRouteScope(), WalletRoute(), ProfileWrapper()],
      builder: (context, child, animation) {
        final themes = Provider.of<ThemesBloc>(context).theme;

        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
            bottomNavigationBar: Container(
              height: 50,
              color: themes.cardColor,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            tabsRouter.setActiveIndex(0);
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(11),
                            child: SvgPicture.asset(
                              'assets/svgIcons/home.svg',
                              color: tabsRouter.activeIndex == 0 ? themes.infoTextColor : themes.inactiveTextColor,
                            ),
                          ))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            tabsRouter.setActiveIndex(1);
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/svgIcons/arrow.svg',
                                color: tabsRouter.activeIndex == 1 ? themes.infoTextColor : themes.inactiveTextColor),
                          ))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            tabsRouter.setActiveIndex(2);
                          },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(11),
                            child: SvgPicture.asset('assets/svgIcons/user.svg',
                                color: tabsRouter.activeIndex == 2 ? themes.infoTextColor : themes.inactiveTextColor),
                          ))),
                ],
              ),
            ));
      },
    );
  }
}
