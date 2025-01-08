// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotesModelImpl _$$QuotesModelImplFromJson(Map<String, dynamic> json) =>
    _$QuotesModelImpl(
      quotes: (json['quotes'] as List<dynamic>)
          .map((e) => ListOfQuotes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuotesModelImplToJson(_$QuotesModelImpl instance) =>
    <String, dynamic>{
      'quotes': instance.quotes,
    };

_$ListOfQuotesImpl _$$ListOfQuotesImplFromJson(Map<String, dynamic> json) =>
    _$ListOfQuotesImpl(
      id: (json['id'] as num?)?.toInt(),
      quote: json['quote'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$ListOfQuotesImplToJson(_$ListOfQuotesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'author': instance.author,
    };
