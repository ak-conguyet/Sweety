import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 2
                  )
                ),
                hintText: hintText
              ),
            );
  }
}