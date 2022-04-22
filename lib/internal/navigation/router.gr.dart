// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../../domain/entities/crypto/crypto.dart' as _i16;
import '../../presentation/pages/home/home_page.dart' as _i11;
import '../../presentation/pages/profile/profile_page.dart' as _i13;
import '../../presentation/pages/settings/settings_page.dart' as _i12;
import '../../presentation/pages/wallet/wallet_page.dart' as _i9;
import '../../presentation/screens.dart' as _i1;
import '../../presentation/screens/crypto_view/crypto_view.dart' as _i7;
import '../../presentation/screens/main_screen.dart' as _i6;
import '../../presentation/screens/onboarding/onboarding_screen.dart' as _i4;
import '../../presentation/screens/register/registration_screen.dart' as _i5;
import '../../presentation/screens/splash_screen.dart' as _i3;
import '../../presentation/utils/scopeWidgets/home_scope.dart' as _i8;
import '../../presentation/utils/scopeWidgets/main_scope.dart' as _i2;
import '../../presentation/utils/scopeWidgets/profileWrapper.dart' as _i10;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    Selector.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.ScreenSelector());
    },
    MainScope.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i2.MainScope());
    },
    Splash.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i3.SplashScreen());
    },
    Boarding.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i4.OnBoarding());
    },
    Registration.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i5.RegistrationScreen());
    },
    HomeScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i6.HomeScreen());
    },
    CryptoViewRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoViewRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CryptoViewPage(key: args.key, cryptoEntity: args.cryptoEntity));
    },
    HomeRouteScope.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i8.HomePageScope());
    },
    WalletRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i9.WalletPage());
    },
    ProfileWrapper.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i10.ProfileWrapper());
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i11.HomePage());
    },
    SettingsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i12.SettingsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(routeData: routeData, child: const _i13.ProfilePage());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(Selector.name, path: '/', children: [
          _i14.RouteConfig('#redirect', path: '', parent: Selector.name, redirectTo: 'splash', fullMatch: true),
          _i14.RouteConfig(MainScope.name, path: 'mainRoute', parent: Selector.name, children: [
            _i14.RouteConfig('#redirect', path: '', parent: MainScope.name, redirectTo: 'app', fullMatch: true),
            _i14.RouteConfig(HomeScreen.name, path: 'app', parent: MainScope.name, children: [
              _i14.RouteConfig('#redirect',
                  path: '', parent: HomeScreen.name, redirectTo: 'homeScope', fullMatch: true),
              _i14.RouteConfig(HomeRouteScope.name, path: 'homeScope', parent: HomeScreen.name, children: [
                _i14.RouteConfig('#redirect',
                    path: '', parent: HomeRouteScope.name, redirectTo: 'home', fullMatch: true),
                _i14.RouteConfig(HomeRoute.name, path: 'home', parent: HomeRouteScope.name)
              ]),
              _i14.RouteConfig(WalletRoute.name, path: 'wallet', parent: HomeScreen.name),
              _i14.RouteConfig(ProfileWrapper.name, path: 'profileScope', parent: HomeScreen.name, children: [
                _i14.RouteConfig('#redirect',
                    path: '', parent: ProfileWrapper.name, redirectTo: 'profile', fullMatch: true),
                _i14.RouteConfig(SettingsRoute.name, path: 'settings', parent: ProfileWrapper.name),
                _i14.RouteConfig(ProfileRoute.name, path: 'profile', parent: ProfileWrapper.name)
              ])
            ]),
            _i14.RouteConfig(CryptoViewRoute.name, path: 'cryptoView', parent: MainScope.name)
          ]),
          _i14.RouteConfig(Splash.name, path: 'splash', parent: Selector.name),
          _i14.RouteConfig(Boarding.name, path: 'boarding', parent: Selector.name),
          _i14.RouteConfig(Registration.name, path: 'registration', parent: Selector.name)
        ])
      ];
}

/// generated route for
/// [_i1.ScreenSelector]
class Selector extends _i14.PageRouteInfo<void> {
  const Selector({List<_i14.PageRouteInfo>? children}) : super(Selector.name, path: '/', initialChildren: children);

  static const String name = 'Selector';
}

/// generated route for
/// [_i2.MainScope]
class MainScope extends _i14.PageRouteInfo<void> {
  const MainScope({List<_i14.PageRouteInfo>? children})
      : super(MainScope.name, path: 'mainRoute', initialChildren: children);

  static const String name = 'MainScope';
}

/// generated route for
/// [_i3.SplashScreen]
class Splash extends _i14.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: 'splash');

  static const String name = 'Splash';
}

/// generated route for
/// [_i4.OnBoarding]
class Boarding extends _i14.PageRouteInfo<void> {
  const Boarding() : super(Boarding.name, path: 'boarding');

  static const String name = 'Boarding';
}

/// generated route for
/// [_i5.RegistrationScreen]
class Registration extends _i14.PageRouteInfo<void> {
  const Registration() : super(Registration.name, path: 'registration');

  static const String name = 'Registration';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i14.PageRouteInfo<void> {
  const HomeScreen({List<_i14.PageRouteInfo>? children})
      : super(HomeScreen.name, path: 'app', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i7.CryptoViewPage]
class CryptoViewRoute extends _i14.PageRouteInfo<CryptoViewRouteArgs> {
  CryptoViewRoute({_i15.Key? key, required _i16.CryptoEntity cryptoEntity})
      : super(CryptoViewRoute.name,
            path: 'cryptoView', args: CryptoViewRouteArgs(key: key, cryptoEntity: cryptoEntity));

  static const String name = 'CryptoViewRoute';
}

class CryptoViewRouteArgs {
  const CryptoViewRouteArgs({this.key, required this.cryptoEntity});

  final _i15.Key? key;

  final _i16.CryptoEntity cryptoEntity;

  @override
  String toString() {
    return 'CryptoViewRouteArgs{key: $key, cryptoEntity: $cryptoEntity}';
  }
}

/// generated route for
/// [_i8.HomePageScope]
class HomeRouteScope extends _i14.PageRouteInfo<void> {
  const HomeRouteScope({List<_i14.PageRouteInfo>? children})
      : super(HomeRouteScope.name, path: 'homeScope', initialChildren: children);

  static const String name = 'HomeRouteScope';
}

/// generated route for
/// [_i9.WalletPage]
class WalletRoute extends _i14.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: 'wallet');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i10.ProfileWrapper]
class ProfileWrapper extends _i14.PageRouteInfo<void> {
  const ProfileWrapper({List<_i14.PageRouteInfo>? children})
      : super(ProfileWrapper.name, path: 'profileScope', initialChildren: children);

  static const String name = 'ProfileWrapper';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
