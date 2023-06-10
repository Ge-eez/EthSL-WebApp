// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:blink/Dashboard/constants.dart';

// class LessonForm extends StatefulWidget {
//   @override
//   _CreateAccountFormState createState() => _CreateAccountFormState();
// }

// class _CreateAccountFormState extends State<LessonForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _passwordVisible = false;

//   Future<void> registerUser() async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'username': _usernameController.text,   
//         'firstName': _firstNameController.text,
//         'lastName': _lastNameController.text,
//         'phone':_phoneNumberController.text,
//         'email': _emailController.text,
//         'password':_passwordController.text
//       });
//       Navigator.of(context).pop();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
 

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _phoneNumberController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
       
//    padding: EdgeInsets.all(defaultPadding),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//   child:Text('Create Admin Account', style: TextStyle(fontSize: 25, color: Colors.deepPurple),)
// ),
            
//             SizedBox(height: 40),
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(hintText: 'Username',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//     prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
             
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter your username';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _firstNameController,
//               decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//     prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter your first name';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _lastNameController,
//               decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color: Colors.deepPurple), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//     prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter your last name';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
//     prefixIcon: Icon(Icons.phone,color: Colors.deepPurple),border: InputBorder.none,),
//               keyboardType: TextInputType.phone,
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter your phone number';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),border: InputBorder.none,
//     prefixIcon: Icon(Icons.mail, color: Colors.deepPurple,),),
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) {
//                 if (value?.isEmpty ?? true) {
//                   return 'Please enter your email address';
//                 }
//                 if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
//                   return 'Please enter a valid email address';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),border: InputBorder.none,
//     prefixIcon: Icon(Icons.lock,color: Colors.deepPurple),suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _passwordVisible = !_passwordVisible;
//                                 });
//                               },
//                               icon: Icon(_passwordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,color: Colors.deepPurple),
//                             ),),
//               obscureText: !_passwordVisible,
              
//              validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter password';
//             } else if (value.length < 8) {
//               return 'Password must be at least 8 characters long';
//             }
//              }
            
//             ),
            
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//     primary: Colors.deepPurple,
//     minimumSize: Size(100, 45),
//   ),
//                   onPressed: ()async {
//                 if (_formKey.currentState!.validate()) {
//                   await registerUser();
//                 }
//               },
//                   child: Text('Save'),
//                 ),
//                 SizedBox(width: (20)),
//                 ElevatedButton(
//                  style: ElevatedButton.styleFrom(
//     primary: Colors.deepPurple,
//     minimumSize: Size(100, 45),
//   ),
//                   onPressed: () {
//                     setState(() {
//                       // Clear all the input fields
//                       _usernameController.clear();
//                       _firstNameController.clear();
//                       _lastNameController.clear();
//                       _phoneNumberController.clear();
//                       _emailController.clear();
//                       _passwordController.clear();
                      
//                     });
//                   },
//                   child: Text('Cancel'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';

// void main() {
//   runApp(LessonForm());
// }

// class LessonFormPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LessonFormPage(),
//     );
//   }
// }

// class LessonFormPage extends StatefulWidget {
//   @override
//   _LessonFormPageState createState() => _LessonFormPageState();
// }

// class _LessonFormPageState extends State<LessonFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   String name, description, letter;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 onChanged: (value) {
//                   name = value;
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: 'Description'),
//                 onChanged: (value) {
//                   description = value;
//                 },
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: 'Letter'),
//                 onChanged: (value) {
//                   letter = value;
//                 },
//               ),
//               RaisedButton(
//                 child: Text('Submit'),
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     // Connect to MongoDB
//                     var client = MongoClient('mongodb://localhost:27017');
//                     var db = client.db('my_db');
//                     var collection = db.collection('documents');

//                     // Create a new document
//                     var document = {
//                       'name': name,
//                       'description': description,
//                       'letter': letter,
//                     };

//                     // Insert the document into the collection
//                     collection.insertOne(document);

//                     // Disconnect from MongoDB
//                     client.close();

//                     // Navigate to the home page
//                     Navigator.pushReplacementNamed(context, '/home');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'lesson_controller/lesson_controller.dart';

// void main() => runApp(LessonForm());



class LessonForm extends StatefulWidget {
 
  @override
  _LessonFormState createState() => _LessonFormState();
}

class _LessonFormState extends State<LessonForm> {
  final _formKey = GlobalKey<FormState>(); 
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _lettersController=TextEditingController();
   String _errorMessage = '';
   String? _level;
  //  String? _prerequisites;
  List<dynamic> _lessons = [];
   final lesson = Lesson();
   @override
   void initState(){
    super.initState();
    _fetchLessons();
   }

   Future<void> _fetchLessons() async {
    final lessons = await lesson.fetchLessons();
    setState(() {
      _lessons = lessons;
    });
  }

   

 


  void submit() async{
    
      final letters = _lettersController.text.split(',').map((e) => e.trim()).toList();

      final lessonData = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        'letters': letters,
        'level':_level,
        // 'prerequisites':_prerequisites
      };

         
         final String message = await lesson.createLesson(lessonData);

    if (message.isEmpty) {
      // Account created successfully, show success message or navigate to another screen
      setState(() {
        _errorMessage = 'Lesson created successfully';
      });
    } else {
      setState(() {
        _errorMessage = message;
      });
    }

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
              controller: _lettersController,
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
             DropdownButtonFormField<String>(
              value: _level,
              onChanged: (value) => setState(() => _level = value),
              items: ['Beginner', 'Intermediate', 'Advanced']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              decoration: InputDecoration(labelText: 'Level'),
              validator: (value) =>
                  value == null ? 'Please select a level' : null,
            ), 

              SizedBox(
              height: 10,),
            //   DropdownButtonFormField<String>(
            //   value:_prerequisites,
            //   onChanged:(value)=>setState(()=>_prerequisites=value),
            //   items:_lessons.map((e)=>DropdownMenuItem(value:e['_id'] as String,child:Text(e['name']))).toList(),
            //   decoration:
            //       InputDecoration(labelText:'Prerequisite Lesson'),
            //   validator:(value)=>
            //       value==null?'Please select a prerequisite lesson':null,
            // ),



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
            
     
            
              
            
    
 
   