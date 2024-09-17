import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:login/controllers/auth_bloc.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/login_page.dart';
import 'package:login/widget/login_and_register/login_register_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (_) => AuthBloc(),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Get.off(() => const HomePage());
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  final authBloc = context.read<AuthBloc>();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthWidgets.logo(),
                      const SizedBox(height: 40),
                      AuthWidgets.welcomeText(isLogin: false),
                      const SizedBox(height: 30),
                      AuthWidgets.textField(
                        hintText: 'Name',
                        controller: authBloc.nameController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      AuthWidgets.textField(
                        hintText: 'Email',
                        controller: authBloc.emailController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      AuthWidgets.textField(
                        hintText: 'Password',
                        controller: authBloc.passwordController,
                        obscureText: authBloc.obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            authBloc.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            authBloc.add(TogglePasswordVisibility());
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      AuthWidgets.textField(
                        hintText: 'Confirm Password',
                        controller: authBloc.confirmPasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AuthWidgets.primaryButton(
                        text: 'Sign Up',
                        onPressed: () {
                          authBloc.add(RegisterRequested(
                            authBloc.nameController.text,
                            authBloc.emailController.text,
                            authBloc.passwordController.text,
                            authBloc.confirmPasswordController.text,
                          ));
                        },
                      ),
                      const SizedBox(height: 15),
                      AuthWidgets.navigationLink(
                        isLogin: false,
                        onPressed: () {
                          Get.to(() => const LoginPage());
                        },
                        text: 'Already Registered? Login  ',
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
