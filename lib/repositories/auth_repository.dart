import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velox/features/authentication/screens/otp_verification_screen.dart';
import 'package:velox/screens/home_screen.dart';
import 'package:velox/features/authentication/screens/welcome_screen.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    String? message;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        //complete rest of the sign up
        // Get.offAll(() => const OTPVerificationScreen());
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);

      switch (e.code) {
        case 'email-already-exists':
          message = "user already exists with this email";
          break;
        case 'invalid-email':
          message = "email is not valid";
          break;
        case 'invalid-password':
          message =
              "invalid password. Password must have at least 8 characters";
          break;
        case 'operation-not-allowed':
          message = 'Operation Not allowed';
          break;
        default:
          message = 'Unknown error occurred';
      }
      return message;
    } catch (_) {
      message = 'Unknown error occurred';
      return message;
    }
    return null;
  }

  createUser(user, String fullName, String phoneNo) {}

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Invalid phone number');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: this.verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }
}
