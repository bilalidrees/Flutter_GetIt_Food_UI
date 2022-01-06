import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class OrderHistoryCard extends StatelessWidget {
  final String restaurantName;
  final String itemName;
  final String itemPrice;
  final String quantity;
  final String dateTime;

  const OrderHistoryCard(this.restaurantName, this.itemName, this.itemPrice,
      this.quantity, this.dateTime,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 220,
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: Offset(0, 2.0),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SimpleText(restaurantName,
                  enumText: EnumText.extraBold, fontSize: 24),
              const Spacer(),
              SimpleText('Rs. $itemPrice',
                  enumText: EnumText.extraBold, fontSize: 24),
            ],
          ),
          const Spacer(),
          SimpleText('$quantity X $itemName'),
          const SizedBox(height: 10),
          SimpleText(dateTime),
        ],
      ),
    );
  }
}