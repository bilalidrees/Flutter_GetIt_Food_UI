import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info_vouch_text.dart';
import 'package:foody_yo/presentation/widgets/cart_quick_item_card.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(
          title: AppString.cart,
          subtitle: AppString.alHajAkhtar,
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.mainGreen, width: 2),
              ),
              child: const _EstimatedDelivery(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 75,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.mainGreen, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.remove, size: 15),
                        SimpleText('1'),
                        Icon(Icons.add, size: 15),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SimpleText('Zinger Burger', fontSize: 18),
                  const Spacer(),
                  const SimpleText('Rs. 250.00', fontSize: 16),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 180,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.grey[300],
              //child: const CartQuickItemCard(),
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      const Align(child: CartQuickItemCard())),
            ),
            const CartPaymentInfo(
              option: AppString.subtotal,
              value: 'Rs. 250.00',
            ),
            const CartPaymentInfo(
                option: AppString.deliveryFee,
                value: 'Rs. 50',
                enumText: EnumText.light),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteString.applyAVoucher);
              },
              child: const CartPaymentInfo(
                option: AppString.applyAVoucher,
                value: '',
              ),
            ),
            const Spacer(),
            const CartPaymentInfoVouch(
                value: 'Rs. 300.00', option: AppString.total, vertical: 15),
            BigButton(
                text: AppString.reviewPaymentAndAddress,
                onPressed: () {
                  Navigator.pushNamed(context, RouteString.checkOut);
                },
                fontSize: 19.5,
                height: 65),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _EstimatedDelivery extends StatelessWidget {
  const _EstimatedDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Align(
          alignment: Alignment.center,
          widthFactor: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: PhysicalModel(
                elevation: 8.0,
                color: Colors.black,
                child: Image(
                  image: ImageString.cartImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: SimpleText('${AppString.estimatedDelivery}\n\n 20 mins')),
      ],
    );
  }
}
