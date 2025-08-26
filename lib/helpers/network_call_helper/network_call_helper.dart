import 'package:firebase_auth/firebase_auth.dart';

abstract class NetworkCallHelper {
  // =========================
  // 🔹 Firestore
  // =========================

  /// Create or overwrite a document.

  // =========================
  // 🔹 Firebase Auth
  // =========================

  /// Signup with email + save user data.
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  });

  /// Login with email & password → returns user doc.
  Future<UserCredential> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserCredential> loginWithGoogle();
}
