import 'package:flutter/material.dart';

import '../../../constants.dart';
class Quizpage extends StatelessWidget {
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
          
            DataColumn(label: Text('Quiz_Id')),
            DataColumn(label: Text('Quiz Name')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Quizs')),
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