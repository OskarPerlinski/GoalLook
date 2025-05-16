import 'package:goallook/data/league/datasource/league_data_source.dart';
import 'package:goallook/data/league/dto/league_models_dto.dart';
import 'package:goallook/data/league/mapper/league_mapper.dart';
import 'package:goallook/domain/league/models/league_models.dart';
import 'package:goallook/domain/league/repository/league_repository.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: LeagueRepository)
class LeagueRepositoryImpl implements LeagueRepository {
  LeagueRepositoryImpl(this._leagueMapper, this._leagueDataSource);
  final LeagueDataSource _leagueDataSource;
  final LeagueMapper _leagueMapper;
  @override
  Future<List<LeagueModels>> getLeagueCategory() async {
    final response = await _leagueDataSource.getLeagueCategory();
    return response.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final dto = LeagueModelsDto.fromJson(data);
      return _leagueMapper.toDomain(dto);
    }).toList();
  }
}
