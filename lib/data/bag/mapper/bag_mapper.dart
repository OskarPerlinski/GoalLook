import 'package:goallook/data/bag/dto/bag_models_dto.dart';
import 'package:goallook/domain/bag/models/bag_models.dart';
import 'package:injectable/injectable.dart';

@injectable
class BagMapper {
  BagModelsDto toDto(BagModels bag) {
    return BagModelsDto(
      name: bag.name,
      size: bag.size,
      jerseyId: bag.jerseyId,
      price: bag.price,
      images: bag.images,
      player: bag.player,
      id: bag.id,
    );
  }

  BagModels toDomain(BagModelsDto dto) {
    return BagModels(
      name: dto.name,
      size: dto.size,
      jerseyId: dto.jerseyId,
      price: dto.price,
      images: dto.images,
      player: dto.player,
      id: dto.id,
    );
  }
}
