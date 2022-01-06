import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_helper/panda_helper.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/panda_head.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/promo_text.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../colors.dart';
import '../example_data.dart';
import 'discount_card.dart';
import 'header_clip.dart';


class FAppBar extends SliverAppBar {
  final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

   FAppBar({
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  @override
  Color? get backgroundColor => scheme.surface;

  @override
  Widget? get leading {
    return FIconButton(iconData: Icons.arrow_back, onPressed: () {Navigator.pop(context);});
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(iconData: Icons.info_outline, onPressed: () {}),
      FIconButton(iconData: Icons.share_outlined, onPressed: () {}),

    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: this.isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery",
            style: textTheme.subtitle1?.copyWith(color: scheme.onSurface),
            strutStyle: Helper.buildStrutStyle(textTheme.subtitle1),
          ),
          const SizedBox(height: 4.0),
          Text(
            '20 min',
            style: textTheme.caption?.copyWith(color: AppColor.mainGreen),
            strutStyle: Helper.buildStrutStyle(textTheme.caption),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: scheme.surface,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: AppColor.mainGreen,
          labelColor: AppColor.mainGreen,
          unselectedLabelColor: scheme.onSurface,
          indicatorWeight: 3.0,
          tabs: data.categories.map((e) {
            return Tab(child: SimpleText(e.title,fontSize: 20,enumText: EnumText.regular),);
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
          BuildContext context,
          BoxConstraints constraints,
          ) {
        final top = constraints.constrainHeight();
        final collapsedHight = MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              Stack(
                children: [
                  PromoText(title: data.bannerText),
                  //const PandaHead(),
                  Column(
                    children: [
                      HeaderClip(data: data, context: context),
                      const SizedBox(height: 110),
                    ],
                  ),
                ],
              ),
              DiscountCard(
                title: data.optionalCard.title,
                subtitle: data.optionalCard.subtitle,
              ),
            ],
          ),
        );
      },
    );
  }
}


class FIconButton extends StatelessWidget {
  const FIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        splashColor: Colors.transparent,
        onPressed: onPressed,
        icon: Container(
          height: 48,
          width: 48,
          decoration: buildBoxDecoration(),
          child: Icon(
            iconData,
            color: AppColor.blackColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: scheme.surface,
    );
  }
}