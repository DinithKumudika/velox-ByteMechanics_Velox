import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velox/repositories/auth_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  void register(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty && email.isEmail) {
      String? error = AuthRepository.instance
          .createUserWithEmailAndPassword(email, password) as String?;

      if (error != null) {
        Get.showSnackbar(GetSnackBar(
          message: error.toString(),
        ));
      }
    }
  }

  void phoneAuthentication(String phoneNo) {
    if (phoneNo.isNotEmpty) {
      AuthRepository.instance.phoneAuthentication(phoneNo);
    }
  }
}
