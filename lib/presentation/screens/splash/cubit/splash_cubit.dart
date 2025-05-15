import 'package:goallook/domain/user/repository/user_repository.dart';
import 'package:goallook/presentation/screens/splash/cubit/splash_action.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends ActionCubit<int, SplashAction> {
  SplashCubit(this._userRepository) : super(0);

  final UserRepository _userRepository;

  void checkIfLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    final isAuthenticated = _userRepository.isLoggedIn;
    if (isAuthenticated) {
      dispatch(const SplashAction.authenticated());
    } else {
      dispatch(const SplashAction.unAuthenticated());
    }
  }
}
