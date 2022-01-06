import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  bool chipOne = true;

  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            ChoiceChip(
              padding: const  EdgeInsets.all(8),
              selectedColor: AppColor.mainGreen.withOpacity(0.45),
              label:  SimpleText(AppString.delivery,color: chipOne?AppColor.whiteColor:AppColor.blackColor),
              selected: chipOne,
              onSelected: (value) {
                setState(() {
                  chipOne = value;
                });
              },
            ),
            const Spacer(),
            ChoiceChip(
              padding: const  EdgeInsets.all(8),
              selectedColor: AppColor.mainGreen.withOpacity(0.45),
              label:  SimpleText(AppString.pickUp,color: !chipOne?AppColor.whiteColor:AppColor.blackColor),
              selected: !chipOne,
              onSelected: (value) {
                setState(() {
                  chipOne = !value;
                });
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
        const Spacer(),
        AnimatedCrossFade(
            firstChild: const DeliveryBody(),
            secondChild: const PickUpBody(),
            crossFadeState:
                chipOne ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500)),
        const Spacer(flex: 2,),
      ],
    );
  }
}

class DeliveryBody extends StatelessWidget {
  const DeliveryBody({Key? key}) : super(key: key);
  final _sizedBox  = const SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 40,
      children: [
        Container(
          height: 200,
          width: 200,
          foregroundDecoration: BoxDecoration(
          //  color: AppColor.mainGreen,
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(image: ImageString.favoriteLogo),
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

class PickUpBody extends StatelessWidget {
  const PickUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 40,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(image: ImageString.favoriteLogo),
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
