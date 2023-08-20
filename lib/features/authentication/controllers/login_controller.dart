import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/repositories/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<String?> login(String email, String password) async {
    final String? error = await AuthRepository.instance
        .loginWithEmailAndPassword(email, password);

    if (error != null) {
      print(error);
      return error;
    }
    return null;
  }
}
