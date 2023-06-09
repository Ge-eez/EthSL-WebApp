// import 'package:flutter/material.dart';
// class Userpage extends StatelessWidget {
//   @override
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
//           ],
//           rows: [
//             DataRow(
//               color: MaterialStateProperty.resolveWith<Color?>(
//                   (Set<MaterialState> states) {
//                 if (states.contains(MaterialState.selected))
//                   return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//                 return null;
//               }),
//               cells: [
//                 DataCell(Text("1")),
//                 DataCell(Text("Alex")),
//                 DataCell(Text("Anderson")),
//                 DataCell(Text("18")),
//               ],
//             ),
//             DataRow(
//               color: MaterialStateProperty.resolveWith<Color?>(
//                   (Set<MaterialState> states) {
//                 if (states.contains(MaterialState.selected))
//                   return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//                 return null;
//               }),
//               cells: [
//                 DataCell(Text("2")),
//                 DataCell(Text("John")),
//                 DataCell(Text("Anderson")),
//                 DataCell(Text("24")),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }