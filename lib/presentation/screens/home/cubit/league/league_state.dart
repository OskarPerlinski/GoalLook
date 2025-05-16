import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goallook/domain/league/models/league_models.dart';

part 'league_state.freezed.dart';

@freezed
abstract class LeagueState with _$LeagueState{
  const factory LeagueState.loading() = LeagueLoading;
  const factory LeagueState.loaded(List<LeagueModels> league) = LeagueLoaded;
  const factory LeagueState.error(String message) = LeagueError;
}