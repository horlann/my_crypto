import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/dark_theme.dart';
import 'package:my_crypto/presentation/utils/themes/light_theme.dart';

import 'themes_event.dart';
import 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(ThemesState().init()) {
    on<ThemeInitEvent>(_init);
    on<UpdateThemeEvent>(_updateTheme);
  }
  AbstractTheme _currentTheme=DarkTheme();
  AbstractTheme get theme=>_currentTheme;
  final _themeStream =StreamController<String>();

  Stream<String> get themeStream => _themeStream.stream;
  void _init(ThemeInitEvent event, Emitter<ThemesState> emit) async {

  }
  void _updateTheme(UpdateThemeEvent event, Emitter<ThemesState> emit) async {
    if(_currentTheme is LightTheme){
      _currentTheme=DarkTheme();

    }else{
      _currentTheme=LightTheme();

    }
    _themeStream.sink.add('Dark');
    print('theme updated ${_currentTheme.runtimeType}');
    emit(ThemesState().clone());
  }
}

enum Theme { dark, light }
