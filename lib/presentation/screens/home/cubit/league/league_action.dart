import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_action.freezed.dart';

@freezed
abstract class LeagueAction with _$LeagueAction{
  const factory LeagueAction.navigateToDetail(String leagueId) = LeagueNavigateToDetail;
}