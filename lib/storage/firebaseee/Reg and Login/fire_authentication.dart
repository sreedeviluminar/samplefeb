import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  Future<String?> signUp(
      {required String mail, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: mail, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signIn({required String mail, required String pass}) async {
    try {
      await auth.signInWithEmailAndPassword(email: mail, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
