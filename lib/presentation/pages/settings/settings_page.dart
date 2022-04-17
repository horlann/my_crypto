import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/blocs/settings/settings_bloc.dart';
import 'package:my_crypto/presentation/blocs/settings/settings_event.dart';
import 'package:my_crypto/presentation/blocs/settings/settings_state.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_event.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AbstractTheme _theme;

  @override
  void didChangeDependencies() {
    _theme = Provider.of<ThemesBloc>(context).theme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    final themes = Provider.of<ThemesBloc>(context);

    return Container(
      color: _theme.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  appRouter.push(const ProfileRoute());
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: _theme.cardColor,
                  child: const Icon(Icons.arrow_back_ios),
                ),
              )
            ],
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                themes.add(const UpdateThemeEvent());
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: themes.theme.backgroundColor,
                child: BlocConsumer<SettingsBloc, SettingsState>(
                  listener: (context, state) {},
                  bloc: bloc,
                  builder: (context, state) {
                    return Text('${themes.theme.runtimeType}');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.deepPurple,
              child: GestureDetector(
                onTap: () {
                  bloc.add(CounterDecrementPressed());
                },
                child: BlocConsumer<SettingsBloc, SettingsState>(
                  listener: (context, state) {},
                  bloc: bloc,
                  builder: (context, state) {
                    return Center(child: Text('Settings ${(state as UpdateNumberState).number}'));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.deepOrange,
              child: GestureDetector(
                onTap: () {
                  if (context.locale == const Locale('en')) {
                    context.setLocale(const Locale('uk'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                },
                child: BlocConsumer<SettingsBloc, SettingsState>(
                  listener: (context, state) {},
                  bloc: bloc,
                  builder: (context, state) {
                    return Center(child: Text('Language ${context.locale}'));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
