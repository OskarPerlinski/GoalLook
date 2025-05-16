import 'package:goallook/data/league/dto/league_models_dto.dart';
import 'package:goallook/domain/league/models/league_models.dart';
import 'package:injectable/injectable.dart';

@injectable
class LeagueMapper {
  LeagueModelsDto toDto(LeagueModels league) {
    return LeagueModelsDto(
      name: league.name,
      leagueId: league.leagueId,
      image: league.image,
    );
  }

  LeagueModels toDomain(LeagueModelsDto dto) {
    return LeagueModels(
      name: dto.name,
      image: dto.image,
      leagueId: dto.leagueId,
    );
  }
}
