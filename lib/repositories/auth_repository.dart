import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
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
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    }
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    String? message;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {}
    } on FirebaseAuthException catch (e) {
      print(e.code);

      switch (e.code) {
        case 'weak-password':
          message = "Password must have at least 8 characters";
          break;
        case 'email-already-in-use':
          message = "user already exists with that email";
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
          break;
      }
      return message;
    } catch (_) {
      message = 'Unknown error occurred';
      return message;
    }
    return null;
  }

  createUser(user, String fullName, String phoneNo) {}

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    String? message;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          message = 'No user exists for that email';
          break;
        case 'wrong-password':
          message = 'Invalid password';
          break;
        default:
          message = 'Unknown error occurred';
          break;
      }
      return message;
    } catch (_) {
      message = 'Unknown error occurred';
      return message;
    }
    return null;
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
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await _auth.signInWithCredential(credential);
        Get.offAll(() => const HomeScreen());
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: COLOR_DANGER,
              title: 'Error',
              message: 'Invalid phone number',
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: COLOR_DANGER,
              title: 'Error',
              message: 'Something went wrong. Try again.',
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.offAll(
          () => OTPVerificationScreen(
            phoneNo: phoneNo,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<Object?> verifyOTP(String otp) async {
    PhoneAuthCredential credentials = PhoneAuthProvider.credential(
      verificationId: this.verificationId.value,
      smsCode: otp,
    );
    String? message;

    try {
      var credential = await _auth.currentUser?.linkWithCredential(credentials);
      return credential?.user != null ? true : false;

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          message = "Phone no is already validated.";
          break;
        case "invalid-credential":
          message = "credential is not valid.";
          break;
        case "credential-already-in-use":
          message = "account already exists.";
          break;
        default:
          message = "Unknown error occurred. try again.";
          break;
      }
      return message;
    } catch (_) {
      message = "Unknown error occurred. try again.";
      return message;
    }

    //var credential = await _auth.signInWithCredential(credentials);
    // return credential.user != null ? true : false;
  }
}
