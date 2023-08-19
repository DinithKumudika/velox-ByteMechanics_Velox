import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/repositories/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void login(String email, String password) {
    AuthRepository.instance.loginWithEmailAndPassword(email, password);
  }
}
