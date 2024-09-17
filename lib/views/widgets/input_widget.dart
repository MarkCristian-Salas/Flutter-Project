import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    this.suffixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 203, 228, 240), // Stroke color
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey[600],
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: suffixIcon,
        ),
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
