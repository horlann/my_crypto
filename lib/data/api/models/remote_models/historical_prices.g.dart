// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricalPrices _$HistoricalPricesFromJson(Map<String, dynamic> json) =>
    HistoricalPrices(
      json['timesTemp'] as int,
      json['price'] as num,
    );

Map<String, dynamic> _$HistoricalPricesToJson(HistoricalPrices instance) =>
    <String, dynamic>{
      'timesTemp': instance.timesTemp,
      'price': instance.price,
    };
