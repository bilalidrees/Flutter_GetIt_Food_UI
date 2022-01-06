import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/received_card.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(title: AppString.howCanWeHelp),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              const ReceivedCard(),
              const SizedBox(height: 100),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, RouteString.cancelOrder),
                child: Row(
                  children: const [
                    SimpleText(AppString.canICancelMyOrder,enumText: EnumText.extraBold,fontSize: 20),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
