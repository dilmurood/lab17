import 'package:flutter/material.dart';
import 'package:lab17/CustomTextFormField.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                const CustomTextFormField(
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
                const CustomTextFormField(
                  str: 'email',
                  isNotVisible: false,
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const CustomTextFormField(
                  str: 'password',
                  isNotVisible: true,
                  icon: Icons.lock,
                  type: TextInputType.none,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const CustomTextFormField(
                  str: 'password',
                  isNotVisible: true,
                  icon: Icons.lock,
                  type: TextInputType.none,
                ),
                const Text(
                  'Phone Number ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const CustomTextFormField(
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
                        Navigator.pushNamed(context, '/MainPage');
                      }
                      print('Form is not valid');
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
