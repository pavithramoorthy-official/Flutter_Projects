import 'package:json_annotation/json_annotation.dart';

import 'coin_model.dart';

part 'top_gainers_response.g.dart';

@JsonSerializable()
class TopGainersResponse {
  @JsonKey(name: 'top_gainers')
  final List<Coin> topGainers;

  TopGainersResponse({required this.topGainers});
  factory TopGainersResponse.fromJson(Map<String, dynamic> json) =>
      _$TopGainersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TopGainersResponseToJson(this);
}
