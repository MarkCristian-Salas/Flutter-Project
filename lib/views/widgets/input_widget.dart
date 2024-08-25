import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, // White background to match the new design
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Subtle shadow for depth
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // No visible border
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey[600], // Light grey hint text
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // Padding for comfortable typing
        ),
        style: GoogleFonts.poppins(), // Consistent font style
      ),
    );
  }
}
