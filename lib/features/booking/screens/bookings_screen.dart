import 'package:flutter/material.dart';
import 'package:velox/constants/colors.dart';
import 'package:velox/features/booking/screens/widgets/finished_bookings.dart';
import 'package:velox/features/booking/screens/widgets/ongoing_bookings.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [COLOR_DARK, COLOR_PRIMARY],
                  stops: [0, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            backgroundColor: COLOR_PRIMARY,
            centerTitle: true,
            bottom: TabBar(
              tabs: const [
                Tab(text: "Ongoing"),
                Tab(text: "Finished"),
              ],
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(
                  horizontal: size.width * 0.4,
                ),
              ),
              indicatorColor: COLOR_LIGHT,
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: OngoingBookings(),
              ),
              Container(
                child: FinishedBookings(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
