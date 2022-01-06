import 'package:flutter/material.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';


class ReceivedCard extends StatelessWidget {
  const ReceivedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
         // color: Colors.white,
          border: Border.all(color: Colors.black45, width: .1),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: Offset(0, 3.0),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ImageString.burger,
                ),
              ),
              child: Container(
                height: 28,
                width: 90,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: AppColor.mainGreen,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const SimpleText('Received',
                    color: AppColor.whiteTextColor, fontSize: 17.0),
              ),
            ),
          ),
          Container(
              color: AppColor.blackColor,
              width: 0.5,
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10)),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Spacer(),
                  SimpleText('Al-Haj Akhtar',
                      enumText: EnumText.extraBold, fontSize: 26),
                  Spacer(flex: 3,),
                  SimpleText('Created: Today, 1:33am',
                      enumText: EnumText.regular, fontSize: 18),
                  SimpleText('Order Status: Received',
                      enumText: EnumText.regular, fontSize: 18),
                  Spacer(flex: 3,),
                  SimpleText('1 Item',
                      enumText: EnumText.extraBold, fontSize: 22),
                  Spacer(),
                ],
              )),
        ],
      ),
    );
  }
}
