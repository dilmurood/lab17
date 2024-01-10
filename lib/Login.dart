import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab17/CustomTextFormField.dart';
import 'package:lab17/MainPage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _sigIn(BuildContext context) async {
    try {
      UserCredential? user = await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (user != null && _formKey.currentState!.validate()) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 100,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'PLEASE, LOG IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      str: 'emial',
                      isNotVisible: false,
                      icon: Icons.email,
                      type: TextInputType.name,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _passwordController,
                      str: 'password',
                      isNotVisible: true,
                      icon: Icons.lock,
                      type: TextInputType.none,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Do not have an account? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 111, 110, 110)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
                    child: const Text('sign up',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    _sigIn(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
