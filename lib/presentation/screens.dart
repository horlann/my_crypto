import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_event.dart';

class ScreenSelector extends StatefulWidget {
  const ScreenSelector({Key? key}) : super(key: key);

  @override
  State<ScreenSelector> createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ThemesBloc()..add(const ThemeInitEvent()),
        child: Builder(builder: (context) {
          final theme = BlocProvider.of<ThemesBloc>(context).theme;
          return AutoRouter(
            placeholder: (BuildContext context) {
              return Container(
                color: theme.backgroundColor,
              );
            },
          );
        }));
  }
}
