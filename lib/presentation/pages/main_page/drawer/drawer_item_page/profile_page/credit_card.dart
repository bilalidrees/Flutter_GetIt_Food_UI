import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  double horizontalDrag = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onHorizontalDragUpdate: (horizontal) {
      //   setState(() {
      //     horizontalDrag += horizontal.delta.dx;
      //     horizontalDrag %= 360;
      //   });
      // },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi / 180 * horizontalDrag),
        alignment: Alignment.center,
        child: Container(
          width: 310,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Color(0xff323232), AppColor.mainGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: horizontalDrag <= 90 || horizontalDrag >= 270
              ? cardFront()
              : cardBack(),
        ),
      ),
    );
  }

  Widget cardFront() {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                'puzzlebank',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Text(
                '|',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 10,
                  fontSize: 10,
                ),
              ),
              Text(
                'Universal Bank',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/chip.png',
            height: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '1234 5678 9101 1121',
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                wordSpacing: 15,
                shadows: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  )
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '05 / 20',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget cardBack() {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey[700],
          )
        ],
      ),
    );
  }
}