import 'package:flutter/material.dart';

class VerticalBookingTile extends StatelessWidget {

  VerticalBookingTile({
    required this.leadingIcon,
    required this.title,
    required this.estTime,
    required this.distance,
    required this.cost,
  });

  final IconData leadingIcon;
  final String title;
  final String estTime;
  final String distance;
  final String cost;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.40,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(12, 34, 55, 1),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            leadingIcon,
            color: Color.fromRGBO(12, 34, 55, 1),
            size: MediaQuery.of(context).size.height * 0.10,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          //horizontal line
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 2.0,
            width: MediaQuery.of(context).size.width * 0.30,
            color: Color.fromRGBO(12, 34, 55, 1),
          ),
          Row(
            children: [
              Text(
                "Est Time: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(estTime),
            ],
          ),
          Row(
            children: [
              Text(
                "Distance: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(distance),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_bitcoin, color: Color.fromRGBO(12, 34, 55, 1)),
              Text(
                cost,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
