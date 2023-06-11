import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Challenge {
  final String id;
  final String name;
  final String description;
  final String level;
  final List requirements;
  final List symbols;
  final Object createdBy;

  Challenge({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.requirements,
    required this.symbols,
    required this.createdBy,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      level: json['level'],
       requirements: json['requirements'] ,
      symbols:
          json['symbols'] ,
      createdBy: json['createdBy'],
    );
  }
}

// class Symbol {
//   final String id;
//   final String representation;

//   Symbol({required this.id, required this.representation});

//   factory Symbol.fromJson(Map<String, dynamic> json) {
//     return Symbol(
//       id: json['_id'],
//       representation: json['representation'],
//     );
//   }
// }

Future<List<Challenge>> fetchChallenges() async {

  final String apiUrl = 'https://blink-backend-service.onrender.com/challenges/';
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    final response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return (data as List).map((e) => Challenge.fromJson(e)).toList();
  } else {
    // handle error
    return [];
  }
}
else{
  return [];

}
}

Future<void> deleteChallenge(String id) async {
  final String apiUrl = 'https://blink-backend-service.onrender.com/challenges/$id';
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token != null) {
    await http.delete(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
  }
}


