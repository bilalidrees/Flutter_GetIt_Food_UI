import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class LocationWalkThrough extends StatelessWidget {
  const LocationWalkThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Image.asset(
              ImageString.location,
              height: 300,
              width: 300,
            ),
            const SimpleText(AppString.findRestaurant, fontSize: 32, enumText: EnumText.extraBold),
            const SizedBox(height: 20),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 38.0),
              child:  SimpleText(AppString.locationDescription, fontSize: 20, enumText: EnumText.regular),
            ),
            const SizedBox(height: 100),
            BigButton(
                text: AppString.allowAccessLocation,
                onPressed: () {
                  Navigator.pushNamed(context, RouteString.map, arguments: true);
                }),
            const SizedBox(height: 30),
            const SimpleText(AppString.enterMyLocation,
                fontSize: 28, enumText: EnumText.extraBold),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
