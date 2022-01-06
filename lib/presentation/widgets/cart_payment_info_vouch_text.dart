import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class CartPaymentInfoVouch extends StatelessWidget {
  final String option;
  final String value;
  final double? fontSize;
  final double horizontal;
  final double vertical;

  const CartPaymentInfoVouch(
      {Key? key,
      required this.value,
      required this.option,
      this.fontSize = 24,
      this.horizontal = 20.0,
      this.vertical = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: option,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                      text: AppString.inclVAT,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16,fontWeight: FontWeight.w900))
                ]),
          ),
          const Spacer(),
          SimpleText(value,enumText: EnumText.extraBold),
        ],
      ),
    );
  }
}
