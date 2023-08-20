import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velox/features/authentication/models/user_model.dart';
import 'package:velox/repositories/auth_repository.dart';
import 'package:velox/repositories/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  final userRepository = Get.put(UserRepository());

  Future<String?> register(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty && email.isEmail) {
      String? error = await AuthRepository.instance
          .createUserWithEmailAndPassword(email, password);

      if (error != null) {
        return error;
      }
    }
    return null;
  }

  Future<void> createUser(UserModel user) async {
    if (user.fullName.isNotEmpty && user.phoneNo.isNotEmpty) {
      userRepository.createUser(user);
      phoneAuthentication(user.phoneNo);
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    if (phoneNo.isNotEmpty) {
      await AuthRepository.instance.phoneAuthentication(phoneNo);
    }
  }
}
