import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'quiz_controller/Quiz_controller.dart';
class QuizPage extends StatefulWidget{
  const QuizPage({super.key});

  @override
  _QuizFormPageState createState() => _QuizFormPageState();
}

class _QuizFormPageState extends State<QuizPage> {
  List<Quiz> _Quiz = [];
@override
void initState(){
  super.initState();
  _fetchLessons();
}

Future<void> _fetchLessons() async {
    final lessons = await fetchQuiz();
    setState(() {
      _quiz = Quiz;
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
                DataCell(Text(lesson.prerequisites.map((prerequisite) => prerequisite['name']).join(', '))),
                
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