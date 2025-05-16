import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_models.freezed.dart';

@freezed
abstract class LeagueModels with _$LeagueModels{
  const factory LeagueModels({
    required String name,
    required String image,
    required String leagueId,
  }) = _LeagueModels;
}