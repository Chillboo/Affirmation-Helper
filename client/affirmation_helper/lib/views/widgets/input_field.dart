import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: title,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            controller: textEditingController,
          ),
        ),
      ),
    );
  }
}
