
import 'package:blink/Dashboard/screens/AdminAccount/Challenges/quizController/quiz_controller.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import './quizController/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  // const QuizPage({super.key});

  @override
  _QuizFormPageState createState() => _QuizFormPageState();
}

class _QuizFormPageState extends State<QuizPage> {
  List<Challenge> _challenges = [];

  @override
  void initState() {
    super.initState();
    _fetchChallenges();
  }

  Future<void> _fetchChallenges() async {
    final challenges = await fetchChallenges();
    setState(() {
      _challenges = challenges;
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(),
          headingTextStyle:
              const TextStyle(color: Colors.white, fontSize: 12),
          dataTextStyle: const TextStyle(color: Colors.grey, fontSize: 10),
          dataRowColor:
              MaterialStateProperty.resolveWith<Color>((Set<MaterialState> state) {
            return Colors.black;
          }),
          headingRowColor:
              MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.deepPurple;
          }),
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Level')),
            DataColumn(label: Text('Requirements')),
            DataColumn(label: Text('Symbols')),
            DataColumn(label: Text('Actions')),
          ],
          rows: _challenges.map((challenge) {
            return DataRow(
              cells: [
                DataCell(Text(challenge.name)),
                DataCell(Text(challenge.description)),
                DataCell(Text(challenge.level)),
                DataCell(Text(challenge.requirements.join(', '))),
                DataCell(Text(challenge.symbols.join(', '))),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.edit, color: Colors.deepPurple),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.delete, color: Colors.deepPurple),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Delete Challenge"),
                              content: const Text(
                                  "Are you sure you want to delete this challenge?"),
                              actions: [
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text("Delete"),
                                  onPressed: () {
                                    deleteChallenge(challenge.id);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
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
