import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/profile_page/credit_card.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/category_section.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: SimpleText(
                    AppString.myCards,
                    enumText: EnumText.extraBold,
                    vertical: 10,
                  )),
              Expanded(
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => const Image(
                                image: AssetImage('assets/images/CARD(1).png')
                              ),
                          childCount: 1),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      CircularButton(onPressed: () {}, iconData: Icons.add)
                    ])),
                  ],
                ),
              ),
            ],
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  SimpleText(AppString.addNewCard),
                  Spacer(),
                  Icon(
                    Icons.add,
                    color: AppColor.blackColor,
                    size: 35,
                  )
                ],
              ),
              const Spacer(),
              BigButton(text: AppString.addNow, onPressed: () {}),
            ],
          ),
        )),
      ],
    );
  }
}
