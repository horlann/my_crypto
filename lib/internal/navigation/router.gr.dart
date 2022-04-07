// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../presentation/pages/home/home_page.dart' as _i4;
import '../../presentation/pages/settings/settings_page.dart' as _i6;
import '../../presentation/pages/wallet/wallet_page.dart' as _i5;
import '../../presentation/screens.dart' as _i1;
import '../../presentation/screens/main_screen.dart' as _i2;
import '../../presentation/screens/splash_screen.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Selector.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ScreenSelector());
    },
    HomeScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HomeScreen());
    },
    Splash.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashScreen());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    WalletRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WalletPage());
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(Selector.name, path: '/', children: [
          _i7.RouteConfig('#redirect',
              path: '',
              parent: Selector.name,
              redirectTo: 'splash',
              fullMatch: true),
          _i7.RouteConfig(HomeScreen.name,
              path: 'app',
              parent: Selector.name,
              children: [
                _i7.RouteConfig('#redirect',
                    path: '',
                    parent: HomeScreen.name,
                    redirectTo: 'home',
                    fullMatch: true),
                _i7.RouteConfig(HomeRoute.name,
                    path: 'home', parent: HomeScreen.name),
                _i7.RouteConfig(WalletRoute.name,
                    path: 'wallet', parent: HomeScreen.name),
                _i7.RouteConfig(SettingsRoute.name,
                    path: 'settings', parent: HomeScreen.name)
              ]),
          _i7.RouteConfig(Splash.name, path: 'splash', parent: Selector.name)
        ])
      ];
}

/// generated route for
/// [_i1.ScreenSelector]
class Selector extends _i7.PageRouteInfo<void> {
  const Selector({List<_i7.PageRouteInfo>? children})
      : super(Selector.name, path: '/', initialChildren: children);

  static const String name = 'Selector';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i7.PageRouteInfo<void> {
  const HomeScreen({List<_i7.PageRouteInfo>? children})
      : super(HomeScreen.name, path: 'app', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.SplashScreen]
class Splash extends _i7.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: 'splash');

  static const String name = 'Splash';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.WalletPage]
class WalletRoute extends _i7.PageRouteInfo<void> {
  const WalletRoute() : super(WalletRoute.name, path: 'wallet');

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

  static const String name = 'SettingsRoute';
}
