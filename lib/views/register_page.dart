import 'package:flutter/material.dart';
import 'package:login/views/home.dart'; 
import 'package:login/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:login/views/widgets/app_background.dart';
import 'package:login/views/widgets/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool _agreedToTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(child: SizedBox.expand()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo1.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Welcome User',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sign up to join',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    InputWidget(
                      hintText: 'Name',
                      obscureText: false,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 15),
                    InputWidget(
                      hintText: 'Email',
                      obscureText: false,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 15),
                    InputWidget(
                      hintText: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 15),
                    InputWidget(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller: _confirmpasswordController,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: _agreedToTerms
                          ? () {
                              Get.to(() => HomePage());
                            }
                          : null,
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginPage());
                      },
                      child: Text(
                        'Already Registered? Login',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
