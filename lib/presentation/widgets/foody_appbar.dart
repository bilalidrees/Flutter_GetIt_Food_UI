import 'package:flutter/material.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';



class FoodyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 10,
      flexibleSpace: Container(
        alignment: Alignment.center,
        child: Container(
          height: 180,
          width: 180,
          margin: EdgeInsets.only(bottom: 35),
          foregroundDecoration:const BoxDecoration(
            image:  DecorationImage(image: ImageString.splashCenter),
          ),
        ),
        decoration: BoxDecoration(
          image: const DecorationImage(image: ImageString.tabAppBarBackground,fit: BoxFit.cover),
          color: AppColor.whiteColor,
          border: Border.all(color: Colors.black45, width: .1),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 220);
}

