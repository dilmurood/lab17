import 'package:flutter/material.dart';
import 'package:lab17/CustomTextFormField.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    str: 'username',
                    isNotVisible: false,
                    icon: Icons.person,
                    type: TextInputType.name,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    str: 'password',
                    isNotVisible: true,
                    icon: Icons.lock,
                    type: TextInputType.none,
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  'Do not have an account? ',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 111, 110, 110)),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              child: const Text('sign up:',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
