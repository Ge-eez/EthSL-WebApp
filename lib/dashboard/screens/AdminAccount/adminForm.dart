import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blink/Dashboard/constants.dart';

class AdminForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<AdminForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': _usernameController.text,   
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'phone':_phoneNumberController.text,
        'email': _emailController.text,
        'password':_passwordController.text
      });
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
 

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
  child:Text('Create Admin Account', style: TextStyle(fontSize: 25, color: Colors.deepPurple),)
),
            
            SizedBox(height: 40),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
             
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color: Colors.deepPurple), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    prefixIcon: Icon(Icons.person_2_outlined,color: Colors.deepPurple),border: InputBorder.none,),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
    prefixIcon: Icon(Icons.phone,color: Colors.deepPurple),border: InputBorder.none,),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),border: InputBorder.none,
    prefixIcon: Icon(Icons.mail, color: Colors.deepPurple,),),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your email address';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.deepPurple),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),border: InputBorder.none,
    prefixIcon: Icon(Icons.lock,color: Colors.deepPurple),suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,color: Colors.deepPurple),
                            ),),
              obscureText: !_passwordVisible,
              
             validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            } else if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
             }
            
            ),
            
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
    primary: Colors.deepPurple,
    minimumSize: Size(100, 45),
  ),
                  onPressed: ()async {
                if (_formKey.currentState!.validate()) {
                  await registerUser();
                }
              },
                  child: Text('Save'),
                ),
                SizedBox(width: (20)),
                ElevatedButton(
                 style: ElevatedButton.styleFrom(
    primary: Colors.deepPurple,
    minimumSize: Size(100, 45),
  ),
                  onPressed: () {
                    setState(() {
                      // Clear all the input fields
                      _usernameController.clear();
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _phoneNumberController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      
                    });
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
