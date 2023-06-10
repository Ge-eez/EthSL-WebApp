import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'lesson_controller/lesson_controller.dart';




class LessonForm extends StatefulWidget {
 
  @override
  _LessonFormState createState() => _LessonFormState();
}

class _LessonFormState extends State<LessonForm> {
  final _formKey = GlobalKey<FormState>(); 
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _symbolsController=TextEditingController();
  final _levelController = TextEditingController();
  List<Lesson> _lessons= [];
  List<Lesson> _selectedPrequisites = [];
  
@override
void initState(){
  super.initState();
  fetchLessons();
}

Future<void> _fetchLessons() async {
    final lesson = await fetchLessons();
    setState(() {
      _lessons = lesson;
    });
  }






 
   

 


  void submit() async{
    
      final name = _nameController.text;
                final description = _descriptionController.text;
                final symbols =
                    _symbolsController.text.split(',').map((e) => e.trim()).toList();
                final prerequisites = _selectedPrequisites;
                final level = _levelController.text;

      final lessonData = {
        'name': name,
        'description': description,
        'symbols': symbols,
        'level':level,
        'prerequisites':prerequisites
      };

        

     }
     
       

     @override
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
  child:Text('Create Lesson', style: TextStyle(fontSize: 25, color: Colors.deepPurple),)
), 
            Text(
                'Lesson Name',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ), 
            SizedBox(height:10),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Lesson name',
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
              
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.description_outlined,
              color: Colors.deepPurple),
              border: InputBorder.none,),
             ),
                  Text(
                'Letters',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      ), ), 
            SizedBox(height:10),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _symbolsController,
              decoration: InputDecoration(
                hintText: 'Letters',
                hintStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              prefixIcon: Icon(Icons.text_fields_outlined,
              color: Colors.deepPurple),
              border: InputBorder.none,),
             ),

             SizedBox(
              height: 10,),
            //  DropdownButtonFormField<String>(
            //   value: _level,
            //   onChanged: (value) => setState(() => _level = value),
            //   items: ['Beginner', 'Intermediate', 'Advanced']
            //       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            //       .toList(),
            //   decoration: InputDecoration(labelText: 'Level'),
            //   validator: (value) =>
            //       value == null ? 'Please select a level' : null,
            // ), 

              SizedBox(
              height: 10,),


            


              SizedBox(
              height: 10,),
            
               ElevatedButton( 
                style: ElevatedButton.styleFrom(
                  alignment:Alignment.center,
                  minimumSize: Size(100,50),
                  primary: Colors.deepPurple,
                ),
                  child: const Text(
                    'Save',),
                  onPressed: submit
                  
                ),
              
          ],
        )));
      
  }}                                     
  

    //              Container(
    //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
    //       alignment: Alignment.centerRight,
    //           child: const Text(
    //             'Lesson Name',
    //             style: TextStyle(
    //                color: Color.fromARGB(255, 51, 53, 123),
    //                   fontWeight: FontWeight.bold,
    //                   ), ) ,),
    //         Container(
    //         decoration:  BoxDecoration(   
    //         color: Color.fromARGB(255, 249, 247, 247),
    //         borderRadius: new BorderRadius.circular(10.0), 
    //         boxShadow: [
    //           BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
    //         ]),
    //           margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
   
    //           child: TextField(
    //             controller: nameController,
    //             decoration: const InputDecoration(
    //               contentPadding: EdgeInsets.fromLTRB(20, 10.0, 2.0, 10.0),
    //               enabledBorder: OutlineInputBorder(
    //                  borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
    //                 ),
    //               labelText: 'Lesson Name',
    //               // fillColor: Color.fromARGB(255, 249, 247, 247),
    //               // filled: true,
                  
    //             ),
    //           ),
    //         ),
    //              Container(
    //          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
    //          alignment: Alignment.centerLeft,
    //           child: const Text(
    //             ' Description',
    //             style: TextStyle(
    //                color: Color.fromARGB(255, 51, 53, 123),
    //                   fontWeight: FontWeight.bold,
    //                   ), ) ,),
    //         Container(
    //          decoration:  BoxDecoration(   
    //         color: Color.fromARGB(255, 249, 247, 247),
    //         borderRadius: new BorderRadius.circular(10.0),
    //         boxShadow: [
    //         BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),     
    //       ]),
    //            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    //           child: TextField(
    //             controller: descriptionController,
      
    //             decoration: const InputDecoration(
    //               labelText: 'Description',
    //               contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
    //                ),
    //               fillColor: Color.fromARGB(255, 249, 247, 247),
    //               filled: true,
                

    //               ),
                 
                  
    //             ),
    //           ),
    //              Container(
    //          padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
    //          alignment: Alignment.centerLeft,
    //           child: const Text(
    //             'Symbols',
    //             style: TextStyle(
    //                color: Color.fromARGB(255, 51, 53, 123),
    //                   fontWeight: FontWeight.bold,
    //                   ), ) ,),
    //         Container(
    //             decoration:  BoxDecoration(   
    //       color: Color.fromARGB(255, 249, 247, 247),
    //       borderRadius: new BorderRadius.circular(10.0),  
    //       boxShadow: [
    //         BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
    //      ]),
    //            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
    //           child: TextField(
    //             controller: lettersController,
    //             decoration: const InputDecoration(
    //               contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //               enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
    //               labelText: 'Last Name',
    //                fillColor: Color.fromARGB(255, 249, 247, 247),
    //               filled: true,
    //             ),
    //           ),
    //         ),
                
  
        
    //         Container(
    //                decoration:  BoxDecoration(   
    //       color: Color.fromARGB(255, 249, 247, 247),
    //       borderRadius: new BorderRadius.circular(25.0), 
    //       boxShadow: [
    //         BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
    //       ]),
    //             margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
    //             height: 45,
    //             width: double.infinity,
                
               

    //             child: ElevatedButton(
    //               child: const Text(
    //                 'Add Lesson',),
    //               onPressed: () {
    //                 print(nameController.text);
    //                 print(descriptionController.text);
    //                 print(lettersController.text);
    //               },
    //             )
    //         ),
            
     
            
              
            
    
 
   