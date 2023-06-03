import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './Auth/login.dart';
import 'Dashboard/mainDashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAU8_zacrj6F1YltkTlLl8wXilt98GFiu0",
        appId: "1:334336429899:web:332cab1d840c66f9ade2ce",
        messagingSenderId: "334336429899",
        projectId: "blinkweb-3bbce"),
  );

  runApp(MaterialApp(
    home: Dashboard(),
  ));
}
