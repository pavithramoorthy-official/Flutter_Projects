import 'package:clean_architecture/feature/quotes/domain/entity/quotes_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  const factory QuotesModel({
    @JsonKey(name: 'quotes') required List<ListOfQuotes> quotes,
  }) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);

    const QuotesModel._();

  QuotesEntity toDomain() {
    return QuotesEntity(
      quotes: quotes,
    );
  }
}

@freezed
class ListOfQuotes with _$ListOfQuotes {
  const factory ListOfQuotes({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'quote') required String? quote,
    @JsonKey(name: 'author') required String? author,
  }) = _ListOfQuotes;

  factory ListOfQuotes.fromJson(Map<String, dynamic> json) =>
      _$ListOfQuotesFromJson(json);
}
