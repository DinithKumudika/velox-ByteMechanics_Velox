import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/features/authentication/controllers/login_controller.dart';
import 'package:velox/screens/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _inputEmailFocusNode = FocusNode();
  final FocusNode _inputPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

  bool passwordToggle = true;

  @override
  void initState() {
    super.initState();
    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _inputEmailFocusNode.hasFocus;
      });
    });

    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _inputPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _inputEmailFocusNode.dispose();
    _inputPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: loginController.email,
              validator: (value) => validateEmail(value),
              focusNode: _inputEmailFocusNode,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: _isEmailFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_sharp,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  labelText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(
                    color: _isEmailFocused
                        ? COLOR_LIGHT
                        : Colors.grey.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: COLOR_LIGHT),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor:
                      _isEmailFocused ? Colors.transparent : COLOR_LIGHT),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: loginController.password,
              validator: (value) => validatePassword(value),
              focusNode: _inputPasswordFocusNode,
              style: TextStyle(
                  color: _isPasswordFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              obscureText: passwordToggle,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline_sharp,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  labelText: 'Password',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: COLOR_LIGHT),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: passwordToggle
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    color: Colors.grey.withOpacity(0.8),
                    onPressed: () {
                      setState(() {
                        passwordToggle = !passwordToggle;
                      });
                    },
                  ),
                  filled: true,
                  fillColor:
                      _isPasswordFocused ? Colors.transparent : COLOR_LIGHT),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: COLOR_GRAY,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String? error = await LoginController.instance.login(
                      loginController.email.text.trim(),
                      loginController.password.text.trim(),
                    );

                    if (error != null) {
                      Get.showSnackbar(
                        GetSnackBar(
                          backgroundColor: COLOR_DANGER,
                          message: error.toString(),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    } else {
                      Get.offAll(
                        () => const HomeScreen(),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.9, 55.0),
                  backgroundColor: COLOR_LIGHT.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "login".toUpperCase(),
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? email) {
  String regex =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  RegExp regExp = RegExp(regex);

  if (email!.isEmpty) {
    return "email is required";
  } else if (!regExp.hasMatch(email)) {
    return "invalid email";
  }
  return null;
}

String? validatePassword(String? password) {
  String regex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(regex);

  if (password!.isEmpty) {
    return "password is required";
  } else if (password.length > 30) {
    return "password should be less than 30 characters";
  } else if (!regExp.hasMatch(password)) {
    return "invalid password";
  }
  return null;
}
