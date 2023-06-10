import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import "package:blink/constants.dart";

class Auth {
  Future<String> login(String email, String password) async {
    const String apiUrl = '${API_URL}auth/login';

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        final user = responseData['user'];

        if (user['role'] == 'admin') {
          await saveTokenAndUserDetails(token, user);
          return 'success';
        } else {
          return 'not_authorized';
        }
      } else if (response.statusCode == 401) {
        return 'invalid_credentials';
      } else {
        throw Exception('An error occurred, please try again');
      }
    } catch (e) {
      return 'An error occurred, please try again';
    }
  }

  Future<void> saveTokenAndUserDetails(
      String token, Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    await prefs.setString('userId', user['_id']);
    await prefs.setString('email', user['email']);
    await prefs.setString('firstName', user['firstName']);
    await prefs.setString('lastName', user['lastName']);
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    await prefs.remove('email');
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}