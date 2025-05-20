import 'package:goallook/domain/jersey/models/jersey_models.dart';

abstract class JerseyRepository {
  Future<List<JerseyModels>> getNewJersey();
  Future<List<JerseyModels>> getTopSellings();
  Future<List<JerseyModels>> getJerseyByCollectionsId(String leagueId);
}
