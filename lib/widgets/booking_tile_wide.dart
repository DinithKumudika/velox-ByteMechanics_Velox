import 'package:flutter/material.dart';

class WideBookingTile extends StatelessWidget {
  WideBookingTile({super.key, required this.toFrom, required this.planet, required this.planetCode, required this.destination});

final String toFrom;
final String planet;
final String planetCode;
final String destination;
  @override
  Widget build(BuildContext context) {
    var leadingIcon;
    if (toFrom == "FROM") {
      leadingIcon = Icon(
        Icons.rocket_launch_outlined,
        color: Color.fromRGBO(12, 34, 55, 1),
      );
    } else {
      leadingIcon = Transform.rotate(
          angle: 3.14,
          child: Icon(
            Icons.rocket_launch_outlined,
            color: Color.fromRGBO(12, 34, 55, 1),
          ));
    }
    return ListTile(
      //give background color\
      dense: true,
      tileColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.black,
        ),
      ),
      contentPadding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.03,
      ),
      leading: Column(
        children: [
          Text(
            toFrom,
            style: TextStyle(
              color: Color.fromRGBO(12, 34, 55, 1),
              fontSize: MediaQuery.of(context).size.width * 0.038,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          leadingIcon,
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      title: Flex(direction: Axis.horizontal, children: [
        Text(planet,
            style: TextStyle(
              color: Color.fromRGBO(12, 34, 55, 1),
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            )),
        Expanded(
            child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: Text(
            planetCode,
            style: TextStyle(
              color: Color.fromRGBO(12, 34, 55, 1),
              fontSize: MediaQuery.of(context).size.width * 0.038,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        )),
      ]),
      subtitle: Text(
        destination,
        style: TextStyle(
          color: Color.fromRGBO(12, 34, 55, 1),
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        // Navigator.pushNamed(context, '/booking');
      },
    );
  }
}
