import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'lesson_controller/lesson_controller.dart';
class LessonPage extends StatefulWidget{
  const LessonPage({super.key});

  @override
  _LessonFormPageState createState() => _LessonFormPageState();
}

class _LessonFormPageState extends State<LessonPage> {
  List<Lesson> _lessons = [];
@override
void initState(){
  super.initState();
  _fetchLessons();
}

Future<void> _fetchLessons() async {
    final lessons = await fetchLessons();
    setState(() {
      _lessons = lessons;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
          columns: const [
          
          
            DataColumn(label: Text('Lesson Name')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Level')),
            DataColumn(label: Text('Symbols')),
            DataColumn(label: Text('Prerequisites')),
           
            DataColumn(label: Text('Actions')),
//           ],
          ],
          rows: _lessons.map((lesson) {
            return DataRow(
              cells: [
                
                DataCell(Text(lesson.name)),
                DataCell(Text(lesson.description)),
                DataCell(Text(lesson.level)),
                DataCell(Text(lesson.symbols.map((symbol) => symbol['representation']).join(', '))),
                DataCell(Text(lesson.prerequisites.join(', '))),
                
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.deepPurple),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.deepPurple),
                      onPressed: () {},
                    ),
                  ],
                )),
              ],
            );
          }).toList(),



        ),    
      ),
    );
  }
}