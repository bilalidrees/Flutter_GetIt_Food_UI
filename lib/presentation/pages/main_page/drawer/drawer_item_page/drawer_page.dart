import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/widgets/drawer_item.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class DrawerScreen extends StatelessWidget {
  final bool guest;
  final AnimationController animationController;

  const DrawerScreen(this.guest, this.animationController, {Key? key})
      : super(key: key);
  final SizedBox _sizedBox = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGreen,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sizedBox,
          GestureDetector(
            child: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
            onTap: () {
             // Navigator.pop(context);
              animationController.reverse();
            },
          ),
          _sizedBox,
          Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.whiteColor,
            ),
            child: SimpleText(guest ? 'H' : 'G',
                color: AppColor.mainGreen,
                enumText: EnumText.extraBold,
                fontSize: 38),
          ),
          _sizedBox,
           SimpleText(guest?'Hafiz Haider':AppString.guest,
              enumText: EnumText.extraBold, color: AppColor.whiteTextColor,),
          _sizedBox,
          Container(
            height: 80,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: AppColor.mainGreen.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SimpleText(AppString.foodyYo_pay,
                    enumText: EnumText.extraBold,
                    color: AppColor.whiteTextColor,
                    fontSize: 24),
                SimpleText(AppString.creditAndPaymentMethod,
                    enumText: EnumText.bold,
                    color: AppColor.whiteTextColor,
                    fontSize: 17),
              ],
            ),
          ),
          guest
              ? DrawerItem(
                  text: AppString.favourites,
                  image: ImageString.heart,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteString.favourite))
              : const SizedBox.shrink(),
          guest
              ? DrawerItem(
                  text: AppString.order,
                  image: ImageString.order,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteString.orderHistory),
                )
              : const SizedBox.shrink(),
          guest
              ?  DrawerItem(
                  text: AppString.profile, image: ImageString.profile,onTap: (){
                    Navigator.pushNamed(context, RouteString.profile);
          },)
              : const SizedBox.shrink(),
          guest
              ?  DrawerItem(
                  text: AppString.address, image: ImageString.address,onTap: (){
                    Navigator.pushNamed(context, RouteString.address);
          },)
              : const SizedBox.shrink(),
          guest
              ?  DrawerItem(
                  text: AppString.challengeAndReward, image: ImageString.reward,onTap: ()=>Navigator.pushNamed(context, RouteString.challengeAndReward),)
              : const SizedBox.shrink(),
          guest
              ? DrawerItem(
                  text: AppString.vouchers,
                  image: ImageString.voucher,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteString.voucher),
                )
              : const SizedBox.shrink(),
          guest
              ? DrawerItem(
                  text: AppString.helpCenter,
                  image: ImageString.helpCenter,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteString.helpCenter),
                )
              : const SizedBox.shrink(),
          const Spacer(),
           DrawerItem(text: AppString.settings,onTap: () =>
               Navigator.pushNamed(context, RouteString.settings),),
           DrawerItem(text: AppString.termsAndCondition,onTap: () =>
              Navigator.pushNamed(context, RouteString.termAndCondition),),
          DrawerItem(
            text: !guest ? AppString.login : AppString.logOut,
            onTap: () => !guest
                ? Navigator.pushNamed(context, RouteString.loginOrSignUp)
                : Navigator.pop(context),
          ),
          Spacer(flex: guest ? 1 : 7),
        ],
      ),
    );
  }
}
