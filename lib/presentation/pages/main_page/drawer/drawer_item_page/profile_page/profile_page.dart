import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/profile_page/payment_body.dart';
import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import 'account_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        appBar: ProfileTabAppBar(
          title: AppString.profile,
          name: 'Lone Shark',
          email: 'Kamikaze@evil.com',
          phoneNumber: '+92929292929',
          tabBar: [
            SimpleText(AppString.account,
                fontSize: 18, enumText: EnumText.extraBold),
            SimpleText(AppString.paymentMethod,
                fontSize: 18, enumText: EnumText.extraBold),
            SimpleText(AppString.history,
                fontSize: 18, enumText: EnumText.extraBold),
          ],
        ),
            body: TabBarView(
              children: [
                AccountBody(),
                PaymentBody(),
                Center(child: Text('History'))
              ],
            ),
      )),
    );
  }
}
