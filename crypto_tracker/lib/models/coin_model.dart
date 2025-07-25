import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Coin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String symbol;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String image;

  @JsonKey(name: 'current_price')
  @HiveField(4)
  final double currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  @HiveField(5)
  final double priceChangePercentage24h;

  @JsonKey(name: 'market_cap')
  @HiveField(6)
  final double marketCap;

  @JsonKey(name: 'high_24h')
  @HiveField(7)
  final double high24h;

  @JsonKey(name: 'low_24h')
  @HiveField(8)
  final double low24h;

  @JsonKey(name: 'total_volume')
  @HiveField(9)
  final double totalVolume;

  @JsonKey(name: 'total_supply')
  @HiveField(10)
  final double? totalSupply;

  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.high24h,
    required this.low24h,
    required this.totalVolume,
    this.totalSupply,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
