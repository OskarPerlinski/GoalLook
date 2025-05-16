import 'package:goallook/domain/league/models/league_models.dart';

abstract class LeagueRepository {
  Future<List<LeagueModels>> getLeagueCategory();
}