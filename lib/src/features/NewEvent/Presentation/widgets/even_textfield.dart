import 'package:flutter/material.dart';

class EventTextFiled extends StatelessWidget {
  const EventTextFiled(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            fillColor: Colors.white,
            filled: true));
  }
}
