import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/quotes_model.dart';
part 'quotes_entity.freezed.dart';
part 'quotes_entity.g.dart';

@freezed
class QuotesEntity with _$QuotesEntity{
  const factory QuotesEntity({
    required List<ListOfQuotes> quotes,
}) = _QuotesEntity;

  factory QuotesEntity.fromJson(Map<String, dynamic> json) => _$QuotesEntityFromJson(json);
}
