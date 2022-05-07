import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  //return one object of firebase auth(check)
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;

    signOut() async{
    await _firebaseAuth.signOut();

    }

  String getuid (){
    final useruid = _firebaseAuth.currentUser!.uid;
    print(useruid);
    return useruid ;
  }

  Future<String> getCurrentUser () async {
    User user = await _firebaseAuth.currentUser!;
    print(user);
    return user.uid ;
  }

  Future<User?> signIn( String email , String password)async{
    UserCredential userCredential= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user ;
  }

  Future<User?> register(String email , String password)async{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user ;

  }

}