import 'package:auto_route/auto_route.dart';
import 'package:my_crypto/presentation/screens.dart';
import 'package:my_crypto/presentation/screens/crypto_view/crypto_view.dart';
import 'package:my_crypto/presentation/screens/main_screen.dart';
import 'package:my_crypto/presentation/pages/home/home_page.dart';
import 'package:my_crypto/presentation/pages/settings/settings_page.dart';
import 'package:my_crypto/presentation/pages/wallet/wallet_page.dart';
import 'package:my_crypto/presentation/screens/splash_screen.dart';
import 'package:my_crypto/presentation/utils/scopeWidgets/home_scope.dart';
import 'package:my_crypto/presentation/utils/scopeWidgets/main_scope.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(name: 'selector', page: ScreenSelector, path: '/', initial: true, children: [
    AutoRoute(page: MainScope, path: 'mainRoute', children: [
      AutoRoute(
          initial: true,
          path: 'app',
          children: [
            AutoRoute(initial: true, path: 'homeScope', page: HomePageScope, children: [
              AutoRoute(
                path: 'home',
                page: HomePage,
                initial: true,
              ),
            ]),
            AutoRoute(path: 'wallet', page: WalletPage),
            AutoRoute(path: 'settings', page: SettingsPage),
          ],
          page: HomeScreen),
      AutoRoute(path: 'cryptoView', page: CryptoViewPage)

    ]),
    AutoRoute(initial: true, path: 'splash', page: SplashScreen, name: 'splash')
  ])
])
class $AppRouter {}
