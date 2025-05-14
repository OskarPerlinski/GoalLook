import 'package:goallook/domain/auth/auth_exception/auth_exception.dart';
import 'package:goallook/domain/auth/repository/auth_repository.dart';
import 'package:goallook/presentation/screens/auth/login/cubit/login_action.dart';
import 'package:goallook/presentation/screens/auth/login/cubit/login_state.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends ActionCubit<LoginState, LoginAction> {
  LoginCubit(this._authRepository) : super(LoginState.initial());

  final AuthRepository _authRepository;

  Future<void> getSignIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginInitial(errorMessage: 'Please fill in all fields.'));
      return;
    }
    dispatch(LoginAction.showLoading());
    try {
      await _authRepository.getSignIn(email, password);
      dispatch(LoginAction.success());
    } on AuthException catch (e) {
      emit(LoginInitial(errorMessage: e.message));
    } catch (e) {
      dispatch(LoginShowErrorMessage('Failed to login.'));
    } finally {
      dispatch(LoginAction.hideLoading());
    }
  }
}
