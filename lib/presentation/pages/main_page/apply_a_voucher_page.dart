import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';

class ApplyAVoucher extends StatelessWidget {
  const ApplyAVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(
        title: AppString.applyAVoucher,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 330,
                margin: const EdgeInsets.symmetric(vertical: 45),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.mainGreen,width: 1.5),
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),
                  decoration: InputDecoration(
                    hintText: AppString.voucherCode,
                    border: InputBorder.none,
                    contentPadding:  EdgeInsets.symmetric(horizontal: 15),
                    hintStyle: TextStyle(fontWeight: FontWeight.w900,fontSize: 30)

                  ),
                ),
              ),
              BigButton(width: 330,text: AppString.apply, onPressed: (){}),
            ],
          ),
        ),
      ),
    ));
  }
}
