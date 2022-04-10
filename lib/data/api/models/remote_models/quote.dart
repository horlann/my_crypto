import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class QuoteParams {
  @JsonKey(name: 'price', defaultValue: 0)
  final num price;

  @JsonKey(name: 'volume_24h', defaultValue: 0)
  final num volume24h;

  @JsonKey(name: 'volume_change_24h', defaultValue: 0)
  final num volumeChange24h;

  @JsonKey(name: 'percent_change_1h', defaultValue: 0)
  final num percentChange1h;

  @JsonKey(name: 'percent_change_24h', defaultValue: 0)
  final num percentChange24h;

  @JsonKey(name: 'percent_change_7d', defaultValue: 0)
  final num percentChange7d;

  @JsonKey(name: 'market_cap', defaultValue: 0)
  final num marketCap;

  @JsonKey(name: 'market_cap_dominance', defaultValue: 0)
  final num marketCapDominance;

  @JsonKey(name: 'fully_diluted_market_cap', defaultValue: 0)
  final num fullyDilutedMarketCap;
  @JsonKey(name: 'last_updated', defaultValue: '')
  final String lastUpdated;

  QuoteParams(this.price, this.volume24h, this.volumeChange24h, this.percentChange1h, this.percentChange24h,
      this.percentChange7d, this.marketCap, this.marketCapDominance, this.fullyDilutedMarketCap, this.lastUpdated);

  factory QuoteParams.fromJson(Map<String, dynamic> json) => _$QuoteParamsFromJson(json);
}
@JsonSerializable()
class Quote{
  @JsonKey(name: 'USD',)
  final QuoteParams inUsd;
//
//  final QuoteParams inCurrent;

  Quote(this.inUsd,
   //   this.inCurrent
      );
  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

}