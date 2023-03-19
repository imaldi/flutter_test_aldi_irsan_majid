import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  // final String? hint;
  const MyTextField({this.controller, this.decoration, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration,
    );
  }
}
