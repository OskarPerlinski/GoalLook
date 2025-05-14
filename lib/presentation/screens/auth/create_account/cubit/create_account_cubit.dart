import 'package:goallook/domain/auth/auth_exception/auth_exception.dart';
import 'package:goallook/domain/auth/repository/auth_repository.dart';
import 'package:goallook/presentation/screens/auth/create_account/cubit/create_account_action.dart';
import 'package:goallook/presentation/screens/auth/create_account/cubit/create_account_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAccountCubit
    extends ActionCubit<CreateAccountState, CreateAccountAction> {
  CreateAccountCubit(this._authRepository)
    : super(CreateAccountState.initial());

  final AuthRepository _authRepository;

  Future<void> getSignUpWithEmail(
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (password != confirmPassword) {
      emit(CreateAccountInitial(errorMessage: 'Passwords do not match'));
      return;
    }

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      emit(CreateAccountInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }

    dispatch(CreateAccountAction.showLoading());
    try {
      await _authRepository.getSignUpWithEmail(email, password);
      dispatch(CreateAccountAction.success());
    } on AuthException catch (e) {
      emit(CreateAccountInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(CreateAccountAction.showErrorMessage('Failed to register.'));
    } finally {
      dispatch(CreateAccountAction.hideLoading());
    }
  }
}
