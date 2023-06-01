import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFC33764), Color(0xFF1D2671)],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login to continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlutterLogo(size: 100, colors: Colors.white),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF1D2671),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'auth_controller/authController.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'components/login_image.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isLogin = false;
//   bool _passwordVisible = false;
//   // bool _loading = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   handleSubmit() async {
//     if (!_formKey.currentState!.validate()) return;
//     final email = _emailController.value.text;
//     final password = _passwordController.value.text;

//     // setState(() => _loading = true);

//     //Check if is login or register

//     await Auth().signInWithEmailAndPassword(email, password);

//     // setState(() => _loading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Form(
//         key: _formKey,
//         child: Stack(
//           children: [
//             // Background circle
//             Positioned(
//               top: 40,
//               right: -40,
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepPurple[100],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -40,
//               left: -30,
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepPurple[100],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 50,
//               left: 50,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepPurple[100],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 100,
//               right: 100,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepPurple[100],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 100,
//               left: 100,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.deepPurple[100],
//                 ),
//               ),
//             ),

//             Row(
//               children: [
//                 Expanded(
//                 child: LoginScreenTopImage(),
//               ),
//                 Container(
//                   width: 500,
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(249, 244, 224, 254),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 20),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: TextFormField(
//                           controller: _emailController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Email',
//                             prefixIcon:
//                                 Icon(Icons.mail, color: Colors.deepPurple[100]),
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 12,
//                               horizontal: 16,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: TextFormField(
//                           controller: _passwordController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Password',
//                             prefixIcon:
//                                 Icon(Icons.lock, color: Colors.deepPurple[100]),
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 12,
//                               horizontal: 16,
//                             ),
//                             border: InputBorder.none,
//                             suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _passwordVisible = !_passwordVisible;
//                                 });
//                               },
//                               icon: Icon(_passwordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off),
//                             ),
//                           ),
//                           obscureText: !_passwordVisible,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () => handleSubmit(),
//                         child: Text('Log in'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
