import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:login/restapi/constants.dart';
import 'package:login/screens/home.dart';
import '../screens/login_page.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation
      };

      var response = await http.post(
        Uri.parse('${url}register'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      isLoading.value = false;

      if (response.body.isNotEmpty) {
        try {
          var jsonResponse = json.decode(response.body);

          if (response.statusCode == 201) {
            //debugPrint('Registration Successful: $jsonResponse');
            token.value = json.decode(response.body)['token'];
            box.write('token', token.value);
            Get.offAll(() => const LoginPage());
          } else {
            var message = jsonResponse['message'] ?? 'Unknown error';
            Get.snackbar(
              'Error',
              message,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            debugPrint('Registration Failed: $jsonResponse');
          }
        } catch (e) {
          debugPrint('Error decoding JSON: ${e.toString()}');
        }
      } else {
        debugPrint('Response body is empty');
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error: ${e.toString()}');
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      isLoading.value = false;

      if (response.body.isNotEmpty) {
        try {
          var jsonResponse = json.decode(response.body);

          if (response.statusCode == 201) {
            //debugPrint('Registration Successful: $jsonResponse');
            token.value = json.decode(response.body)['token'];
            box.write('token', token.value);
            Get.offAll(() => const HomePage());
          } else {
            var message = jsonResponse['message'] ?? 'Unknown error';
            Get.snackbar(
              'Error',
              message,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            debugPrint('Registration Failed: $jsonResponse');
          }
        } catch (e) {
          debugPrint('Error decoding JSON: ${e.toString()}');
        }
      } else {
        debugPrint('Response body is empty');
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error: ${e.toString()}');
    }
  }
}
