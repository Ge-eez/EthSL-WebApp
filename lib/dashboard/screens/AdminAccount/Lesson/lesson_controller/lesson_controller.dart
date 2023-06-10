 import 'package:blink/Dashboard/Screens/AdminAccount/Lesson/createLesson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Lesson{
 Future<String> createLesson(Map<String, dynamic> lessonData) async {
    final String apiUrl =
        'https://blink-backend-service.onrender.com/lessons/';
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if(token != null){
      final response = await http.post(Uri.parse(apiUrl),
        body: json.encode(lessonData),
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



Future<List<String>> fetchLessons() async {
  final String apiUrl =
        'https://blink-backend-service.onrender.com/lessons/';
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
if (token != null) {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String> {'Content-Type': 'application/json', 'Authorization':'Bearer $token'}
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map((e) => e['name']).toList().cast<String>();
    } else {
      // Handle error response
      return [];
    }
  } else{
    // Handle error
    return [];
  }
}



    
    
    }

    

    


