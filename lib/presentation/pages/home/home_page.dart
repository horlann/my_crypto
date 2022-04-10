import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_bloc.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_event.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_state.dart';
import 'package:my_crypto/presentation/pages/home/widgets/crypto_tile.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemesBloc>(context).theme;

    return BlocProvider(
      create: (context) => CryptoBloc()..add(InitEvent()),
      child: Builder(builder: (context) {
        return BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) {
            if (state is ShowDataState) {
              return Container(
                  color: theme.backgroundColor,
                  child: SafeArea(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return CryptoTile(cryptoEntity: state.data[index]);
                      },
                      shrinkWrap: true,
                    ),
                  ));
            } else if (state is DataErrorState) {
              return Container(
                color: Colors.blue,
                child: Center(child: Text(easy_local.tr('Error'))),
              );
            } else {
              return Container(
                color: Colors.blue,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                )),
              );
            }
          },
        );
      }),
    );
  }
}
