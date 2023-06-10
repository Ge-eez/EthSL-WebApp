import 'package:flutter/material.dart';
import 'auth_controller/authController.dart';

import 'components/login_image.dart';
import 'components/avatar_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blink/Dashboard/mainDashboard.dart';

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
   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> handleSubmit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    String _errorMessage = '';
    final signIn = Auth();
    final String message = await signIn.login(email, password);
    if (message == 'success') {
      Navigator.pushNamed(context, '/admin_dashboard');
    } else {
      setState(() {
        _errorMessage = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Color(0xFFF5F0FF),
            ),

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
              right: 10,
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
                  color: Color(0xffdcddff),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: LoginScreenTopImage(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        ),
                      ),
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
                            fontSize: 20,
                          ),
                        ),
                      ),
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