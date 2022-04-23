import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  //return one object of firebase auth(check)
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;

  // Future<String> getCurrentUser() async{
  //   String uid = await _firebaseAuth.currentUser!.uid;
  //   return uid ;
  // }


  signIn( String email , String password)async{
    var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    print(user);
    return user ; 
  }

  register(String email , String password)async{
    var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user ;

  }

}