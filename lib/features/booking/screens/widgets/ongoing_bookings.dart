import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/constants/images.dart';

class OngoingBookings extends StatelessWidget {
  const OngoingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
          image: DecorationImage(
            image: AssetImage(logoImg),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                width: size.width * 0.9,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: COLOR_GRAY.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'From',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: COLOR_LIGHT,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Colombo 07, Earth',
                                style: TextStyle(
                                    fontSize: 15.0, color: COLOR_LIGHT),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: COLOR_LIGHT,
                                  ),
                                  Text(
                                    '15/07/2050',
                                    style: TextStyle(
                                        fontSize: 15.0, color: COLOR_LIGHT),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: COLOR_LIGHT,
                                  ),
                                  Text(
                                    '14 : 30 PM',
                                    style: TextStyle(
                                        fontSize: 15.0, color: COLOR_LIGHT),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'To',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: COLOR_LIGHT,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Aurora Dome, Saturn',
                                style: TextStyle(
                                    fontSize: 15.0, color: COLOR_LIGHT),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: COLOR_LIGHT,
                                  ),
                                  Text(
                                    '15/07/2050',
                                    style: TextStyle(
                                        fontSize: 15.0, color: COLOR_LIGHT),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: COLOR_LIGHT,
                                  ),
                                  Text(
                                    '16 : 30 PM',
                                    style: TextStyle(
                                        fontSize: 15.0, color: COLOR_LIGHT),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: COLOR_DANGER,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(
                            const Size(150.0, 50.0),
                          ),
                        ),
                        child: Text(
                          'cancel'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: COLOR_DANGER,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
