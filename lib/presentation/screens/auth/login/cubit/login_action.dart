import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_action.freezed.dart';

@freezed
abstract class LoginAction with _$LoginAction{
  const factory LoginAction.showLoading() = LoginShowLoading;
  const factory LoginAction.hideLoading() = LoginHideLoading;
  const factory LoginAction.success() = LoginSuccess;
  const factory LoginAction.showErrorMessage(String message) = LoginShowErrorMessage;
}