import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velox/constants/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:velox/features/authentication/controllers/signup_controller.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final FocusNode _inputFullNameFocusNode = FocusNode();
  final FocusNode _inputEmailFocusNode = FocusNode();
  final FocusNode _inputPhoneFocusNode = FocusNode();
  final FocusNode _inputPasswordFocusNode = FocusNode();

  bool _isFullNameFocused = false;
  bool _isEmailFocused = false;
  bool _isPhoneFocused = false;
  bool _isPasswordFocused = false;

  bool passwordToggle = true;

  String initialCountry = 'LK';
  PhoneNumber number = PhoneNumber(isoCode: 'LK');

  @override
  void initState() {
    super.initState();

    _inputFullNameFocusNode.addListener(() {
      setState(() {
        _isFullNameFocused = _inputFullNameFocusNode.hasFocus;
      });
    });

    _inputEmailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _inputEmailFocusNode.hasFocus;
      });
    });

    _inputPhoneFocusNode.addListener(() {
      setState(() {
        _isPhoneFocused = _inputPhoneFocusNode.hasFocus;
      });
    });

    _inputPasswordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _inputPasswordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _inputFullNameFocusNode.dispose();
    _inputEmailFocusNode.dispose();
    _inputPhoneFocusNode.dispose();
    _inputPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signUpController = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: signUpController.fullName,
              validator: (value) => validateFullName(value),
              focusNode: _inputFullNameFocusNode,
              keyboardType: TextInputType.name,
              style: TextStyle(
                  color: _isFullNameFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.grey.withOpacity(0.8),
                ),
                labelText: 'Full Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                  color: _isFullNameFocused
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
                    _isFullNameFocused ? Colors.transparent : COLOR_LIGHT,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: signUpController.email,
              validator: (value) => validateEmail(value),
              focusNode: _inputEmailFocusNode,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: _isEmailFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_outline_sharp,
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
                fillColor: _isEmailFocused ? Colors.transparent : COLOR_LIGHT,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            InternationalPhoneNumberInput(
              textFieldController: signUpController.phoneNo,
              validator: (value) => validatePhoneNo(value),
              focusNode: _inputPhoneFocusNode,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              textStyle: TextStyle(
                  color: _isPhoneFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              formatInput: true,
              initialValue: number,
              selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
              selectorTextStyle: TextStyle(
                  color: _isPhoneFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              inputDecoration: InputDecoration(
                labelText: 'Phone No',
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
                filled: true,
                fillColor: _isPhoneFocused ? Colors.transparent : COLOR_LIGHT,
              ),
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: signUpController.password,
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
                    _isPasswordFocused ? Colors.transparent : COLOR_LIGHT,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SignUpController.instance.register(
                      signUpController.email.text.trim(),
                      signUpController.password.text.trim(),
                    );
                    SignUpController.instance.phoneAuthentication(
                      signUpController.phoneNo.text.trim(),
                    );
                    Navigator.pushNamed(context, '/otp');
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
                  "sign up".toUpperCase(),
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

String? validateFullName(String? value) {
  if (value!.isEmpty) {
    return "full name is required";
  }
  return null;
}

String? validateEmail(String? value) {
  String regex =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  RegExp regExp = RegExp(regex);

  if (value!.isEmpty) {
    return "email is required";
  } else if (!regExp.hasMatch(value)) {
    return "invalid email";
  }
  return null;
}

String? validatePhoneNo(String? value) {
  if (value!.isEmpty) {
    return "phone no is required";
  } else if (value.length != 9) {
    return "invalid phone no";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "password is required";
  } else if (value.length < 8) {
    return "password should be more than 8 characters";
  } else if (value.length > 30) {
    return "password";
  }
  return null;
}
