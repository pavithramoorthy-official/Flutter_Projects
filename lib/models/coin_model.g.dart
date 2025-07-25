// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinAdapter extends TypeAdapter<Coin> {
  @override
  final int typeId = 0;

  @override
  Coin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coin(
      id: fields[0] as String,
      symbol: fields[1] as String,
      name: fields[2] as String,
      image: fields[3] as String,
      currentPrice: fields[4] as double,
      priceChangePercentage24h: fields[5] as double,
      marketCap: fields[6] as double,
      high24h: fields[7] as double,
      low24h: fields[8] as double,
      totalVolume: fields[9] as double,
      totalSupply: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Coin obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.currentPrice)
      ..writeByte(5)
      ..write(obj.priceChangePercentage24h)
      ..writeByte(6)
      ..write(obj.marketCap)
      ..writeByte(7)
      ..write(obj.high24h)
      ..writeByte(8)
      ..write(obj.low24h)
      ..writeByte(9)
      ..write(obj.totalVolume)
      ..writeByte(10)
      ..write(obj.totalSupply);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      marketCap: (json['market_cap'] as num).toDouble(),
      high24h: (json['high_24h'] as num).toDouble(),
      low24h: (json['low_24h'] as num).toDouble(),
      totalVolume: (json['total_volume'] as num).toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap': instance.marketCap,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'total_volume': instance.totalVolume,
      'total_supply': instance.totalSupply,
    };
