import 'package:flutter/material.dart';
import 'package:login/views/home.dart';
import 'package:login/views/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:login/views/widgets/app_background.dart';
import 'package:login/views/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Password visibilitysm kimpampara

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(child: SizedBox.expand()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                    const SizedBox(height: 40),
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sign in to continue',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    InputWidget(
                      hintText: 'Email',
                      obscureText: false,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    InputWidget(
                      hintText: 'Password',
                      obscureText: _obscureText,
                      controller: _passwordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => HomePage());
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const RegisterPage());
                      },
                      child: Text(
                        'Create new account? Signup',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
