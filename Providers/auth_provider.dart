import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> checkCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setUser(user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setUser(null);
  }
}
