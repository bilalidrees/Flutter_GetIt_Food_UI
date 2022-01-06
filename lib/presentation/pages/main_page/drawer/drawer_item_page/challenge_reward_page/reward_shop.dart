import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/challenge_reward_page/challenge_reward_page.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class RewardsShop extends StatelessWidget {
  const RewardsShop({Key? key}) : super(key: key);

  Widget _container(BuildContext context) => Align(
        child: Container(
          height: 200,
          width: 125,
          padding: const EdgeInsets.only(
          ),
          margin: const EdgeInsets.only(
            right: 40,
          ),
          decoration: BoxDecoration(
              color: AppColor.lightGreen,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 1)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 65,
                decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'WIN UP TO\n\n',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 8, fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: 'Rs 100',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15)),
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25,left: 10),
                child: Row(

                  children: const [
                    Image(
                      height: 30,
                      width: 30,
                      image: ImageString.starOutline,
                    ),
                    SimpleText(
                      '250',
                      enumText: EnumText.extraBold,
                      color: AppColor.whiteTextColor,
                      fontSize: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SimpleText(
              AppString.rewardShopDesc,
              textAlign: TextAlign.start,
              vertical: 10,
              enumText: EnumText.extraBold,
            ),
            const SimpleText(
              AppString.claimYourPrize,
              vertical: 10,
              textAlign: TextAlign.start,
              enumText: EnumText.extraBold,
            ),
            const Align(alignment: Alignment.centerLeft, child: Points()),
          ])),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _container(context),
              ),
            ),
          ),
           SliverToBoxAdapter(
            child: Row(
              children:const  [
                SimpleText(
                  '*' + AppString.termsAndCondition,
                  enumText: EnumText.bold,
                  textAlign: TextAlign.start,
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
