import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/challenge_reward_page/badge.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/challenge_reward_page/challenge.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/challenge_reward_page/reward_shop.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class ChallengeAndRewardPage extends StatelessWidget {
  const ChallengeAndRewardPage({Key? key}) : super(key: key);
  Future<void> _showModal(BuildContext context) async {
    return showModalBottomSheet(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const SimpleText(
                    'Point earned',
                    fontSize: 28,
                    enumText: EnumText.extraBold,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SimpleText(
                    'Your past activities',
                    fontSize: 14,
                    enumText: EnumText.extraBold,
                  ),
                  Spacer(),
                  Image(
                    image: ImageString.starOutline,
                    height: 30,
                    width: 30,
                  ),
                  SimpleText(
                    '0',
                    fontSize: 14,
                    enumText: EnumText.extraBold,
                    horizontal: 10,
                    vertical: 10,
                  ),
                ],
              ),
              const Divider(thickness: 2.5,color: Colors.black54,),
              const    Spacer(
                flex: 3,
              ),
              const   SimpleText(
                'Let\'s play!',
                fontSize: 28,
                enumText: EnumText.extraBold,
              ),
              const  Spacer(),
            ],
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.grey,
          appBar: FoodyTabAppBar(
            appbarSize: 150,
            title: AppString.challengeAndReward,
            isScrollable: true,
            fontSize: 26,
            leading: TextButton(
                onPressed: () => _showModal(context),
                child: const SimpleText(AppString.help,)),
            tabBar: const [
              SimpleText(AppString.challenges,
                  enumText: EnumText.extraBold, vertical: 5),
              SimpleText(AppString.badge,
                  enumText: EnumText.extraBold, vertical: 5),
              SimpleText(AppString.rewardsShop,
                  enumText: EnumText.extraBold, vertical: 5),
            ],
          ),
          body: const TabBarView(
            children: [
              Challenge(),
              Badge(),
              RewardsShop(),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////

class Points extends StatelessWidget {
  const Points({Key? key}) : super(key: key);

  Future<void> _showModal(BuildContext context) async {
    return showModalBottomSheet(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SimpleText(
                        'Point earned',
                        fontSize: 28,
                        enumText: EnumText.extraBold,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SimpleText(
                        'Your past activities',
                        fontSize: 14,
                        enumText: EnumText.extraBold,
                      ),
                      Spacer(),
                      Image(
                        image: ImageString.starOutline,
                        height: 30,
                        width: 30,
                      ),
                      SimpleText(
                        '0',
                        fontSize: 14,
                        enumText: EnumText.extraBold,
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ],
                  ),
                  const Divider(thickness: 2.5,color: Colors.black54,),
                  const    Spacer(
                    flex: 3,
                  ),
                  const   SimpleText(
                    'Let\'s play!',
                    fontSize: 28,
                    enumText: EnumText.extraBold,
                  ),
                  const  Spacer(),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _showModal(context);
      },
      child: Container(
        height: 60,
        width: 180,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 3.0),
          )
        ], borderRadius: BorderRadius.circular(20), color: AppColor.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              child: const Image(
                image: ImageString.starOutline,
                height: 30,
              ),
              backgroundColor: AppColor.grey,
            ),
            const SimpleText('0 Points'),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}

class HowItWordStep extends StatelessWidget {
  final String number;
  final String stepDesc;

  const HowItWordStep(this.number, this.stepDesc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: AppColor.whiteColor, shape: BoxShape.circle),
          child: Center(
            child: SimpleText(number),
          ),
        ),
        SimpleText(
          stepDesc,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key}) : super(key: key);
  static const List<String> _taskCount = ['1', '2'];

  Widget _bottom(String string, ImageProvider image) => Row(
        children: [
          Image(
            image: image,
            width: 20,
            height: 20,
          ),
          SimpleText(string, fontSize: 12, enumText: EnumText.regular),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 230,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          border: Border.all(),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 3.0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppColor.whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SimpleText(
            AppString.taskDesc1,
            textAlign: TextAlign.start,
            color: AppColor.mainGreen,
            fontSize: 16,
            enumText: EnumText.bold,
          ),
          Row(
            children: _taskCount
                .map((e) => Expanded(
                        child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 16),
                      height: 8,
                      decoration: BoxDecoration(
                          color: AppColor.lightGreen,
                          borderRadius: BorderRadius.circular(10)),
                    )))
                .toList(),
          ),
          Row(
            children: [
              _bottom(AppString.getPoint, ImageString.starOutline),
              const SizedBox(width: 10),
              _bottom(AppString.dayLeft, ImageString.clock),
            ],
          ),
        ],
      ),
    );
  }
}
