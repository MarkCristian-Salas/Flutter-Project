import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequested(this.name, this.email, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [name, email, password, confirmPassword];
}

class TogglePasswordVisibility extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginRequested) {
      yield* _mapLoginRequestedToState(event);
    } else if (event is RegisterRequested) {
      yield* _mapRegisterRequestedToState(event);
    } else if (event is TogglePasswordVisibility) {
      yield* _mapTogglePasswordVisibilityToState();
    }
  }

  Stream<AuthState> _mapLoginRequestedToState(LoginRequested event) async* {
    try {
      // Implement your login logic here
      // Example: call an API to login
      yield AuthSuccess();
    } catch (e) {
      yield AuthFailure(e.toString());
    }
  }

  Stream<AuthState> _mapRegisterRequestedToState(
      RegisterRequested event) async* {
    try {
      // Implement your registration logic here
      // Example: call an API to register
      yield AuthSuccess();
    } catch (e) {
      yield AuthFailure(e.toString());
    }
  }

  Stream<AuthState> _mapTogglePasswordVisibilityToState() async* {
    obscureText = !obscureText;
    yield AuthInitial(); // Refresh UI
  }
}
