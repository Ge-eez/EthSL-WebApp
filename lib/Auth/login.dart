// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: LoginPage(),
//   ));
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFFC33764), Color(0xFF1D2671)],
//           ),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: EdgeInsets.all(40),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Welcome Back!',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Login to continue',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: EdgeInsets.all(40),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     FlutterLogo(size: 100,color: Colors.white),
//                     SizedBox(height: 40),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         labelStyle: TextStyle(color: Colors.white),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle: TextStyle(color: Colors.white),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       child: Text(
//                         'Log in',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Color(0xFF1D2671),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'auth_controller/authController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/login_image.dart';
import 'components/avatar_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = false;
  bool _passwordVisible = false;
  // bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    // setState(() => _loading = true);

    //Check if is login or register

    await Auth().signInWithEmailAndPassword(email, password);

    // setState(() => _loading = false);
  }
  @override
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(  
  
  
        body: SafeArea(
      child: Form(
        
        key: _formKey,
        child: Stack(
          
          children: [
            
            
            Container(
              width: MediaQuery.of(context).size.width/2,
            color: Color(0xFFF5F0FF),),
             

        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: 
        //      Color(0xFFF5F0FF),
        //   ),
        // ),),
            // Background circle
            Positioned(
              top: 40,
              right: 5,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: -30,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffdcddff),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 100,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 100,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
           
             Positioned(
              top: 550,
              right:10,
              child: Container(
                width: 500,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
           
           Positioned(
              bottom: 250,
              right: 350,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:  Color(0xffdcddff),
                ),
              ),
            ),
          

            Row(
              children: <Widget> [
              
               
                Expanded(
                child: LoginScreenTopImage(),
              ),
              
                Container(
               width: MediaQuery.of(context).size.width/2,
               height: MediaQuery.of(context).size.height,
                  
                  
                  margin: EdgeInsets.fromLTRB(0, 150, 20, 150),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                       
                   
                    borderRadius: BorderRadius.circular(10),
                  ),
      
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Container(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Email',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ), ) ,),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                           color: Color(0xFFF5F0FF),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon:
                                Icon(Icons.mail, color: Colors.deepPurple[100]),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                       Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Password',
                style: TextStyle(
                   color: Color.fromARGB(255, 51, 53, 123),
                      fontWeight: FontWeight.bold,
                      fontSize:20,
                      ), ) ,),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                           color: Color(0xFFF5F0FF),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.deepPurple[100]),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          obscureText: !_passwordVisible,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => handleSubmit(),
                        child: Text('Log in'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff311B92),
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
                    ],
          ),          
        ),
      ));
  }
}
