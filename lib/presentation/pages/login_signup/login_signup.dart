import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/login_signup/sigup_layout.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/foody_appbar.dart';
import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/plain_textfield.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import 'login_layout.dart';

class LoginORSignup extends StatelessWidget {
  const LoginORSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:  FoodyTabAppBar(
            tabBar: [
              SimpleText(AppString.login, fontSize: 26),
              SimpleText(AppString.signUp, fontSize: 26)
            ],
          ),
          body: TabBarView(
            children: [
               LoginLayout(),
               SignUpLayout(),
            ],
          ),
        ),
      ),
    );
  }
}
