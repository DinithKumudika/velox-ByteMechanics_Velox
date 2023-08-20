import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Bookings',
              style: TextStyle(
                fontSize: 20,
                color: COLOR_LIGHT,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Ongoing'),
                Tab(text: 'Finished'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
