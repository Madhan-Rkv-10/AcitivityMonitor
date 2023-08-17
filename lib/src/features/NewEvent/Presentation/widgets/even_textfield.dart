import 'package:flutter/material.dart';

class EventTextFiled extends StatelessWidget {
  const EventTextFiled(
      {super.key,
      required this.controller,
      this.enabled = true,
      required this.hintText});
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            fillColor: Colors.white,
            filled: true));
  }
}
