import 'package:blink/dashboard/constants.dart';
import 'package:flutter/material.dart';





class QuizForm extends StatefulWidget {
  const QuizForm({Key? key}) : super(key: key);

  @override
  State<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quizController=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Center(
  child:Text('Create Quiz', style: TextStyle(fontSize: 25, color: Colors.deepPurple),)
), 
            Text(
                'Quiz Name',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ), 
            SizedBox(height:10),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Quiz name',
                hintStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.person_2_outlined,
              color: Colors.deepPurple),
              border: InputBorder.none,),
             ),
               Text(
                'Description',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ), 
            SizedBox(height:10),
            TextFormField(
              keyboardType: TextInputType.multiline,
              
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.description_outlined,
              color: Colors.deepPurple),
              border: InputBorder.none,),
             ),
                  Text(
                'Quizzes',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ), 
            SizedBox(height:10),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: quizController,
              decoration: InputDecoration(
                hintText: 'Quiz',
                hintStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.quiz_outlined,

              color: Colors.deepPurple),
              border: InputBorder.none,),
             ),
             SizedBox(
              height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               ElevatedButton( 
                style: ElevatedButton.styleFrom(
                  alignment:Alignment.center,
                  minimumSize: Size(100,50),
                  primary: Colors.deepPurple,
                ),
                  child: const Text(
                    'Save',),
                  onPressed: () {
                    print(nameController.text);
                    print(descriptionController.text);
                    print(quizController.text);
                  },
                  
                ),]),
                SizedBox(height: 10,)
              
          ],
        )));
      
  }}  