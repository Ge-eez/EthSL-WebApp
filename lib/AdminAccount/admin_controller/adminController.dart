import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AdminService {
  Future<String> createAdminAccount(Map<String, dynamic> adminData) async {
    final String apiUrl =
        'https://blink-backend-service.onrender.com/users/';
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if(token != null){
      final response = await http.post(Uri.parse(apiUrl),
        body: json.encode(adminData),
        headers: <String, String> {'Content-Type': 'application/json', 'Authorization':'Bearer $token'});

    if (response.statusCode == 201) {
      return 'success'; // Empty string indicates successful account creation
    } else if (response.statusCode == 400) {
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      return errorMessage;
    } else {
      return 'An error occurred, please try again';
    }
  }
  else{
    throw Exception('Login first');
  }

    }

    

    
}

