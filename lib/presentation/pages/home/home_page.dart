import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_bloc.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_event.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_state.dart';
import 'package:my_crypto/presentation/pages/home/widgets/crypto_tile.dart';
import 'package:my_crypto/presentation/pages/home/widgets/live_charts_widget.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemesBloc>(context).theme;

    return Container(
      color: theme.backgroundColor,
      child: BlocProvider(
        create: (context) => CryptoBloc()..add(InitEvent()),
        child: Builder(builder: (context) {
          return BlocBuilder<CryptoBloc, CryptoState>(
            builder: (context, state) {
              if (state is ShowDataState) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          LifeChartWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            itemCount: state.data.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                                  child: Slidable(
                                    child: CryptoTile(cryptoEntity: state.data[index]),
                                    key: ValueKey(index),
                                    startActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      dismissible: DismissiblePane(onDismissed: () {}),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {},
                                          backgroundColor: const Color(0xFF21B7CA),
                                          foregroundColor: Colors.white,
                                          icon: Icons.share,
                                          label: easy_local.tr('add_to_favorite'),
                                        ),
                                      ],
                                    ),
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          // An action can be bigger than the others.
                                          onPressed: (context) {},
                                          backgroundColor: const Color(0xFF7BC043),
                                          foregroundColor: Colors.white,
                                          icon: Icons.archive,
                                          label: 'Archive',
                                        ),
                                        SlidableAction(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                                          onPressed: (context) {},
                                          backgroundColor: const Color(0xFF0392CF),
                                          foregroundColor: Colors.white,
                                          icon: Icons.save,
                                          label: 'Save',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is DataErrorState) {
                return Center(child: Text(easy_local.tr('Error')));
              } else {
                return Center(
                    child: SpinKitWanderingCubes(
                  color: theme.accentColor,
                ));
              }
            },
          );
        }),
      ),
    );
  }
}
