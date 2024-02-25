import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool obsucreText;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText,
      required this.obsucreText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(title),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            obscureText: obsucreText,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey.shade700)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700)),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade700)),
          ),
        ],
      ),
    );
  }
}
