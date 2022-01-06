import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import '../../../../enums.dart';
class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 40,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(image: ImageString.favoriteLogo),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),

        const SimpleText(AppString.noFavourite,
            enumText: EnumText.extraBold, fontSize: 24),

        const SimpleText(AppString.noFavouriteDesc, fontSize: 14),

        SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: const SimpleText(AppString.favouriteButtonText,
                color: AppColor.whiteColor, fontSize: 16),
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                primary: AppColor.mainGreen),
          ),
        )
      ],
    );
  }
}
