import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<void> signInWithEmailAndPassword(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(user);
    // you can also store the user in Database
  }
}