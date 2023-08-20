import 'package:get/get.dart';
import 'package:velox/repositories/auth_repository.dart';
import 'package:velox/screens/home_screen.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  Future<Object?> verifyOTP(String otp) async {
    Object? isVerified = await AuthRepository.instance.verifyOTP(otp);
    if (isVerified == true) {
      Get.offAll(() => const HomeScreen());
    } else {
      return isVerified;
    }
    return null;
  }
}
