import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/favourite_page/restaurant.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/favourite_page/shop.dart';

import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar:  FoodyTabAppBar(
            appbarSize: 150,
            title: AppString.favourites,
            tabBar: [
              SimpleText(AppString.restaurant, fontSize: 26),
              SimpleText(AppString.shop, fontSize: 26)
            ],
          ),
          body: TabBarView(
            children: [
              Restaurant(),
              Shop(),
            ],
          ),
        ),
      ),
    );
  }
}
