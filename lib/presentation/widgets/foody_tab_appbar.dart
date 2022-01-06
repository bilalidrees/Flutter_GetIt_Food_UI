import 'package:flutter/material.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/back_arrow.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class FoodyTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabBar;
  final String? title;
  final double fontSize;
  final Widget? leading;
  final double appbarSize;
  final bool isScrollable;
  final TabController? tabController;
  const FoodyTabAppBar(
      {Key? key,
      required this.tabBar,
        this.tabController,
      this.title,
      this.fontSize = 34,
      this.leading,
      this.appbarSize = 220,
      this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      automaticallyImplyLeading: false,
      bottom: TabBar(
        controller: tabController,
        isScrollable: isScrollable,
        tabs: tabBar,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        indicatorColor: AppColor.mainGreen,
        padding: const EdgeInsets.only(bottom: 1.5),
      ),
      flexibleSpace: Container(
        child: title != null
            ? Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                  // const Spacer(),
                  title == null
                      ? const SizedBox.shrink()
                      : SimpleText(
                          title!,
                          fontSize: fontSize,
                          enumText: EnumText.extraBold,
                          color: AppColor.mainGreen,
                          horizontal: 45,
                    vertical: appbarSize/4,
                        ),
                  //  const Spacer(flex: 3),
                  leading != null ? leading! : const SizedBox.shrink(),
                ],
              )
            : Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 140,
                  height: 140,
                  foregroundDecoration: const BoxDecoration(
                    image: DecorationImage(image: ImageString.splashCenter),
                  ),
                ),
              ),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          image: title == null
              ? const DecorationImage(
                  image: ImageString.tabAppBarBackgroundLong, fit: BoxFit.cover)
              : null,
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
  //220
  Size get preferredSize => Size(double.infinity, appbarSize);
}

class ProfileTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabBar;
  final String title;
  final String? name;
  final String? email;
  final String? phoneNumber;

  const ProfileTabAppBar(
      {Key? key,
      required this.tabBar,
      required this.title,
      this.email,
      this.name,
      this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      automaticallyImplyLeading: false,
      title: SimpleText(
        title,
        horizontal: 50,
        fontSize: 28,
        color: AppColor.mainGreen,
        enumText: EnumText.extraBold,
      ),
      leading: const ArrowBack(),
      bottom: TabBar(
        isScrollable: true,
        tabs: tabBar,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        indicatorColor: AppColor.mainGreen,
        padding: const EdgeInsets.only(bottom: 1.5),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(color: Colors.black45, width: .1),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.orange[50]!,
                  backgroundImage: ImageString.avatar,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    name != null
                        ? SimpleText(
                            name!,
                            vertical: 3,
                            horizontal: 10,
                            enumText: EnumText.extraBold,
                            fontSize: 26,
                          )
                        : const SizedBox.shrink(),
                    email != null
                        ? SimpleText(email!, vertical: 3, horizontal: 10)
                        : const SizedBox.shrink(),
                    phoneNumber != null
                        ? SimpleText(
                            phoneNumber!,
                            vertical: 3,
                            horizontal: 10,
                            enumText: EnumText.extraBold,
                            fontSize: 16,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 250);
}
