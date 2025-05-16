import 'package:freezed_annotation/freezed_annotation.dart';

part 'jersey_models.freezed.dart';

@freezed
abstract class JerseyModels with _$JerseyModels{
  const factory JerseyModels({
    required DateTime createdAt,
    required List<String> images,
    required String jerseyId,
    required String leagueId,
    required String name,
    required String player,
    required int price,
    required String season,
    required List<String> size,
    required int sold,
  }) = _JerseyModels;
}