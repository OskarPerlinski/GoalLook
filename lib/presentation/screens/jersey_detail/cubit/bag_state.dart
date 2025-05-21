import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_state.freezed.dart';

@freezed
abstract class BagState with _$BagState{
  const factory BagState.initial() = BagInitial;
}