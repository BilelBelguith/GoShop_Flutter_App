

import '../user/user.dart';
import 'authenticatable.dart';

class AuthenticationController implements Authenticatable{
  @override
  Future<bool> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();

  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}