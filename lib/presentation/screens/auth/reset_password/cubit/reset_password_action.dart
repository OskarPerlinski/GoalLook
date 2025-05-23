import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_action.freezed.dart';

@freezed
abstract class ResetPasswordAction with _$ResetPasswordAction{
  const factory ResetPasswordAction.showLoading() = ResetPasswordShowLoading;
  const factory ResetPasswordAction.hideLoading() = ResetPasswordHideLoading;
  const factory ResetPasswordAction.success() = ResetPasswordSuccess;
  const factory ResetPasswordAction.showErrorMessage(String message) = ResetPasswordShowErrorMessage;
}