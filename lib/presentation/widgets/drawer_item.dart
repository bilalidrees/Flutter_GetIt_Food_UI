import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';


class DrawerItem extends StatelessWidget {
  final ImageProvider? image;
  final String text;
  final void Function()? onTap;
  const DrawerItem({Key? key,required this.text,this.image,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: image==null?10:14),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            image==null?const SizedBox.shrink():Image(image: image!,width: 32),
            const SizedBox(width: 22),
            SimpleText(text,color: AppColor.whiteTextColor,enumText: EnumText.extraBold,fontSize: 18)
          ],
        ),
      ),
    );
  }
}
