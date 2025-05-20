import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_collections_action.freezed.dart';

@freezed

abstract class LeagueCollectionsAction with _$LeagueCollectionsAction{
  const factory LeagueCollectionsAction.navigateToDetail(String jerseyId) = LeagueCollectionsNavigateToDetail;
}