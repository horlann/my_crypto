import 'package:json_annotation/json_annotation.dart';

part 'crypto_remote_model_from_coingecko.g.dart';

@JsonSerializable()
class CryptoRemoteModelFromCoinGecko {
  CryptoRemoteModelFromCoinGecko({
    required this.id,
    required this.symbol,
    required this.name,
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
  });

  factory CryptoRemoteModelFromCoinGecko.fromJson(Map<String, dynamic> json) =>
      _$CryptoRemoteModelFromCoinGeckoFromJson(json);

  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'symbol', defaultValue: 'symbol')
  final String symbol;

  @JsonKey(name: 'name', defaultValue: 'name')
  final String name;

  @JsonKey(name: 'image', defaultValue: '')
  final String imageLink;

  @JsonKey(name: 'current_price', defaultValue: 0)
  final num currentPrice;

  @JsonKey(name: 'market_cap', defaultValue: 0)
  final num marketCap;

  @JsonKey(name: 'market_cap_rank', defaultValue: 0)
  final num marketCapRank;

  @JsonKey(
    name: 'fully_diluted_valuation',
    defaultValue: 0,
  )
  final num fullyDilutedValuation;

  @JsonKey(name: 'total_volume', defaultValue: 0)
  final num totalVolume;

  @JsonKey(name: 'high_24h', defaultValue: 0)
  final num high24h;

  @JsonKey(name: 'low_24h', defaultValue: 0)
  final num low24h;

  @JsonKey(name: 'price_change_24h', defaultValue: 0)
  final num priceChange24h;

  @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
  final num priceChangePercentage24h;

  @JsonKey(name: 'market_cap_change_24h', defaultValue: 0)
  final num marketCapChange24h;

  @JsonKey(name: 'market_cap_change_percentage_24h', defaultValue: 0)
  final num marketCapChangePercentage24h;

  @JsonKey(name: 'circulating_supply', defaultValue: 0)
  final num circulatingSupply;

  @JsonKey(name: 'total_supply', defaultValue: 0)
  final num totalSupply;

  @JsonKey(name: 'max_supply', defaultValue: 0)
  final num maxSupply;

  @JsonKey(name: 'ath', defaultValue: 0)
  final num ath;

  @JsonKey(name: 'ath_change_percentage', defaultValue: 0)
  final num athChangePercentage;

  @JsonKey(name: 'ath_date', defaultValue: '')
  final String athDate;

  @JsonKey(name: 'atl', defaultValue: 0)
  final num atl;

  @JsonKey(name: 'atl_change_percentage', defaultValue: 0)
  final num atlChangePercentage;

  @JsonKey(name: 'atl_date', defaultValue: '')
  final String atlDate;

  @JsonKey(name: 'roi', defaultValue: 0)
  final dynamic roi;

  @JsonKey(name: 'last_updated', defaultValue: '')
  final String lastUpdated;
}
