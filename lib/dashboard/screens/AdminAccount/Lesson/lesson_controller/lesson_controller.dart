import 'package:blink/Dashboard/Screens/AdminAccount/Lesson/createLesson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lesson {
  final String id;
  final String name;
  final String description;
  final String level;
  final List prerequisites;
  final List symbols;
  final String createdBy;
  final String createdAt;
  final String updatedAt;

  Lesson({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.symbols,
    required this.prerequisites,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      level: json['level'],
      symbols: json['symbols'],
      prerequisites: json['prerequisites'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

Future<String> createLesson(Map<String, dynamic> lessonData) async {
  final String apiUrl = 'https://blink-backend-service.onrender.com/lessons/';
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    final response = await http.post(Uri.parse(apiUrl),
        body: json.encode(lessonData),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 201) {
      return 'success'; // Empty string indicates successful account creation
    } else if (response.statusCode == 400) {
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      return errorMessage;
    } else {
      return 'An error occurred, please try again';
    }
  } else {
    throw Exception('Login first');
  }
}

Future<List<Lesson>> fetchLessons() async {
  final String apiUrl = 'https://blink-backend-service.onrender.com/lessons/';
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    final response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
        print(response);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List).map((e) => Lesson.fromJson(e)).toList();

    } else {
      // Handle error response
      print('here');
      return [];
    }
  } else {
    // Handle error
    return [];
  }
}
