import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:task/helpers/network_call_helper/network_call_helper.dart';
import 'package:task/util/exceptions/message_exception.dart';

@LazySingleton(as: NetworkCallHelper)
class FirebaseHelperImpl implements NetworkCallHelper {
  final Logger logger;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseHelperImpl({required this.logger});

  // =========================
  // 🔹 Firestore
  // =========================

  // =========================
  // 🔹 Firebase Auth
  // =========================

  @override
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      logger.i(
          'User signed up and data stored for UID: ${userCredential.user!.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e('Sign-up error: $e');
      throw MessageException(message: e.message ?? 'Unknown signup error');
    }
  }

  @override
  Future<UserCredential> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      logger.i('User logged in with email: $email');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e('Login error: $e');
      throw MessageException(message: e.message ?? 'Unknown login error');
    }
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    try {
      // Trigger Google Sign In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw MessageException(message: 'Google sign-in aborted by user');
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final userCredential = await _auth.signInWithCredential(credential);

      logger.i(
          'User logged in with Google: ${userCredential.user?.email ?? "Unknown"}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e('Google login error: $e');
      throw MessageException(
          message: e.message ?? 'Unknown Google login error');
    } catch (e) {
      logger.e('Google login failed: $e');
      throw MessageException(message: e.toString());
    }
  }
}
