import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goallook/domain/bag/models/bag_models.dart';

part 'bag_jersey_state.freezed.dart';

@freezed
abstract class BagJerseyState with _$BagJerseyState{
  const factory BagJerseyState.loading() = BagJerseyLoading;
  const factory BagJerseyState.loaded(List<BagModels> bag) = BagJerseyLoaded;
  const factory BagJerseyState.error(String message) = BagJerseyError;
}