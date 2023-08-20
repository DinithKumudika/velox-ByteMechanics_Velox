import 'package:get/get.dart';
import 'package:velox/repositories/auth_repository.dart';
import 'package:velox/screens/home_screen.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthRepository.instance.verifyOTP(otp);

    isVerified ? Get.offAll(()=> const HomeScreen()) : Get.back();
  }
}
