import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/foody_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';
import 'package:foody_yo/presentation/widgets/rounded_textfield.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  final _sizedBox = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const FoodyAppBar(),
        body: Center(
          child: Column(
            children: [
              _sizedBox,
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SimpleText(AppString.welcome,
                      enumText: EnumText.bold, fontSize: 34),
                ),
              ),
              _sizedBox,
              const RoundedTextField(
                leading: Icon(Icons.search, color: AppColor.mainGreen),
                hintText: AppString.search,
                fontColor: AppColor.mainGreen,
                enableShadow: true,
              ),
              _sizedBox,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.main,
                      arguments: const TempAuth(false, EnumCraving.delivery));
                },
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      color: AppColor.mainGreen,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          offset: Offset(0, 3.0),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SimpleText(AppString.foodDelivery,
                          color: AppColor.whiteColor,
                          fontSize: 28,
                          enumText: EnumText.bold),
                      Image(image: ImageString.burger, width: 120),
                    ],
                  ),
                ),
              ),
              _sizedBox,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.main,
                      arguments: const TempAuth(false, EnumCraving.pickUp));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 150),
                  width: 150,
                  height: 260,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColor.mainGreen,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          offset: Offset(0, 3.0),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SimpleText(AppString.pickUp,
                          color: AppColor.whiteColor,
                          fontSize: 28,
                          enumText: EnumText.bold),
                      Image(image: ImageString.takeFood),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
