import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_models_dto.freezed.dart';
part 'bag_models_dto.g.dart';

@freezed
abstract class BagModelsDto with _$BagModelsDto {
  const factory BagModelsDto({
    required String name,
    required String size,
    required String jerseyId,
    required int price,
    required List<String> images,
    required String player,
    required String id,
  }) = _BagModelsDto;

  factory BagModelsDto.fromJson(Map<String, dynamic> json) =>
      _$BagModelsDtoFromJson(json);
}
