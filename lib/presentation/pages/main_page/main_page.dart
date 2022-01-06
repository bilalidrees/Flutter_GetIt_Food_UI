import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/main_appbar.dart';
import 'package:foody_yo/presentation/widgets/main_card.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import 'food_panda/panda_screen.dart';

class MainPage extends StatelessWidget {
  final Animation animation;
  final AnimationController animationController;
  final TempAuth auth;
  final ValueNotifier<bool> valueNotifier;
  const MainPage(this.animation, this.animationController, this.auth,this.valueNotifier,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(
              (1 - animation.value) * 1000, (1 - animation.value) * 500, 0)
            ..scale(animation.value),
          // transform: Matrix4.translationValues(300, 150, 0)..scale(0.7),
          child: child,
        );
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: valueNotifier,
        builder: (context,value,child)=>AbsorbPointer(
          absorbing: value,
          child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            appBar: MainAppBar(animationController: animationController),
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                          auth.enumCraving==EnumCraving.pickUp
                              ? Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SimpleText(
                                  AppString.pickUpAndSave,
                                  enumText: EnumText.extraBold,
                                  fontSize: 24,
                                ),
                                SimpleText(
                                  AppString.selfCollect,
                                  enumText: EnumText.light,
                                  fontSize: 14.5,
                                ),
                                SimpleText(
                                  AppString.discount,
                                  enumText: EnumText.light,
                                  fontSize: 14.5,
                                ),
                              ],
                            ),
                          )
                              : const SizedBox.shrink(),
                        ])),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                              (context, index) => MainCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PandaScreen(auth.guest)));
                            },
                          ),
                          childCount: 3),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  heightFactor: 1,
                  widthFactor: 5.9,
                  child: FilterButton(),
                ),
              ],
            ),
          ),
        ),
        // child: AbsorbPointer(
        //   absorbing: absorb,
        //   child: Scaffold(
        //     backgroundColor: AppColor.whiteColor,
        //     appBar: MainAppBar(animationController: animationController),
        //     body: Stack(
        //       children: [
        //         CustomScrollView(
        //           slivers: [
        //             SliverList(
        //                 delegate: SliverChildListDelegate([
        //               true
        //                   ? Padding(
        //                       padding: const EdgeInsets.only(left: 40),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: const [
        //                           SimpleText(
        //                             AppString.pickUpAndSave,
        //                             enumText: EnumText.extraBold,
        //                             fontSize: 24,
        //                           ),
        //                           SimpleText(
        //                             AppString.selfCollect,
        //                             enumText: EnumText.light,
        //                             fontSize: 14.5,
        //                           ),
        //                           SimpleText(
        //                             AppString.discount,
        //                             enumText: EnumText.light,
        //                             fontSize: 14.5,
        //                           ),
        //                         ],
        //                       ),
        //                     )
        //                   : const SizedBox.shrink(),
        //             ])),
        //             SliverList(
        //               delegate: SliverChildBuilderDelegate(
        //                   (context, index) => MainCard(
        //                         onTap: () {
        //                           Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (context) => PandaScreen(guest)));
        //                         },
        //                       ),
        //                   childCount: 3),
        //             ),
        //           ],
        //         ),
        //         const Align(
        //           alignment: Alignment.centerRight,
        //           heightFactor: 1,
        //           widthFactor: 5.9,
        //           child: FilterButton(),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,RouteString.filter);
      },
      child: Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.only(top: 10,left: 5),
        alignment: Alignment.center,
        child: const Image(
          image: ImageString.filter,
          width: 50,height: 50,
        ),
        decoration: const BoxDecoration(color: AppColor.whiteColor,shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5.0,
            offset: Offset(0, 3.0),
          )
        ]),
      ),
    );
  }
}
