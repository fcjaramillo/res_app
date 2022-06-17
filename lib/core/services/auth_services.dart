import 'package:firebase_auth/firebase_auth.dart';
import 'package:res_app/ui/utils/constants/constants.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> singIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return kSignedIn;
    } on FirebaseAuthException catch (e) {
      return e.message ?? kError;
    }
  }

  Future<String> singUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return kSignedUp;
    } on FirebaseAuthException catch (e) {
      return e.message ?? kError;
    }
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }
}
