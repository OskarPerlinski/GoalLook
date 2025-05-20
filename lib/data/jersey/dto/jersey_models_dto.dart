import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jersey_models_dto.freezed.dart';
part 'jersey_models_dto.g.dart';

@freezed
abstract class JerseyModelsDto with _$JerseyModelsDto {
  const factory JerseyModelsDto({
    @TimestampConverter() required DateTime createdAt,
    required List<String> images,
    required String jerseyId,
    required String leagueId,
    required String name,
    required String player,
    required int price,
    required String season,
    required String size,
    required int sold,
    required String raiting,
  }) = _JerseyModelsDto;

  factory JerseyModelsDto.fromJson(Map<String, dynamic> json) =>
      _$JerseyModelsDtoFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}