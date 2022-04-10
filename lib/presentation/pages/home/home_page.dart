import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_bloc.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_event.dart';
import 'package:my_crypto/presentation/blocs/crypto/crypto/crypto_state.dart';
import 'package:my_crypto/presentation/pages/home/widgets/mini_chard_builder.dart';
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
                        return GestureDetector(
                          onTap: () {
                            appRouter.pushNamed('cryptoView');
                          },
                          child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                boxShadow: [theme.appShadows.mediumShadow],
                                  color: theme.cardColor, borderRadius: const BorderRadius.all(Radius.circular(16))),
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                 Expanded(
                                      flex: 9,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(shape: BoxShape.circle),
                                              child: Image.network(state.data[index].imageLink)))),
                                  Expanded(
                                    flex: 10,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            "${state.data[index].name} ",
                                            maxLines: 1,
                                            style: TextStyle(color: theme.infoTextColor, fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${state.data[index].symbol} ",
                                            style: TextStyle(color: theme.inactiveTextColor, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 10,
                                      child: MiniChartBuilder(chartData: state.data[index].historicalPrices)),
                                  Expanded(
                                    flex: 12,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('\$${state.data[index].currentPrice.toStringAsFixed(3)}',
                                              style: TextStyle(
                                                  color: theme.infoTextColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                state.data[index].quote.inUsd.percentChange24h.isNegative
                                                    ? Icons.arrow_drop_down
                                                    : Icons.arrow_drop_up,
                                                size: 20,
                                                color: state.data[index].quote.inUsd.percentChange24h.isNegative
                                                    ? theme.wrongColor
                                                    : theme.rightColor,
                                              ),
                                              Text(
                                                  '${state.data[index].quote.inUsd.percentChange24h.toStringAsFixed(2)}%',
                                                  style: TextStyle(
                                                      color: state.data[index].quote.inUsd.percentChange24h.isNegative
                                                          ? theme.wrongColor
                                                          : theme.rightColor,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
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
