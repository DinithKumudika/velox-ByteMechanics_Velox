import 'package:flutter/material.dart';
import 'package:velox/widgets/booking_tile_narrow.dart';
import 'package:velox/widgets/booking_tile_vertical.dart';

import '../widgets/booking_tile_wide.dart';

class BookingScreen extends StatefulWidget {
  static const routeName = '/booking-screen';

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController _departureDateController = TextEditingController();
  TextEditingController _returnDateController = TextEditingController();
  TextEditingController _travelerController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  String _selectedTransportMode = 'Rocket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Screen'),
      ),
      body: Container(
        //add background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WideBookingTile(
                toFrom: "FROM",
                planet: "Earth",
                planetCode: "EAR",
                destination: "Bandaranayake Internation Space Station",
      
              ),
              WideBookingTile(
                toFrom: "TO",
                planet: "Saturn",
                planetCode: "SAT",
                destination: "Matara B K Indetanationala Space Station",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NarrowBookingTile(
                    leadingIcon: Icons.calendar_month_outlined,
                    title: 'Departure',
                    isDatePicker: true,
                    controller: _departureDateController,
                  ),
                  NarrowBookingTile(
                    leadingIcon: Icons.calendar_month_outlined,
                    title: 'Return',
                    isDatePicker: true,
                    controller: _returnDateController,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NarrowBookingTile(
                    //leading icon to show multiple users
                    leadingIcon: Icons.people_alt_outlined,
                    title: 'Traveler',
                    isNumPicker: true,
                    controller: _travelerController,
                  ),
                  NarrowBookingTile(
                    leadingIcon: Icons.book_outlined,
                    title: 'Class',
                    isDropDown: true,
                    dropDownItems: ['Economy', 'Business', 'First'],
                    controller: _classController,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedTransportMode == 'Rocket') {
                      _selectedTransportMode = 'Teleport';
                    } else {
                      _selectedTransportMode = 'Rocket';
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //add blur effect based on the selected transport mode
                      decoration: BoxDecoration(
                        color: _selectedTransportMode == 'Rocket'
                            ? Color.fromRGBO(255, 255, 255, 0.25)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: VerticalBookingTile(
                        leadingIcon: Icons.rocket_launch_outlined,
                        title: 'Rocket',
                        estTime: '2 Ehours',
                        distance: '1 AU',
                        cost: '2000',
                      ),
                    ),
                    Container(
                      //add blur effect based on the selected transport mode
                      decoration: BoxDecoration(
                        color: _selectedTransportMode == 'Teleport'
                            ? Color.fromRGBO(255, 255, 255, 0.25)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: VerticalBookingTile(
                        leadingIcon: Icons.person_outline,
                        title: 'Teleport',
                        estTime: '2 EMins',
                        distance: '1 AU',
                        cost: '15000',
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
