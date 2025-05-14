import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_action.freezed.dart';

@freezed
abstract class CreateAccountAction with _$CreateAccountAction{
  const factory CreateAccountAction.showLoading() = CreateAccountShowLoading;
  const factory CreateAccountAction.hideLoading() = CreateAccountHideLoading;
  const factory CreateAccountAction.success() = CreateAccountSuccess;
  const factory CreateAccountAction.showErrorMessage(String message) = CreateAccountShowErrorMessage;
}