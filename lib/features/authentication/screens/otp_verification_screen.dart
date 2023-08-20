import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:velox/constants/images.dart';
import 'package:velox/features/authentication/controllers/otp_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  // final String phoneNo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpController = Get.put(OTPController());
    var otp;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: COLOR_DARK,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [COLOR_DARK, COLOR_PRIMARY],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(logoImg),
              width: size.width * 0.3,
              height: size.height * 0.2,
            ),
            const Text(
              "Phone Verification",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: COLOR_LIGHT),
            ),
            Text(
              "Enter the OTP code sent to +94 71 222 34 56",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              keyboardType: TextInputType.number,
              numberOfFields: 6,
              autoFocus: true,
              fillColor: COLOR_GRAY.withOpacity(0.5),
              filled: true,
              showFieldAsBox: true,
              borderColor: COLOR_LIGHT,
              onSubmit: (value) {
                otp = value;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                OTPController.instance.verifyOTP(otp);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.9, 55.0),
                backgroundColor: COLOR_LIGHT.withOpacity(0.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "verify".toUpperCase(),
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
