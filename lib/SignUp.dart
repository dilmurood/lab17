import 'package:flutter/material.dart';
import 'package:lab17/CustomTextFormField.dart';
import 'package:lab17/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    try {
      UserCredential? user = await auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainPage()));
      } else {
        print('Failed to log in with email and password');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return user
          .add({
            'username': _usernameController.text,
            'email': _emailController.text, 
            'phone': _phoneController.text,
            'password': _passwordController.text,
            'address': _addressController.text,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _usernameController,
                  str: 'username',
                  isNotVisible: false,
                  icon: Icons.person,
                  type: TextInputType.text,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _emailController,
                  str: 'email',
                  isNotVisible: false,
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  str: 'password',
                  isNotVisible: true,
                  icon: Icons.lock,
                  type: TextInputType.none,
                ),
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  controller: _addressController,
                  str: 'address',
                  isNotVisible: false,
                  icon: Icons.location_city,
                  type: TextInputType.none,
                ),
                const Text(
                  'Phone Number ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField(
                  controller: _phoneController,
                  str: 'phone number',
                  isNotVisible: false,
                  icon: Icons.phone,
                  type: TextInputType.number,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(300, 50)),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _signUp();
                        addUser();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
