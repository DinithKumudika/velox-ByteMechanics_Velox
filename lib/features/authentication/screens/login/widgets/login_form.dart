import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _inputEmailFocusNode = FocusNode();
  final FocusNode _inputPasswordFocusNode = FocusNode();

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

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

    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              focusNode: _inputEmailFocusNode,
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
              focusNode: _inputPasswordFocusNode,
              style: TextStyle(
                  color: _isPasswordFocused
                      ? COLOR_LIGHT
                      : Colors.grey.withOpacity(0.8)),
              obscureText: true,
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
                  suffixIcon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.grey.withOpacity(0.8),
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
                onPressed: () {},
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
