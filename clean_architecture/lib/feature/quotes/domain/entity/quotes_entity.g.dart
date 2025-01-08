// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotesEntityImpl _$$QuotesEntityImplFromJson(Map<String, dynamic> json) =>
    _$QuotesEntityImpl(
      quotes: (json['quotes'] as List<dynamic>)
          .map((e) => ListOfQuotes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuotesEntityImplToJson(_$QuotesEntityImpl instance) =>
    <String, dynamic>{
      'quotes': instance.quotes,
    };
