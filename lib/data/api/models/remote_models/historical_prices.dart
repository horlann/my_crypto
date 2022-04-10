import 'package:json_annotation/json_annotation.dart';
part 'historical_prices.g.dart';

@JsonSerializable()
class HistoricalPrices{
  final int timesTemp;
  final num price;

  HistoricalPrices(this.timesTemp, this.price);
}