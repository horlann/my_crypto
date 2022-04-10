import 'package:my_crypto/data/api/models/remote_models/coin_market_cap/crypto_remote_model.dart';
import 'package:my_crypto/data/api/models/remote_models/quote.dart';

class CryptoEntity {
  CryptoEntity(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.slug,
      required this.imageLink,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.fullyDilutedValuation,
      required this.totalVolume,
      required this.high24h,
      required this.low24h,
      required this.priceChange24h,
      required this.priceChangePercentage24h,
      required this.marketCapChange24h,
      required this.marketCapChangePercentage24h,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.maxSupply,
      required this.ath,
      required this.athChangePercentage,
      required this.athDate,
      required this.atl,
      required this.atlChangePercentage,
      required this.atlDate,
      required this.roi,
      required this.lastUpdated,
      required this.quote,
      required this.historicalPrices
      });

  factory CryptoEntity.fromRemoteModel({required CryptoRemoteModel remoteModel}) => CryptoEntity(
        id: remoteModel.id.toString(),
        symbol: remoteModel.symbol,
        name: remoteModel.name,
      slug: remoteModel.slug,
        imageLink: remoteModel.imageLink,
        currentPrice: remoteModel.quote.inUsd.price,
        marketCap: remoteModel.quote.inUsd.marketCap,
        fullyDilutedValuation: remoteModel.fullyDilutedValuation,
        totalVolume: remoteModel.totalVolume,
        high24h: remoteModel.high24h,
        low24h: remoteModel.low24h,
        priceChange24h: remoteModel.priceChange24h,
        priceChangePercentage24h: remoteModel.priceChangePercentage24h,
        marketCapChange24h: remoteModel.marketCapChange24h,
        circulatingSupply: remoteModel.circulatingSupply,
        totalSupply: remoteModel.totalSupply,
        maxSupply: remoteModel.maxSupply,
        ath: remoteModel.ath,
        athChangePercentage: remoteModel.athChangePercentage,
        // athDate: DateTime.parse(remoteModel.athDate),
        athDate: DateTime.now(),
        atl: remoteModel.atl,
        atlChangePercentage: remoteModel.atlChangePercentage,
        // atlDate: DateTime.parse(remoteModel.atlDate),
        atlDate: DateTime.now(),
        roi: remoteModel.roi,
        //lastUpdated: DateTime.parse(remoteModel.lastUpdated),
        lastUpdated: DateTime.now(),
        marketCapChangePercentage24h: remoteModel.marketCapChangePercentage24h,
        marketCapRank: remoteModel.marketCapRank,
      quote:remoteModel.quote,
      historicalPrices:remoteModel.historicalPrices
      );

  CryptoEntity copyWith({
    String? id,
    String? symbol,
    String? name,
    String? slug,
    String? imageLink,
    num? marketCap,
    num? currentPrice,
    num? marketCapRank,
    num? fullyDilutedValuation,
    num? totalVolume,
    num? high24h,
    num? low24h,
    num? priceChange24h,
    num? priceChangePercentage24h,
    num? marketCapChange24h,
    num? marketCapChangePercentage24h,
    num? circulatingSupply,
    num? totalSupply,
    num? maxSupply,
    num? ath,
    num? athChangePercentage,
    DateTime? athDate,
    num? atl,
    num? atlChangePercentage,
    DateTime? atlDate,
    num? roi,
    DateTime? lastUpdated,
    Quote? quote,
    List<List<num>>? historicalPrices
  }) {
    return CryptoEntity(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        imageLink: imageLink ?? this.imageLink,
        marketCap: marketCap ?? this.marketCap,
        currentPrice: currentPrice ?? this.currentPrice,
        marketCapRank: marketCapRank ?? this.marketCapRank,
        fullyDilutedValuation: fullyDilutedValuation ?? this.fullyDilutedValuation,
        totalVolume: totalVolume ?? this.totalVolume,
        high24h: high24h ?? this.high24h,
        low24h: low24h ?? this.low24h,
        priceChange24h: priceChange24h ?? this.priceChange24h,
        priceChangePercentage24h: priceChangePercentage24h ?? this.priceChangePercentage24h,
        marketCapChange24h: marketCapChange24h ?? this.marketCapChange24h,
        marketCapChangePercentage24h: marketCapChangePercentage24h ?? this.marketCapChangePercentage24h,
        circulatingSupply: circulatingSupply ?? this.circulatingSupply,
        totalSupply: totalSupply ?? this.totalSupply,
        maxSupply: maxSupply ?? this.maxSupply,
        ath: ath ?? this.ath,
        athChangePercentage: athChangePercentage ?? this.athChangePercentage,
        athDate: athDate ?? this.athDate,
        atl: atl ?? this.atl,
        atlChangePercentage: atlChangePercentage ?? this.atlChangePercentage,
        atlDate: atlDate ?? this.atlDate,
        roi: roi ?? this.roi,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        quote: quote ?? this.quote,
        historicalPrices: historicalPrices ?? this.historicalPrices
    );
  }

  final String id;
  final String symbol;
  final String name;
  final String slug;
  final String imageLink;
  final num currentPrice;
  final num marketCap;
  final num marketCapRank;
  final num fullyDilutedValuation;
  final num totalVolume;
  final num high24h;
  final num low24h;
  final num priceChange24h;
  final num priceChangePercentage24h;
  final num marketCapChange24h;
  final num marketCapChangePercentage24h;
  final num circulatingSupply;
  final num totalSupply;
  final num maxSupply;
  final num ath;
  final num athChangePercentage;
  final DateTime athDate;
  final num atl;
  final num atlChangePercentage;
  final DateTime atlDate;
  final dynamic roi;
  final DateTime lastUpdated;
  final Quote quote;
  final List<List<num>> historicalPrices;

}
