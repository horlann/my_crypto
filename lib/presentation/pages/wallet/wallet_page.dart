import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themes =Provider.of<ThemesBloc>(context).theme;

    return Container(
      color: themes.activityBackgroundColor,
      child: Center(child: Text(easy_local.tr('wallet'),style: TextStyle(color: Colors.amber),)),
    );
  }
}
