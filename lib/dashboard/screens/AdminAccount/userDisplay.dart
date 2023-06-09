// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// void main() => runApp(userDisplay());

// class userDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//        );
//   }
// }

// class UserDisplay extends StatefulWidget { 

//   @override
//   _UserDisplay createState() => _UserDisplayState();
// }



// class _UserDisplay extends State<UserDisplay> {
//   late Database _database;
//   List<Map> _users = [];

//   @override
//   void initState() {
//     super.initState();
//     _initDatabase();
//   }

//   void _initDatabase() async {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'demo.db');

//     // Delete the database
//     await deleteDatabase(path);

//     // open the database
//     _database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute(
//           'CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER,Phone Number)');
//     });

//     // Add some users to the database
//     // await _database.transaction((txn) async {
//     //   int id1 = await txn.rawInsert(
//     //       'INSERT INTO Users(name, age) VALUES("Alice", 25)');
//     //   int id2 = await txn.rawInsert(
//     //       'INSERT INTO Users(name, age) VALUES("Bob", 32)');
//     //   int id3 = await txn.rawInsert(
//     //       'INSERT INTO Users(name, age) VALUES("Charlie", 42)');
//     // });

//     // Query the users from the database
//     List<Map> users = await _database.rawQuery('SELECT * FROM Users');
//     setState(() {
//       _users = users;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: DataTable(
//           columns: [
//             DataColumn(label: Text('ID')),
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('Age')),
//             DataColumn(label: Text('Phone Number')),
//             DataColumn(label:Text('Email'),)
//           ],
//           rows: _users.map((user) => DataRow(cells: [
//                 DataCell(Text(user['id'].toString())),
//                 DataCell(Text(user['name'])),
//                 DataCell(Text(user['age'].toString())),
//                 DataCell(Text(user['Phone Number'].toString())),
//                 DataCell(Text(user['Email'])),
//               ])).toList(),
//         ),
//       ),
//     );
//   }
// }
