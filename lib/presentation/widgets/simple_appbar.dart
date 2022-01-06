import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/back_arrow.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool isBackArrow;
  final bool isSpacer;
  final Widget? action;
  const SimpleAppBar({Key? key, required this.title, this.subtitle,this.isBackArrow=true,this.isSpacer=true,this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 10,
      flexibleSpace: Container(
       alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(color: Colors.black45, width: .1),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: subtitle == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isBackArrow?const ArrowBack():const CancelButton(),
                  isSpacer?const Spacer():const SizedBox.shrink(),
                  SimpleText(title,
                      color: AppColor.mainGreen,
                      fontSize: 24,
                      enumText: EnumText.extraBold),
                  const Spacer(flex: 2),
                ],
              )
            : Row(
              children: [
                const CancelButton(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleText(title,
                          color: AppColor.mainGreen,
                          fontSize: 24,
                          enumText: EnumText.extraBold),
                      SimpleText(subtitle!,
                          fontSize: 19.5,
                          enumText: EnumText.light),
                    ],
                  ),
                const Spacer(),
                action==null?const SizedBox.shrink():action!
              ],
            ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 100);
}


class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(Icons.close));
  }
}
