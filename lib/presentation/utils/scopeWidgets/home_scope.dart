import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class HomePageScope extends StatelessWidget {
  const HomePageScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      placeholder: (context) => Container(
        color: Provider.of<ThemesBloc>(context).theme.backgroundColor,
      ),
    );
  }
}
