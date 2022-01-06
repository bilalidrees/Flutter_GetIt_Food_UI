import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/order_card.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import '../../../../enums.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(title: AppString.orderHistory),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: SimpleText(AppString.pastOrder,
                  enumText: EnumText.extraBold, fontSize: 32),
            ),
            const SizedBox(height: 50),
            Expanded(
                child: ListView.builder(
                    itemCount: OrderHistory.orderHistoryList.length,
                    itemBuilder: (context, index) {
                      final history = OrderHistory.orderHistoryList[index];
                      return OrderHistoryCard(
                          history.restaurantName,
                          history.itemName,
                          history.itemPrice,
                          history.quantity,
                          history.dateTime);
                    })),
          ],
        ),
      ),
    );
  }
}

class OrderHistory {
  final String restaurantName;
  final String itemName;
  final String itemPrice;
  final String quantity;
  final String dateTime;

  const OrderHistory(this.restaurantName, this.itemName, this.itemPrice,
      this.quantity, this.dateTime);

  static const orderHistoryList = [
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
    OrderHistory('Nandos', 'Peri Peri bites', '430.00', '1', '29 oct, 03:03'),
  ];
}
