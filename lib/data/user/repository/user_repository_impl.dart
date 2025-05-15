import 'package:goallook/data/user/datasource/user_data_source.dart';
import 'package:goallook/domain/user/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  @override
  Future<bool> checkIfUserExists(String uid) async {
    return _userDataSource.checkIfUserExists(uid);
  }

  @override
  Future<void> createUser(String uid, String email) async {
    return _userDataSource.createUser(uid, email);
  }
  
  @override
  bool get isLoggedIn => _userDataSource.isLoggedIn;
}
