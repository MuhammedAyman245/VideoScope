import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> signInwithEmail(String email, String password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        print(user);
      } else {
        print('shit');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User> SignUpWithEmail(
      String email, String password, String name) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await auth.signOut();
  }
}
