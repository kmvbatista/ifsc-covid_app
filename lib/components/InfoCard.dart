import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  InfoCard(
      {@required this.mainText,
      @required this.title,
      @required this.secondaryText,
      this.isPositive = false});
  final String mainText;
  final String title;
  final String secondaryText;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    Color mainColor = isPositive ? Colors.green : Colors.red;
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 5))
          ]),
      child: Column(
        children: [
          Container(
            color: mainColor,
            height: 10,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 5),
          ),
          Text(
            title + " hoje",
            style: TextStyle(
                color: Color.fromRGBO(168, 175, 185, 1), fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              mainText,
              style: TextStyle(color: mainColor, fontSize: 18),
            ),
          ),
          Text(
            secondaryText + " no total",
            style: TextStyle(
                color: Color.fromRGBO(168, 175, 185, 1), fontSize: 17),
          ),
        ],
      ),
    );
  }
}
