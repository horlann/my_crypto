import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), WalletRoute(), SettingsRoute(), WalletRoute()],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              backgroundColor: Colors.green,
              unselectedItemColor: Colors.deepPurple,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.event,
                      color: Colors.black,
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.wallet_travel,
                      color: Colors.black,
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    )),
              ],
            ));
      },
    );
  }
}
