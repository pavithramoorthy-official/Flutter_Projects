// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_gainers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopGainersResponse _$TopGainersResponseFromJson(Map<String, dynamic> json) =>
    TopGainersResponse(
      topGainers: (json['top_gainers'] as List<dynamic>)
          .map((e) => Coin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopGainersResponseToJson(TopGainersResponse instance) =>
    <String, dynamic>{
      'top_gainers': instance.topGainers,
    };
