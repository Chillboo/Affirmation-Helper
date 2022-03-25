import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextWindow extends StatelessWidget {
  double width;
  double height;
  String text;

  CustomTextWindow({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 173, 68, 159),
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(text,
          style: GoogleFonts.notoSans(
            fontSize: 23,
            color: const Color.fromARGB(255, 66, 66, 66),
          )),
    );
  }
}
