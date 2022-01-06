import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final EnumText? enumText;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final double horizontal;
  final double vertical;
  const SimpleText(this.text,
      {Key? key,
      this.enumText,
        this.horizontal=0.0,
        this.vertical =0.0,
      this.fontSize = 20,
      this.textAlign = TextAlign.center,
      this.color = AppColor.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:horizontal ,vertical: vertical),
      child: Text(
        text,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: enumText == EnumText.light
                ? FontWeight.w300
                : enumText == EnumText.regular
                    ? FontWeight.w400
                    : enumText == EnumText.semiBold
                        ? FontWeight.w600
                        : enumText == EnumText.bold
                            ? FontWeight.w700
                            : enumText == EnumText.extraBold
                                ? FontWeight.w800
                                : FontWeight.w300),
      ),
    );
  }
}

// {
// FontWeight.w100: 'Thin',
// FontWeight.w200: 'ExtraLight',
// FontWeight.w300: 'Light',
// FontWeight.w400: 'Regular',
// FontWeight.w500: 'Medium',
// FontWeight.w600: 'SemiBold',
// FontWeight.w700: 'Bold',
// FontWeight.w800: 'ExtraBold',
// FontWeight.w900: 'Black',
// }
