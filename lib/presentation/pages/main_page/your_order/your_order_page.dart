import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/main_page/your_order/your_order_loading_animation.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info_vouch_text.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class YourOrderPage extends StatefulWidget {
  const YourOrderPage({Key? key}) : super(key: key);

  @override
  State<YourOrderPage> createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  final SizedBox _sizedBox = const SizedBox(height: 10);

  final ValueNotifier<double> progress = ValueNotifier(0.25);

  // final ValueNotifier<double> progress = ValueNotifier(1.1);

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (Timer t) {
      progress.value = progress.value + 0.05;
      if (progress.value >= 1.0) {
        t.cancel();
        progress.dispose();
        Navigator.pushNamed(context, RouteString.rating);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: SimpleAppBar(
        title: AppString.yourOrder,
        subtitle: AppString.alHajAkhtar,
        action: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteString.helpCenter);
            },
            child: const SimpleText(AppString.help)),
      ),
      body: ValueListenableBuilder<double>(
        valueListenable: progress,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SimpleText('20 - 15 min',
                    enumText: EnumText.extraBold, fontSize: 34, vertical: 5),
                const SimpleText(AppString.estimatedDeliveryTime,
                    enumText: EnumText.light, vertical: 5),
                Align(
                  child: Container(
                    height: 140,
                    width: 150,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Image(
                        image: value >= 0.25 && value <= 0.50
                            ? ImageString.prepare
                            : value >= 0.50 && value <= 0.75
                                ? ImageString.bike
                                : ImageString.takeFoodBlack),
                  ),
                ),
                _sizedBox,
                value >= 0.50
                    ? const SimpleText(AppString.gotYourOrder)
                    : SizedBox(
                        height: 25,
                      ),
                _sizedBox,
                OrderProgressLoadingAnimation(progress.value),
                _sizedBox,
                !(value >= 0.50)
                    ? const SimpleText(AppString.preparingYourFood)
                    : const SizedBox.shrink(),
                const Spacer(),
                const Divider(thickness: 3),
                !(value >= 0.50) ? const Spacer() : const MessageTORider(),
                const CartPaymentInfo(
                  vertical: 4,
                  option: AppString.orderDetail,
                  enumText: EnumText.light,
                ),
                CartPaymentInfo(
                  vertical: 4,
                  option: AppString.yourOrderNumber,
                  enumText: EnumText.light,
                  widget: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColor.mainGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: const SimpleText(
                      '#f61c-3t71',
                      color: AppColor.whiteTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const CartPaymentInfo(
                  vertical: 4,
                  option: AppString.yourOrderFrom,
                  enumText: EnumText.light,
                  value: AppString.alHajAkhtar,
                  valueEnum: EnumText.extraBold,
                  valueSize: 18,
                ),
                const CartPaymentInfo(
                  option: AppString.deliveryAddress,
                  enumText: EnumText.light,
                  value: 'Current Location',
                  valueEnum: EnumText.extraBold,
                  valueSize: 18,
                  vertical: 4,
                ),
                value >= 0.50 ? const MainItem() : const SizedBox.shrink(),
                value >= 0.50
                    ? const CartPaymentInfo(
                        option: AppString.subtotal,
                        enumText: EnumText.extraBold,
                        value: 'Rs. 250.00',
                        valueEnum: EnumText.extraBold,
                        valueSize: 18,
                        vertical: 4,
                      )
                    : const SizedBox.shrink(),
                value >= 0.50
                    ? const CartPaymentInfo(
                        vertical: 4,
                        option: AppString.deliveryFee,
                        value: 'Rs. 55.00',
                        valueEnum: EnumText.light,
                        fontSize: 16,
                        enumText: EnumText.regular,
                        valueSize: 14,
                      )
                    : const SizedBox.shrink(),
                value >= 0.50
                    ? const CartPaymentInfoVouch(
                        vertical: 4,
                        option: AppString.total,
                        value: 'Rs, 300.00',
                      )
                    : const SizedBox.shrink(),
                Spacer(),
              ],
            ),
          );
        },
      ),
    ));
  }
}

class MessageTORider extends StatelessWidget {
  const MessageTORider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: AppColor.mainGreen, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: const [
          SimpleText(
            AppString.messageToRider,
            color: AppColor.whiteColor,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child:
                Image(image: ImageString.messageWhite, height: 60, width: 60),
          ),
        ],
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  const MainItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Divider(thickness: 1.5),
      CartPaymentInfo(
        option: '1x Zinger Burger',
        value: 'Rs. 250.00',
        enumText: EnumText.extraBold,
        fontSize: 14.5,
        valueEnum: EnumText.extraBold,
        valueSize: 14.5,
      ),
      Divider(thickness: 1.5),
    ]);
  }
}
