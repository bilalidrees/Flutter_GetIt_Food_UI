import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class RoundedTextField extends StatelessWidget {
  final String? hintText;
  final double width;
  final double verticalPadding;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final bool enableShadow;
  final Color backColor;
  final double borderRadius;
  final Widget? leading;
  final bool enableBorder;
  const RoundedTextField(
      {Key? key,
        this.borderRadius=20,
      this.hintText,
        this.leading,
        this.enableBorder= true,
      this.backColor = AppColor.whiteColor,
      this.width = 330,
      this.verticalPadding = 5,
      this.enableShadow = false,
      this.fontWeight,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: verticalPadding),
      decoration: BoxDecoration(
          boxShadow: enableShadow
              ? [
                  const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: 1)
                ]
              : [],
          color: backColor,
          border: enableBorder?Border.all(color: AppColor.mainGreen, width: 1.5):null,
          borderRadius:  BorderRadius.all(Radius.circular(borderRadius))),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: leading,
          hintText: hintText,
          hintStyle: TextStyle(color: fontColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
