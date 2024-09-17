import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:login/controllers/auth_bloc.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/register_page.dart';
import 'package:login/widget/login_and_register/login_register_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    // Handle error state
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
                      AuthWidgets.welcomeText(isLogin: true),
                      const SizedBox(height: 30),
                      AuthWidgets.textField(
                        hintText: 'Email',
                        controller: authBloc.emailController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      AuthWidgets.primaryButton(
                        text: 'Login',
                        onPressed: () {
                          authBloc.add(LoginRequested(
                            authBloc.emailController.text,
                            authBloc.passwordController.text,
                          ));
                        },
                      ),
                      const SizedBox(height: 10),
                      AuthWidgets.navigationLink(
                        isLogin: true,
                        onPressed: () {
                          Get.to(() => const RegisterPage());
                        },
                        text: 'Create new account? Signup',
                      ),
                      const SizedBox(height: 20),
                      AuthWidgets.forgotPasswordButton(onPressed: () {}),
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
