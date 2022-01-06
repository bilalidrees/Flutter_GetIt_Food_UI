import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class Badge extends StatelessWidget {
  const Badge({Key? key}) : super(key: key);
  static const List<String> _badgeList = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SimpleText(
            AppString.badgeDesc,
            enumText: EnumText.extraBold,
            vertical: 15,
          )
        ])),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const Align(child: BadgeAvatar());
            },
            childCount: 6,
          ),
        )
      ],
    );
  }
}

class BadgeAvatar extends StatelessWidget {
  const BadgeAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColor.grey,
      shape: BoxShape.circle,
      shadowColor: AppColor.blackColor,
      elevation: 8.0,
      child: const CircleAvatar(
        backgroundColor: AppColor.whiteColor,
        radius: 85,
        backgroundImage: ImageString.vg,
      ),
    );
  }
}
