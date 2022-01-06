import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _AccountInfoContainer(
          title: AppString.name,
          value: 'Lone Shark',
        ),
        _AccountInfoContainer(
          title: AppString.email,
          value: 'Kamikaze@evil.com',
        ),
        _AccountInfoContainer(
          title: AppString.password,
          value: '**********',
        ),
        _AccountInfoContainer(
          title: AppString.mobileNumber,
          value: '+92929292929',
          isVerified: true,
        ),
      ],
    );
  }
}

class _AccountInfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final bool isVerified;
  const _AccountInfoContainer(
      {Key? key, required this.title, required this.value,this.isVerified= false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 2.0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleText(
            title,
            fontSize: 18,
          ),
          Row(
            children: [
              SimpleText(
                value,
                enumText: EnumText.extraBold,
                vertical: 10,
                fontSize: 22,
              ),
              const Spacer(),
              const Image(
                image: ImageString.pen,
                height: 30,
                width: 30,
              ),
            ],
          ),
          const Spacer(),
          isVerified ?Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: AppColor.mainGreen,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:const  SimpleText(
              AppString.verified,
              color: AppColor.whiteTextColor,
              fontSize: 18,
              enumText: EnumText.regular,
            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}
