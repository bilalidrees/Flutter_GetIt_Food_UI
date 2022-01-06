import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class PastBody extends StatelessWidget {
  const PastBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SimpleText(AppString.noVoucher,
          enumText: EnumText.extraBold, fontSize: 34),
    );
  }
}
