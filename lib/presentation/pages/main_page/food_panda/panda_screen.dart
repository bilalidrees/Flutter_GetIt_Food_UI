import 'package:flutter/material.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/category_section.dart';
import 'package:foody_yo/presentation/pages/main_page/food_panda/panda_widget/fappbar.dart';
import 'package:foody_yo/presentation/widgets/add_to_card_bar.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'colors.dart';
import 'example_data.dart';

class PandaScreen extends StatefulWidget {
  final bool guest;
  const PandaScreen(this.guest, {Key? key}) : super(key: key);

  @override
  _PandaScreenState createState() => _PandaScreenState();
}

class _PandaScreenState extends State<PandaScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;

  final double expandedHeight = 500.0;
  final PageData data = ExampleData.data;
  final double collapsedHeight = kToolbarHeight;

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    tabController = TabController(length: data.categories.length, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  int cartItem = 0;

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(() => isCollapsed = value);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex)
        tabController.animateTo(middleIndex);
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          RectGetter(
            key: listViewKey,
            child: NotificationListener<ScrollNotification>(
              child: buildSliverScrollView(),
              onNotification: onScrollNotification,
            ),
          ),
          cartItem >= 1
              ? Align(
                  heightFactor: 15,
                  alignment: Alignment.bottomCenter,
                  child: ViewYourCartButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          !widget.guest
                              ? RouteString.loginOrSignUp
                              : RouteString.cart);
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        buildAppBar(),
        buildBody(),
      ],
    );
  }

  SliverAppBar buildAppBar() {
    return FAppBar(
      data: data,
      context: context,
      scrollController: scrollController,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }

  SliverList buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate(List.generate(
        data.categories.length,
        (index) {
          itemKeys[index] = RectGetter.createGlobalKey();
          return buildCategoryItem(index);
        },
      )),
    );
  }

  Widget buildCategoryItem(int index) {
    Category category = data.categories[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: CategorySection(
          category: category,
          callback: (value) {
            setState(() {
              cartItem = value;
            });
          },
        ),
      ),
    );
  }
}
