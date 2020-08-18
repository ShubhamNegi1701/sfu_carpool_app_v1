import 'package:firebase_auth/firebase_auth.dart';
import 'package:sfucarpoolapp/Model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FireBaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future logInWithEmailAndPassword( String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      if (user.isEmailVerified) {
        print("Email Verified");
        return _userFromFirebaseUser(user);
      }
      else{
        print("Please verify your email.");
        return false;
      }
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword( String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      if (user != null) await user.sendEmailVerification().then((value) => null);
      return _userFromFirebaseUser(user);
    } catch(e){
        print("An error occurred while trying to send email verification");
        print(e.toString());
        return null;
    }
  }

  //sign out
   Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
   }

}