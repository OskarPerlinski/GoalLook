import 'package:goallook/domain/auth/auth_exception/auth_exception.dart';
import 'package:goallook/domain/auth/repository/auth_repository.dart';
import 'package:goallook/presentation/screens/auth/reset_password/cubit/reset_password_action.dart';
import 'package:goallook/presentation/screens/auth/reset_password/cubit/reset_password_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit
    extends ActionCubit<ResetPasswordState, ResetPasswordAction> {
  ResetPasswordCubit(this._authRepository)
    : super(ResetPasswordState.initial());

  final AuthRepository _authRepository;

  Future<void> resetPassword(String email) async {
    if (email.isEmpty) {
      emit(ResetPasswordInitial(errorMessage: 'Please enter email.'));
      return;
    }

    dispatch(ResetPasswordAction.showLoading());
    try {
      await _authRepository.resetPassword(email);
      dispatch(ResetPasswordAction.success());
    } on AuthException catch (e) {
      emit(ResetPasswordState.initial(errorMessage: e.message));
    } catch (e) {
      dispatch(ResetPasswordAction.showErrorMessage('Failed to send email.'));
    } finally {
      dispatch(ResetPasswordAction.hideLoading());
    }
  }
}
