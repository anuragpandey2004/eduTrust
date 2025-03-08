import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyprofileTextField extends StatefulWidget {
  final TextEditingController controllers;
  final TextInputType keyboardType;
  final String hintText;
  final int minValue;
  final String? Function(String?)? validator;

  const MyprofileTextField(
      {required this.controllers,
      this.keyboardType = TextInputType.text,
      this.hintText = "",
      this.minValue = 0,
      this.validator,
      super.key});

  @override
  State<MyprofileTextField> createState() => _MyprofileTextFieldState();
}

class _MyprofileTextFieldState extends State<MyprofileTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextFormField(
          controller: widget.controllers,
          keyboardType: widget.keyboardType,

          //maxLines: null,
          //expands: true,
          validator: widget.validator,
          style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1F2937)),
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
    );
  }
}
