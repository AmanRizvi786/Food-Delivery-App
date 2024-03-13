import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    try {
      User? user = _auth.currentUser;
      await user?.delete();
    } catch (e) {
      print("Error deleting user: $e");
      throw e;
    }
  }
}
