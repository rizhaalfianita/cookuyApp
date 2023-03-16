//give me class firebaseController AuthServices
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController {
  //give me method login
  @override
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //give me method register
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //give me method logout
  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<Stream<User?>> get firebaseUserStream async {
    return FirebaseAuth.instance.authStateChanges();
  }
}
