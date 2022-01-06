import 'package:flutter/material.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/category_section.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class CartQuickItemCard extends StatelessWidget {
  const CartQuickItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
              height: 100,
              width: 90,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()),
              child: const Image(
                image: ImageString.burger,
                fit: BoxFit.contain,
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SimpleText(
                  'Chicken Fajita',
                  fontSize: 12,
                  color: AppColor.mainGreen,
                  enumText: EnumText.light,
                ),
                const SimpleText(
                  'pizza',
                  fontSize: 12,
                  color: AppColor.mainGreen,
                  enumText: EnumText.light,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SimpleText(
                      'Rs. 540.00',
                      fontSize: 10,
                      color: AppColor.mainGreen,
                      enumText: EnumText.light,
                    ),
                    CircularButton(
                      onPressed: () {},
                      iconData: Icons.add,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}