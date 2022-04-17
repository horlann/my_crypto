// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../domain/entities/crypto/crypto.dart' as _i14;
import '../../presentation/pages/home/home_page.dart' as _i9;
import '../../presentation/pages/profile/profile_page.dart' as _i11;
import '../../presentation/pages/settings/settings_page.dart' as _i10;
import '../../presentation/pages/wallet/wallet_page.dart' as _i7;
import '../../presentation/screens.dart' as _i1;
import '../../presentation/screens/crypto_view/crypto_view.dart' as _i5;
import '../../presentation/screens/main_screen.dart' as _i4;
import '../../presentation/screens/splash_screen.dart' as _i3;
import '../../presentation/utils/scopeWidgets/home_scope.dart' as _i6;
import '../../presentation/utils/scopeWidgets/main_scope.dart' as _i2;
import '../../presentation/utils/scopeWidgets/profileWrapper.dart' as _i8;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    Selector.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.ScreenSelector());
    },
    MainScope.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i2.MainScope());
    },
    Splash.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i3.SplashScreen());
    },
    HomeScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i4.HomeScreen());
    },
    CryptoViewRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoViewRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.CryptoViewPage(key: args.key, cryptoEntity: args.cryptoEntity));
    },
    HomeRouteScope.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i6.HomePageScope());
    },
    WalletRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i7.WalletPage());
    },
    ProfileWrapper.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i8.ProfileWrapper());
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i9.HomePage());
    },
    SettingsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i10.SettingsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(routeData: routeData, child: const _i11.ProfilePage());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(Selector.name, path: '/', children: [
          _i12.RouteConfig('#redirect', path: '', parent: Selector.name, redirectTo: 'splash', fullMatch: true),
          _i12.RouteConfig(MainScope.name, path: 'mainRoute', parent: Selector.name, children: [
            _i12.RouteConfig('#redirect', path: '', parent: MainScope.name, redirectTo: 'app', fullMatch: true),
            _i12.RouteConfig(HomeScreen.name, path: 'app', parent: MainScope.name, children: [
              _i12.RouteConfig('#redirect',
                  path: '', parent: HomeScreen.name, redirectTo: 'homeScope', fullMatch: true),
              _i12.RouteConfig(HomeRouteScope.name, path: 'homeScope', parent: HomeScreen.name, children: [
                _i12.RouteConfig('#redirect',
                    path: '', parent: HomeRouteScope.name, redirectTo: 'home', fullMatch: true),
                _i12.RouteConfig(HomeRoute.name, path: 'home', parent: HomeRouteScope.name)
              ]),
              _i12.RouteConfig(WalletRoute.name, path: 'wallet', parent: HomeScreen.name),
              _i12.RouteConfig(ProfileWrapper.name, path: 'profileScope', parent: HomeScreen.name, children: [
                _i12.RouteConfig('#redirect',
                    path: '', parent: ProfileWrapper.name, redirectTo: 'profile', fullMatch: true),
                _i12.RouteConfig(SettingsRoute.name, path: 'settings', parent: ProfileWrapper.name),
                _i12.RouteConfig(ProfileRoute.name, path: 'profile', parent: ProfileWrapper.name)
              ])
            ]),
                _i12.RouteConfig(CryptoViewRoute.name, path: 'cryptoView', parent: MainScope.name)
          ]),
          _i12.RouteConfig(Splash.name, path: 'splash', parent: Selector.name)
        ])
      ];
}

/// generated route for
/// [_i1.ScreenSelector]
class Selector extends _i12.PageRouteInfo<void> {
  const Selector({List<_i12.PageRouteInfo>? children}) : super(Selector.name, path: '/', initialChildren: children);

  static const String name = 'Selector';
}

/// generated route for
/// [_i2.MainScope]
class MainScope extends _i12.PageRouteInfo<void> {
  const MainScope({List<_i12.PageRouteInfo>? children})
      : super(MainScope.name, path: 'mainRoute', initialChildren: children);

  static const String name = 'MainScope';
}

/// generated route for
/// [_i3.SplashScreen]
class Splash extends _i12.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: 'splash');

  static const String name = 'Splash';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i12.PageRouteInfo<void> {
  const HomeScreen({List<_i12.PageRouteInfo>? children})
      : super(HomeScreen.name, path: 'app', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.CryptoViewPage]
class CryptoViewRoute extends _i12.PageRouteInfo<CryptoViewRouteArgs> {
  CryptoViewRoute({_i13.Key? key, required _i14.CryptoEntity cryptoEntity})
      : super(CryptoViewRoute.name,
            path: 'cryptoView', args: CryptoViewRouteArgs(key: key, cryptoEntity: cryptoEntity));

  static const String name = 'CryptoViewRoute';
}

class CryptoViewRouteArgs {
  const CryptoViewRouteArgs({this.key, required this.cryptoEntity});

  final _i13.Key? key;

  final _i14.CryptoEntity cryptoEntity;

  @override
  String toString() {
    return 'CryptoViewRouteArgs{key: $key, cryptoEntity: $cryptoEntity}';
  }
}

/// generated route for
/// [_i6.HomePageScope]
class HomeRouteScope extends _i12.PageRouteInfo<void> {
  const HomeRouteScope({List<_i12.PageRouteInfo>? children})
      : super(HomeRouteScope.name, path: 'homeScope', initialChildren: children);

  static const String name = 'HomeRouteScope';
}

/// generated route for
/// [_i7.WalletPage]
class WalletRoute extends _i12.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: 'wallet');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i8.ProfileWrapper]
class ProfileWrapper extends _i12.PageRouteInfo<void> {
  const ProfileWrapper({List<_i12.PageRouteInfo>? children})
      : super(ProfileWrapper.name, path: 'profileScope', initialChildren: children);

  static const String name = 'ProfileWrapper';
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
