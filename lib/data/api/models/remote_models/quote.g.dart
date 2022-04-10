// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteParams _$QuoteParamsFromJson(Map<String, dynamic> json) => QuoteParams(
      json['price'] as num? ?? 0,
      json['volume_24h'] as num? ?? 0,
      json['volume_change_24h'] as num? ?? 0,
      json['percent_change_1h'] as num? ?? 0,
      json['percent_change_24h'] as num? ?? 0,
      json['percent_change_7d'] as num? ?? 0,
      json['market_cap'] as num? ?? 0,
      json['market_cap_dominance'] as num? ?? 0,
      json['fully_diluted_market_cap'] as num? ?? 0,
      json['last_updated'] as String? ?? '',
    );

Map<String, dynamic> _$QuoteParamsToJson(QuoteParams instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'volume_change_24h': instance.volumeChange24h,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
      'market_cap': instance.marketCap,
      'market_cap_dominance': instance.marketCapDominance,
      'fully_diluted_market_cap': instance.fullyDilutedMarketCap,
      'last_updated': instance.lastUpdated,
    };

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      QuoteParams.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'USD': instance.inUsd,
    };
