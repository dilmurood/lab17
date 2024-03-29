import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String str;
  final bool isNotVisible;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;

  const CustomTextFormField(
      {super.key,
      required this.str,
      required this.isNotVisible,
      required this.icon,
      required this.type,
      required this.controller,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        mouseCursor: MaterialStateMouseCursor.clickable,
        obscureText: isNotVisible,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIconColor: Colors.black,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: 'Enter your $str',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter your $str';
          }
          return null;
        });
  }
}
