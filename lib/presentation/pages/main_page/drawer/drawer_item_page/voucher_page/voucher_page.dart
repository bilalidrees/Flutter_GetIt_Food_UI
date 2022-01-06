import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/voucher_page/current_body.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/voucher_page/past_body.dart';

import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar:  FoodyTabAppBar(appbarSize: 150,
            title: AppString.vouchers,
            tabBar: [
              SimpleText(AppString.current, fontSize: 26),
              SimpleText(AppString.past, fontSize: 26)
            ],
          ),
          body: TabBarView(
            children: [
              CurrentBody(),
              PastBody(),
            ],
          ),
        ),
      ),
    );
  }
}
