import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  
  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      
     
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(0),
        ),     fillColor: Colors.black,filled: false,
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}