import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
abstract class CreateAccountState with _$CreateAccountState{
  const factory CreateAccountState.initial({String? errorMessage}) = CreateAccountInitial;
}