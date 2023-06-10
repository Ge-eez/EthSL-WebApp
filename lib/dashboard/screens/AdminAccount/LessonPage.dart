// import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';

// void main() => runApp(MaterialApp(home: SimpleDataTable()));

// class QuizForm extends StatefulWidget {
//   const QuizForm({Key? key}) : super(key: key);

//   @override
//   State<QuizForm> createState() => _QuizFormState();
// }

// class _QuizFormState extends State<QuizForm> {
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Simple Data Table'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           columns: [
//             DataColumn(label: Text('ID')),
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('LastName')),
//             DataColumn(label: Text('Age')),
//             DataColumn(label: Text('Actions')),
//           ],
//           rows: List.generate(_data.length, (index) {
//             final item = _data[index];
//             return DataRow(cells: [
//               DataCell(Text(item['_id'].toString())),
//               DataCell(Text(item['name'])),
//               DataCell(Text(item['lastName'])),
//               DataCell(Text(item['age'].toString())),
//               DataCell(Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () => _editItem(index),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => _deleteItem(index),
//                   ),
//                 ],
//               )),
//             ]);
//           }),
//         ),
//       ),
//     );
//   List<Map<String, dynamic>> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     // Connect to the database
//     final db = await Db.create('mongodb://localhost:27017/my_database');
//     await db.open();

//     // Fetch data from the database
//     final collection = db.collection('my_collection');
//     final data = await collection.find().toList();

//     // Update the state with the fetched data
//     setState(() {
//       _data = data;
//     });

//     // Close the database connection
//     await db.close();
//   }

//   void _editItem(int index) {
//     // Implement your edit logic here
//   }

//   void _deleteItem(int index) {
//     setState(() {
//       _data.removeAt(index);
//     });
//   }

 

import 'package:flutter/material.dart';

import '../../constants.dart';
class Lessonpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        
        child: 
        DataTable(
          border: TableBorder.all(),

        
          
          headingTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
          dataTextStyle: const TextStyle(color: Colors.grey, fontSize: 10),
          dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState>state ){
            return Colors.black;
          } ),
          headingRowColor:
              MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.deepPurple;}),
          columns: [
          
            DataColumn(label: Text('Lesson_Id')),
            DataColumn(label: Text('Lesson Name')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Lessons')),
            DataColumn(label: Text('Created By')),
            DataColumn(label: Text('Creation Date')),
            DataColumn(label: Text('Modified By')),
            DataColumn(label: Text('Modification date')),
            DataColumn(label: Text('Actions')),
//           ],
          ],
          rows: [
            DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                return null;
              }),
              cells: [
                DataCell(Text("1")),
                DataCell(Text("Alex")),
                DataCell(Text("Anderson")),
                DataCell(Text("ha-ho")),
                DataCell(Text("amin1")),
                DataCell(Text("11-21-2022")),
                DataCell(Text("amin1")),
                DataCell(Text("10-21-2022")),
                DataCell(Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.deepPurple,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.deepPurple,),
                    onPressed: () {},
                  ),
                ],
              )),
                
              ],
            ),
            DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                return null;
              }),
              cells: [
             DataCell(Text("1")),
                DataCell(Text("Alex")),
                DataCell(Text("Anderson")),
                DataCell(Text("ha-ho")),
                DataCell(Text("amin1")),
                DataCell(Text("11-21-2022")),
                DataCell(Text("amin1")),
                DataCell(Text("10-21-2022")),
                DataCell(Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.deepPurple,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.deepPurple,),
                    onPressed: () {},
                  ),
                ],
              )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}