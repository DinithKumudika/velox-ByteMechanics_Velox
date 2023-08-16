import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  void _onTap(BuildContext context) {
    // login screen on tap
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
        backgroundColor: COLOR_DARK,
        body: SafeArea(
          child: Container(
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
                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8),
                //     child: SvgPicture.asset(
                //       logo,
                //       width: MediaQuery.of(context).size.width * 0.6,
                //       height: MediaQuery.of(context).size.height * 0.6,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Center(
                  child: Lottie.asset(
                    'assets/animations/splash_loader.json',
                    controller: _controller,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    onLoaded: (compos) {
                      _controller
                        ..duration = compos.duration
                        ..forward().then((value) => Navigator.pushNamed(context, '/login'));
                    },
                    fit: BoxFit.contain
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
