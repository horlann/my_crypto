import 'package:auto_route/auto_route.dart';
import 'package:my_crypto/presentation/pages/home/home_page.dart';
import 'package:my_crypto/presentation/pages/profile/profile_page.dart';
import 'package:my_crypto/presentation/pages/settings/settings_page.dart';
import 'package:my_crypto/presentation/pages/wallet/wallet_page.dart';
import 'package:my_crypto/presentation/screens.dart';
import 'package:my_crypto/presentation/screens/crypto_view/crypto_view.dart';
import 'package:my_crypto/presentation/screens/main_screen.dart';
import 'package:my_crypto/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:my_crypto/presentation/screens/register/registration_screen.dart';
import 'package:my_crypto/presentation/screens/splash_screen.dart';
import 'package:my_crypto/presentation/utils/scopeWidgets/home_scope.dart';
import 'package:my_crypto/presentation/utils/scopeWidgets/main_scope.dart';
import 'package:my_crypto/presentation/utils/scopeWidgets/profileWrapper.dart';

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
            AutoRoute(path: 'profileScope', page: ProfileWrapper, children: [
              AutoRoute(path: 'settings', page: SettingsPage),
              AutoRoute(path: 'profile', page: ProfilePage, initial: true),
            ]),
          ],
          page: HomeScreen),
      AutoRoute(path: 'cryptoView', page: CryptoViewPage)
    ]),
    AutoRoute(initial: true, path: 'splash', page: SplashScreen, name: 'splash'),
    AutoRoute(path: 'boarding', page: OnBoarding, name: 'boarding'),
    AutoRoute(path: 'registration', page: RegistrationScreen, name: 'registration'),
  ])
])
class $AppRouter {}
