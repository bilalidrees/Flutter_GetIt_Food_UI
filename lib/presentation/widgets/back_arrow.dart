
import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class ArrowBack extends StatelessWidget {
  final Color color;
  const ArrowBack({Key? key,this.color=AppColor.mainGreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon:  Icon(Icons.arrow_back,color: color));
  }
}
