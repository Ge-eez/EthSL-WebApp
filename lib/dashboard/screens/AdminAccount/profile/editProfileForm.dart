// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'package:blink/Dashboard/Screens/AdminAccount/profile/edit_profile_controller.dart';

// class EditProfileForm extends StatefulWidget {
//   // const EditProfileForm({Key? key}) : super(key: key);

//   final String adminId;
//   EditProfileForm({required this.adminId});

//   @override
//   _EditProfileFormState createState() => _EditProfileFormState();
// }

// class _EditProfileFormState extends State<EditProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;
//   late TextEditingController _firstNameController;
// late TextEditingController _lastNameController;




//   @override
//   void initState(){
// _nameController = TextEditingController();
// _emailController=TextEditingController();
// _phoneController=TextEditingController();
// _firstNameController=TextEditingController();
//  _lastNameController=TextEditingController();
//   _fetchUserData();
//   }
//    Future<void> _fetchUserData() async {
//     try {
//       final userData = await fetchUserData(widget.adminId);
//       setState(() {
//         _nameController.text = userData['username'];
//         _emailController.text = userData['email'];
//         _phoneController.text = userData['phone'];
//         _firstNameController.text = userData['firstName'];
//         _lastNameController.text = userData['lastName'];


//       });
//     } catch (err) {
//       // Handle error
//     }
//   }

//   void submit() async{
//     if(_formKey.currentState!.validate()){
//       await editUserProfile(widget.adminId, {
//         'username':_nameController.text,
//         'email':_emailController.text,
//         'phone':_phoneController.text,
//         'firstName':_firstNameController,
//         'lastName': _lastNameController
//       });
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(defaultPadding),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(20)),
        
//       ),
//       child:Form(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
          
//           children: [
//                 Center(
//   child:Text('Edit Profile', style: TextStyle(fontSize: 26, color: Colors.deepPurple),)
// ), 
        
             
//             Container(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
//             alignment: Alignment.centerLeft,
//               child: const Text(
//                 'User Name',
//                 style: TextStyle(
//                    color: Color.fromARGB(255, 51, 53, 123),
//                       fontWeight: FontWeight.bold,
//                       ), ) ,),
//             Container(
//             decoration:  BoxDecoration(   
//             color: Color.fromARGB(255, 249, 247, 247),
//             borderRadius: new BorderRadius.circular(10.0), 
//             boxShadow: [
//               BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
//             ]),
//               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
   
//               child: TextFormField(
//                 controller: _nameController,
      
//                 decoration: const InputDecoration(
//                    hintText: 'Username',
//                 hintStyle: TextStyle(
//                   color: Colors.deepPurple),
//                   contentPadding: EdgeInsets.fromLTRB(20, 10.0, 2.0, 10.0),
//                   enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
//                     ),
//                     prefixIcon: Icon(Icons.person_2_outlined,
//     color: Colors.deepPurple),
//     border: InputBorder.none,),
                  
//                   // fillColor: Color.fromARGB(255, 249, 247, 247),
//                   // filled: true,
                  
//                 ),
//               ),
          
//             Container(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
//             alignment: Alignment.centerLeft,
//               child: const Text(
//                 'First Name',
//                 style: TextStyle(
//                    color: Color.fromARGB(255, 51, 53, 123),
//                       fontWeight: FontWeight.bold,
//                       ), ) ,),
//             Container(
//             decoration:  BoxDecoration(   
//             color: Color.fromARGB(255, 249, 247, 247),
//             borderRadius: new BorderRadius.circular(10.0), 
//             boxShadow: [
//               BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
//             ]),
//               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
   
//               child: TextFormField(
//                 controller: _firstNameController,
      
//                 decoration: const InputDecoration(
//                    hintText: 'Firstname',
//                 hintStyle: TextStyle(
//                   color: Colors.deepPurple),
//                   contentPadding: EdgeInsets.fromLTRB(20, 10.0, 2.0, 10.0),
//                   enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
//                     ),
//                     prefixIcon: Icon(Icons.person_2_outlined,
//     color: Colors.deepPurple),
//     border: InputBorder.none,),
                  
//                   // fillColor: Color.fromARGB(255, 249, 247, 247),
//                   // filled: true,
                  
//                 ),
//               ),
//                 Container(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
//             alignment: Alignment.centerLeft,
//               child: const Text(
//                 'Last Name',
//                 style: TextStyle(
//                    color: Color.fromARGB(255, 51, 53, 123),
//                       fontWeight: FontWeight.bold,
//                       ), ) ,),
//             Container(
//             decoration:  BoxDecoration(   
//             color: Color.fromARGB(255, 249, 247, 247),
//             borderRadius: new BorderRadius.circular(10.0), 
//             boxShadow: [
//               BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),
//             ]),
//               margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
   
//               child: TextFormField(
//                 controller: _lastNameController,
      
//                 decoration: const InputDecoration(
//                    hintText: 'Lastname',
//                 hintStyle: TextStyle(
//                   color: Colors.deepPurple),
//                   contentPadding: EdgeInsets.fromLTRB(20, 10.0, 2.0, 10.0),
//                   enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
//                     ),
//                     prefixIcon: Icon(Icons.person_2_outlined,
//     color: Colors.deepPurple),
//     border: InputBorder.none,),

                  
//                 ),
//               ),
          
          

//                  Container(
//              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
//              alignment: Alignment.centerLeft,
//               child: const Text(
//                 'Email',
//                 style: TextStyle(
//                    color: Color.fromARGB(255, 51, 53, 123),
//                       fontWeight: FontWeight.bold,
//                       ), ) ,),
//             Container(
//            decoration:  BoxDecoration(   
//           color: Color.fromARGB(255, 249, 247, 247),
//           borderRadius: new BorderRadius.circular(10.0),   
//           boxShadow: [
//             BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
//           ]),
//                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
//               child: TextFormField(
//                  keyboardType:TextInputType.emailAddress,
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                   prefixIcon: Icon(Icons.mail, color: Colors.deepPurple,),
//                   enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
//                   labelText: 'Email',
//                   labelStyle:TextStyle(color: Colors.deepPurple),
//                    fillColor: Color.fromARGB(255, 249, 247, 247),
//                   filled: true,
//                 ),
//               ),
//             ),
//              Container(
//              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
//              alignment: Alignment.centerLeft,
//               child: const Text(
//                 'Phone Number',
//                 style: TextStyle(
//                    color: Color.fromARGB(255, 51, 53, 123),
//                       fontWeight: FontWeight.bold,
//                       ), ) ,),
//             Container(
//            decoration:  BoxDecoration(   
//           color: Color.fromARGB(255, 249, 247, 247),
//           borderRadius: new BorderRadius.circular(10.0),   
//           boxShadow: [
//             BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
//           ]),
//                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
//               child: TextFormField(
//                 controller: _phoneController,
//                  keyboardType:TextInputType.phone,
//                 decoration: const InputDecoration(
                   
//                   contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                   prefixIcon: Icon(Icons.phone,color: Colors.deepPurple),border: InputBorder.none,
//                   enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))),
//                   labelText: 'Phone Number',
//                    labelStyle:TextStyle(color: Colors.deepPurple),
//                    fillColor: Color.fromARGB(255, 249, 247, 247),
//                   filled: true,
//                 ),
//               ),
//             ),
//           //    Container(
//           //     padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
//           //     alignment: Alignment.centerLeft,
//           //     child: const Text(
//           //       'Password',
//           //       style: TextStyle(
//           //          color: Color.fromARGB(255, 51, 53, 123),
//           //             fontWeight: FontWeight.bold,
//           //             ), ) ,),
//           //   Container(
//           //   decoration:  BoxDecoration(   
//           // color: Color.fromARGB(255, 249, 247, 247),
//           // borderRadius: new BorderRadius.circular(10.0), 
//           // boxShadow: [
//           //   BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
//           // ]),
//           //      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              
//           //     child: TextField(
//           //        keyboardType:TextInputType.visiblePassword,
//           //       obscureText: true,
//           //       // controller: passwordController,
//           //       decoration: const InputDecoration(
//           //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//           //         prefixIcon: Icon(  Icons.lock_outlined, color: Colors.deepPurple,),
                   
//           //         enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromARGB(255, 249, 247, 247))
//           //         ),
//           //         labelText: 'Password',
//           //          labelStyle:TextStyle(color: Colors.deepPurple),
//           //          fillColor: Color.fromARGB(255, 249, 247, 247),
//           //         filled: true,
//           //       ),
//           //     ),
//           //   ),

          
  
//             // TextButton(
//             //   onPressed: () {
//             //     //forgot password screen
//             //   },
//             //   child: const Text('Forgot Password',),
//             // ),
//             Container(
//                    decoration:  BoxDecoration(   
//           color: Color.fromARGB(255, 249, 247, 247),
//           borderRadius: new BorderRadius.circular(5.0), 
//           boxShadow: [
//             BoxShadow(color: Colors.grey, blurRadius: 8.0, spreadRadius: 0.4),   
//           ]),
//                 margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
//                 height: 45,
//                 width: double.infinity,
                
               

//                 child: ElevatedButton(
//                   child: const Text(
//                     'Save Changes',),
//                   onPressed: submit
//                 )
//             ),
            
           
//                 // Text(
//                 //   'Sign Up',
//                 //   style: TextStyle(
//                 //     fontSize: 32,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 // SizedBox(height: 30),
//                 // TextFormField(
//                 //   decoration: InputDecoration(
//                 //     hintText: 'Email',
//                 //     prefixIcon: Icon(Icons.email),
//                 //   ),
//                 // ),
//                 // SizedBox(height: 20),
//                 // TextFormField(
//                 //   decoration: InputDecoration(
//                 //     hintText: 'Password',
//                 //     prefixIcon: Icon(Icons.lock),
//                 //   ),
//                 //   obscureText: true,
//                 // ),
//                 // SizedBox(height: 20),
//                 // ElevatedButton(
//                 //   onPressed: () {},
//                 //   child: Text('Sign Up'),
//                 // ),
//               ],
//             ),
//           ),
//     );

  
    
//    }
// }