import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> editUserProfile(String id, Map<String, dynamic> updatedData) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    final response = await http.put(
      Uri.parse('https://blink-backend-service.onrender.com/users/$id'),
      body: jsonEncode(updatedData),
      headers: <String, String> {'Content-Type': 'application/json', 'Authorization':'Bearer $token'});
      
    
    if (response.statusCode == 200) {
      return 'success';
    } else if (response.statusCode == 400) {
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      return errorMessage;


  } 
  else {
      return 'An error occurred, please try again';
    }
  }

 else{
    throw Exception('Login first');
  }
}


Future<Map<String, dynamic>> fetchUserData(String id) async {
   final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  try {
    final response = await http.get(
      Uri.parse('https://blink-backend-service.onrender.com/users/$id'),
      headers: <String, String> {'Content-Type': 'application/json', 'Authorization':'Bearer $token'});
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      // Handle error response
      throw Exception('Failed to fetch user data');
    }
  } catch (err) {
    // Handle error
    throw Exception('Failed to fetch user data');
  }
}
