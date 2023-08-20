import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(
          () => Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: COLOR_SUCCESS,
              title: 'Success',
              message: 'Account has been created',
              duration: Duration(seconds: 3),
            ),
          ),
        )
        .catchError((error) {
      Get.showSnackbar(
        const GetSnackBar(
          backgroundColor: COLOR_DANGER,
          title: 'Error',
          message: 'Something went wrong',
          duration: Duration(seconds: 3),
        ),
      );
      print(error.toString());
    });
  }

  updateUser() {}
}
