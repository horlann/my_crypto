// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../../domain/entities/crypto/crypto.dart' as _i19;
import '../../presentation/pages/home/home_page.dart' as _i12;
import '../../presentation/pages/profile/profile_page.dart' as _i14;
import '../../presentation/pages/registration/main_regisration/main_registration_page.dart' as _i15;
import '../../presentation/pages/registration/sms_verification/sms_verification_page.dart' as _i16;
import '../../presentation/pages/settings/settings_page.dart' as _i13;
import '../../presentation/pages/wallet/wallet_page.dart' as _i10;
import '../../presentation/screens.dart' as _i1;
import '../../presentation/screens/crypto_view/crypto_view.dart' as _i8;
import '../../presentation/screens/login/login_screen.dart' as _i5;
import '../../presentation/screens/main_screen.dart' as _i7;
import '../../presentation/screens/onboarding/onboarding_screen.dart' as _i4;
import '../../presentation/screens/register/registration_screen.dart' as _i6;
import '../../presentation/screens/splash_screen.dart' as _i3;
import '../../presentation/utils/scopeWidgets/home_scope.dart' as _i9;
import '../../presentation/utils/scopeWidgets/main_scope.dart' as _i2;
import '../../presentation/utils/scopeWidgets/profile_wrapper.dart' as _i11;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    Selector.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ScreenSelector());
    },
    MainRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainScope());
    },
    Splash.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashScreen());
    },
    OnBoarding.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OnBoarding());
    },
    Login.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginScreen());
    },
    Registration.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.RegistrationScreen());
    },
    HomeScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    CryptoViewRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoViewRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CryptoViewPage(
              key: args.key, cryptoEntity: args.cryptoEntity));
    },
    HomeRouteScope.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomePageScope());
    },
    WalletRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.WalletPage());
    },
    ProfileWrapper.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfileWrapper());
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomePage());
    },
    SettingsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SettingsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfilePage());
    },
    MainRegistration.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.MainRegistrationPage());
    },
    SmsVerification.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.SmsVerificationPage());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(Selector.name, path: '/', children: [
          _i17.RouteConfig('#redirect',
              path: '',
              parent: Selector.name,
              redirectTo: 'splash',
              fullMatch: true),
          _i17.RouteConfig(MainRoute.name,
              path: 'mainRoute',
              parent: Selector.name,
              children: [
                _i17.RouteConfig('#redirect',
                    path: '',
                    parent: MainRoute.name,
                    redirectTo: 'app',
                    fullMatch: true),
                _i17.RouteConfig(HomeScreen.name,
                    path: 'app',
                    parent: MainRoute.name,
                    children: [
                      _i17.RouteConfig('#redirect',
                          path: '',
                          parent: HomeScreen.name,
                          redirectTo: 'homeScope',
                          fullMatch: true),
                      _i17.RouteConfig(HomeRouteScope.name,
                          path: 'homeScope',
                          parent: HomeScreen.name,
                          children: [
                            _i17.RouteConfig('#redirect',
                                path: '',
                                parent: HomeRouteScope.name,
                                redirectTo: 'home',
                                fullMatch: true),
                            _i17.RouteConfig(HomeRoute.name,
                                path: 'home', parent: HomeRouteScope.name)
                          ]),
                      _i17.RouteConfig(WalletRoute.name,
                          path: 'wallet', parent: HomeScreen.name),
                      _i17.RouteConfig(ProfileWrapper.name,
                          path: 'profileScope',
                          parent: HomeScreen.name,
                          children: [
                            _i17.RouteConfig('#redirect',
                                path: '',
                                parent: ProfileWrapper.name,
                                redirectTo: 'profile',
                                fullMatch: true),
                            _i17.RouteConfig(SettingsRoute.name,
                                path: 'settings', parent: ProfileWrapper.name),
                            _i17.RouteConfig(ProfileRoute.name,
                                path: 'profile', parent: ProfileWrapper.name)
                          ])
                    ]),
                _i17.RouteConfig(CryptoViewRoute.name,
                    path: 'cryptoView', parent: MainRoute.name)
              ]),
          _i17.RouteConfig(Splash.name, path: 'splash', parent: Selector.name),
          _i17.RouteConfig(OnBoarding.name,
              path: 'onBoarding', parent: Selector.name),
          _i17.RouteConfig(Login.name, path: 'login', parent: Selector.name),
          _i17.RouteConfig(Registration.name,
              path: 'registration',
              parent: Selector.name,
              children: [
                _i17.RouteConfig('#redirect',
                    path: '',
                    parent: Registration.name,
                    redirectTo: 'mainRegistration',
                    fullMatch: true),
                _i17.RouteConfig(MainRegistration.name,
                    path: 'mainRegistration', parent: Registration.name),
                _i17.RouteConfig(SmsVerification.name,
                    path: 'smsVerification', parent: Registration.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.ScreenSelector]
class Selector extends _i17.PageRouteInfo<void> {
  const Selector({List<_i17.PageRouteInfo>? children})
      : super(Selector.name, path: '/', initialChildren: children);

  static const String name = 'Selector';
}

/// generated route for
/// [_i2.MainScope]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute({List<_i17.PageRouteInfo>? children})
      : super(MainRoute.name, path: 'mainRoute', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.SplashScreen]
class Splash extends _i17.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: 'splash');

  static const String name = 'Splash';
}

/// generated route for
/// [_i4.OnBoarding]
class OnBoarding extends _i17.PageRouteInfo<void> {
  const OnBoarding() : super(OnBoarding.name, path: 'onBoarding');

  static const String name = 'OnBoarding';
}

/// generated route for
/// [_i5.LoginScreen]
class Login extends _i17.PageRouteInfo<void> {
  const Login() : super(Login.name, path: 'login');

  static const String name = 'Login';
}

/// generated route for
/// [_i6.RegistrationScreen]
class Registration extends _i17.PageRouteInfo<void> {
  const Registration({List<_i17.PageRouteInfo>? children})
      : super(Registration.name,
      path: 'registration', initialChildren: children);

  static const String name = 'Registration';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreen extends _i17.PageRouteInfo<void> {
  const HomeScreen({List<_i17.PageRouteInfo>? children})
      : super(HomeScreen.name, path: 'app', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i8.CryptoViewPage]
class CryptoViewRoute extends _i17.PageRouteInfo<CryptoViewRouteArgs> {
  CryptoViewRoute({_i18.Key? key, required _i19.CryptoEntity cryptoEntity})
      : super(CryptoViewRoute.name,
      path: 'cryptoView',
      args: CryptoViewRouteArgs(key: key, cryptoEntity: cryptoEntity));

  static const String name = 'CryptoViewRoute';
}

class CryptoViewRouteArgs {
  const CryptoViewRouteArgs({this.key, required this.cryptoEntity});

  final _i18.Key? key;

  final _i19.CryptoEntity cryptoEntity;

  @override
  String toString() {
    return 'CryptoViewRouteArgs{key: $key, cryptoEntity: $cryptoEntity}';
  }
}

/// generated route for
/// [_i9.HomePageScope]
class HomeRouteScope extends _i17.PageRouteInfo<void> {
  const HomeRouteScope({List<_i17.PageRouteInfo>? children})
      : super(HomeRouteScope.name,
      path: 'homeScope', initialChildren: children);

  static const String name = 'HomeRouteScope';
}

/// generated route for
/// [_i10.WalletPage]
class WalletRoute extends _i17.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: 'wallet');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i11.ProfileWrapper]
class ProfileWrapper extends _i17.PageRouteInfo<void> {
  const ProfileWrapper({List<_i17.PageRouteInfo>? children})
      : super(ProfileWrapper.name,
      path: 'profileScope', initialChildren: children);

  static const String name = 'ProfileWrapper';
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i15.MainRegistrationPage]
class MainRegistration extends _i17.PageRouteInfo<void> {
  const MainRegistration()
      : super(MainRegistration.name, path: 'mainRegistration');

  static const String name = 'MainRegistration';
}

/// generated route for
/// [_i16.SmsVerificationPage]
class SmsVerification extends _i17.PageRouteInfo<void> {
  const SmsVerification()
      : super(SmsVerification.name, path: 'smsVerification');

  static const String name = 'SmsVerification';
}
