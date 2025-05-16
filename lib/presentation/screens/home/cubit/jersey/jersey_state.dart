import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goallook/domain/jersey/models/jersey_models.dart';

part 'jersey_state.freezed.dart';

@freezed
abstract class JerseyState with _$JerseyState {
  const factory JerseyState.loading() = JerseyLoading;
  const factory JerseyState.loaded(List<JerseyModels> jersey) = JerseyLoaded;
  const factory JerseyState.error(String message) = JerseyError;
}
