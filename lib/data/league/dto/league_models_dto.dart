import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_models_dto.freezed.dart';
part 'league_models_dto.g.dart';

@freezed
abstract class LeagueModelsDto with _$LeagueModelsDto{
  const factory LeagueModelsDto({
    required String name,
    required String leagueId,
    required String image,
  }) = _LeagueModelsDto;

  factory LeagueModelsDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueModelsDtoFromJson(json);
}
