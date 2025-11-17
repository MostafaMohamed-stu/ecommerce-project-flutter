import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData iconData;
  final bool showpass;
  final String? Function(String?) vald;

  const TextFieldWidget({
    required this.controller,
    required this.label,
    required this.iconData,
    required this.showpass,
    required this.vald,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextFormField(
        validator: vald,
        controller: controller,
        obscureText: showpass,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
