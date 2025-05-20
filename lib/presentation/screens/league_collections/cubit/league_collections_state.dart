import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';

part 'league_collections_state.freezed.dart';

@freezed
abstract class LeagueCollectionsState with _$LeagueCollectionsState{
  const factory LeagueCollectionsState.loading() = LeagueCollectionsLoading;
  const factory LeagueCollectionsState.loaded(List<JerseyModels> jersey) = LeagueCollectionsLoaded;
  const factory LeagueCollectionsState.error(String message) = LeagueCollectionsError;
}