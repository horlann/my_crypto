import 'package:auto_route/auto_route.dart';
import 'package:my_crypto/presentation/screens.dart';
import 'package:my_crypto/presentation/screens/main_screen.dart';
import 'package:my_crypto/presentation/pages/home/home_page.dart';
import 'package:my_crypto/presentation/pages/settings/settings_page.dart';
import 'package:my_crypto/presentation/pages/wallet/wallet_page.dart';
import 'package:my_crypto/presentation/screens/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(name: 'selector',page: ScreenSelector,path: '/',initial: true,children: [
    AutoRoute(
        path: 'app',
        children: [
          AutoRoute(path: 'home', page: HomePage, initial: true),
          AutoRoute(path: 'wallet', page: WalletPage),
          AutoRoute(path: 'settings', page: SettingsPage),
        ],
        page: HomeScreen),
    AutoRoute(initial: true, path: 'splash', page: SplashScreen,name: 'splash')
  ])


])
class $AppRouter {}
