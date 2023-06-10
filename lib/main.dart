import 'package:blink/Dashboard/Screens/AdminAccount/Lesson/createLesson.dart';

import 'package:flutter/material.dart';
import './Auth/login.dart';
import 'Dashboard/mainDashboard.dart';

void main() async {
  
  runApp(MaterialApp(
    home: Dashboard(),
    routes: {
    '/admin_dashboard': (context) => Dashboard(),
    '/createLesson':(context) => CreateLesson(),
    '/login':(context) => LoginPage()
    
  },
  ));
}
