import 'package:goallook/data/jersey/dto/jersey_models_dto.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';
import 'package:injectable/injectable.dart';

@injectable
class JerseyMapper {
  JerseyModelsDto toDto(JerseyModels jersey) {
    return JerseyModelsDto(
      createdAt: jersey.createdAt,
      images: jersey.images,
      jerseyId: jersey.jerseyId,
      leagueId: jersey.leagueId,
      name: jersey.name,
      player: jersey.player,
      price: jersey.price,
      season: jersey.season,
      size: jersey.size,
      sold: jersey.sold,
    );
  }

  JerseyModels toDomain(JerseyModelsDto dto) {
    return JerseyModels(
      createdAt: dto.createdAt,
      images: dto.images,
      jerseyId: dto.jerseyId,
      leagueId: dto.leagueId,
      name: dto.name,
      player: dto.player,
      price: dto.price,
      season: dto.season,
      size: dto.size,
      sold: dto.sold,
    );
  }
}
