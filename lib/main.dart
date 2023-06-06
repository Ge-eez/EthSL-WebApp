import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './Auth/login.dart';
import 'Dashboard/mainDashboard.dart';

void main() async {
  
  runApp(MaterialApp(
    home: LoginPage(),
    routes: {
    '/admin_dashboard': (context) => Dashboard(),
  },
  ));
}
