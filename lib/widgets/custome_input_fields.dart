import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  final bool obscureText;

  CustomeTextFormField(
      {required this.onSaved,
      required this.regEx,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : 'Enter a valid value';
      },
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(30, 29, 37, 1.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  // const CustomTextField({Key? key}) : super(key: key);

  final Function(String) OnEditingComplete;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  IconData? icon;

  CustomTextField({
    required this.OnEditingComplete,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: () => OnEditingComplete(controller.value.text),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: obsecureText,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(30, 29, 37, 1.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(
          icon,
          color: Colors.white54,
        ),
      ),
    );
  }
}
