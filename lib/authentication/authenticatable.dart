

import '../user/user.dart';

class Authenticatable {

  Future <User> register(String email , String password){
  throw'';
  }

  Future <bool> login (String email , String password ){
  throw'';
  }

  Future<bool> resetPassword(String email){
    throw'';
  }

  Future<User> updateProfile (User user){
    throw'';
  }


}