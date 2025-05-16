import 'package:freezed_annotation/freezed_annotation.dart';

part 'jersey_action.freezed.dart';

@freezed
abstract class JerseyAction with _$JerseyAction{
  const factory JerseyAction.navigatToDetail(String jerseyId) = JerseyNavigateToDetail;
}