import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/rounded_textfield.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AnimationController animationController;

  const MainAppBar({Key? key, required this.animationController})
      : super(key: key);
  final _sizedBox = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    // bool tog = true;
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        decoration: const BoxDecoration(
          //color: AppColor.mainGreen,
          image: DecorationImage(
              image: ImageString.appBarBackGround, fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      animationController.forward();
                    },
                    child: const Image(image: ImageString.menu, width: 26)),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteString.map,
                          arguments: true);
                    },
                    child:
                        const Image(image: ImageString.navigation, width: 26)),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: RoundedTextField(
                    verticalPadding: 0,
                    width: 250,
                    hintText: 'North Karachi',
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteString.favourite);
                    },
                    child: const Image(image: ImageString.heart, width: 26)),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteString.cart);
                    },
                    child: const Image(image: ImageString.cart, width: 26)),
              ],
            ),
            const Spacer(flex: 3),
            const SimpleText(AppString.deliciousFoodForYou,
                textAlign: TextAlign.start,
                enumText: EnumText.extraBold,
                fontSize: 28,
                color: AppColor.whiteTextColor),
            const Spacer(flex: 3),
            const ShadowTextField(
                width: 330, hintText: AppString.search, icon: Icons.search),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 330);
}

class ShadowTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final double width;

  const ShadowTextField({Key? key, this.icon, this.hintText, this.width = 330})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          // border: Border.all(color: AppColor.mainGreen,width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 3),
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(icon, color: AppColor.blackColor, size: 30),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
