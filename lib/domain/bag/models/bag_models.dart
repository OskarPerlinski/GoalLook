import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_models.freezed.dart';

@freezed
abstract class BagModels with _$BagModels {
  const factory BagModels({
    required String name,
    required String size,
    required String jerseyId,
    required int price,
    required List<String> images,
    required String player,
    required String id,
  }) = _BagModels;
}
