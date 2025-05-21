import 'package:freezed_annotation/freezed_annotation.dart';

part 'bag_action.freezed.dart';

@freezed
abstract class BagAction with _$BagAction{
  const factory BagAction.showLoading() = BagShowLoading;
  const factory BagAction.hideLoading() = BagHideLoading;
  const factory BagAction.success() = BagSuccess;
  const factory BagAction.showErrorMessage(String message) = BagShowErrorMessage;
}