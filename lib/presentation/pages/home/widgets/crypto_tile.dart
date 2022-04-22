import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/application.dart';
import 'package:my_crypto/presentation/pages/home/widgets/mini_chard_builder.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class CryptoTile extends StatelessWidget {
  const CryptoTile({Key? key, required CryptoEntity cryptoEntity})
      : _cryptoEntity = cryptoEntity,
        super(key: key);
  final CryptoEntity _cryptoEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemesBloc>(context).theme;

    return GestureDetector(
      onTap: () {
        getIt<AppRouter>().push(CryptoViewRoute(cryptoEntity: _cryptoEntity));
      },
      child: Container(
          height: 75,
          decoration: BoxDecoration(
              boxShadow: [theme.appShadows.mediumShadow],
              color: theme.cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
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
                          child: Image.network(_cryptoEntity.imageLink)))),
              Expanded(
                flex: 10,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "${_cryptoEntity.name} ",
                        maxLines: 1,
                        style: TextStyle(color: theme.infoTextColor, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${_cryptoEntity.symbol} ",
                        style: TextStyle(color: theme.inactiveTextColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 10, child: MiniChartBuilder(chartData: _cryptoEntity.historicalPrices)),
              Expanded(
                flex: 12,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${_cryptoEntity.currentPrice.toStringAsFixed(3)}',
                          style: TextStyle(color: theme.infoTextColor, fontSize: 17, fontWeight: FontWeight.w500)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            _cryptoEntity.quote.inUsd.percentChange24h.isNegative
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            size: 20,
                            color: _cryptoEntity.quote.inUsd.percentChange24h.isNegative
                                ? theme.wrongColor
                                : theme.rightColor,
                          ),
                          Text('${_cryptoEntity.quote.inUsd.percentChange24h.toStringAsFixed(2)}%',
                              style: TextStyle(
                                  color: _cryptoEntity.quote.inUsd.percentChange24h.isNegative
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
  }
}
