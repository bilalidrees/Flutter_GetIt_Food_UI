import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info.dart';
import 'package:foody_yo/presentation/widgets/cart_payment_info_vouch_text.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final _boxShadow = [
      const BoxShadow(
        color: Colors.black26,
        blurRadius: 5.0,
        offset: Offset(0, 2.0),
      )
    ];
    final _boxDecoration = BoxDecoration(
      color: AppColor.whiteColor,
      border: Border.all(color: AppColor.mainGreen),
      boxShadow: _boxShadow,
    );
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(
          title: AppString.checkOut,
          subtitle: AppString.alHajAkhtar,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 360,
                  width: double.infinity,
                  decoration: _boxDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CheckOutRow(
                          text: AppString.deliveryAddress,
                          imageTwo: ImageString.pen),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                      ),
                      const SimpleText('Sector 11C/1 North Karachi',
                          fontSize: 12,
                          color: AppColor.mainGreen,
                          enumText: EnumText.bold,
                          vertical: 5,
                          horizontal: 20),
                      const SimpleText('Karachi',
                          fontSize: 12,
                          color: AppColor.mainGreen,
                          enumText: EnumText.light,
                          horizontal: 20),
                      const Divider(thickness: 1, color: AppColor.blackColor),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteString.paymentMethod);
                          },
                          child: const CheckOutRow(
                              image: ImageString.wallet,
                              text: AppString.paymentMethod,
                              imageTwo: ImageString.pen)),
                      const Spacer(),
                      const CheckOutRow(
                          image: ImageString.cash,
                          text: AppString.cashOnDelivery,
                          value: 'Rs. 300.00'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 200,
                  width: double.infinity,
                  decoration: _boxDecoration,
                  child: Column(
                    children: const [
                      CheckOutRow(
                          image: ImageString.orderCheck,
                          text: AppString.orderSummery),
                      CartPaymentInfo(
                        option: '1 x Zinger Burger ',
                        value: 'Rs 250.00',
                        enumText: EnumText.light,
                        fontSize: 14,
                        valueSize: 14,
                        valueEnum: EnumText.light,
                      ),
                      Divider(thickness: 1, color: AppColor.blackColor),
                      CartPaymentInfo(
                        option: AppString.subtotal,
                        value: 'Rs 250.00',
                        enumText: EnumText.light,
                        fontSize: 14,
                        valueSize: 14,
                        valueEnum: EnumText.light,
                      ),
                      SizedBox(height: 10,),
                      CartPaymentInfo(
                        option: AppString.deliveryFee,
                        value: 'Rs 250.00',
                        enumText: EnumText.light,
                        fontSize: 14,
                        valueSize: 14,
                        valueEnum: EnumText.light,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: SimpleText(
                      AppString.orderTermCon,
                      fontSize: 12,
                    )),
                const SizedBox(height: 10),
                const CartPaymentInfoVouch(
                    value: 'Rs. 300.0',
                    horizontal: 0.0,
                    vertical: 0.0,
                    option: AppString.total),
                const SizedBox(height: 20),
                BigButton(
                  height: 65,
                    text: AppString.placeOrder,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteString.yourOrder);
                    }),
              ],
            )),
      ),
    );
  }
}

class CheckOutRow extends StatelessWidget {
  final ImageProvider? image;
  final String text;
  final String? value;
  final ImageProvider? imageTwo;

  const CheckOutRow(
      {Key? key, this.image, this.imageTwo, required this.text, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          image != null
              ? Image(image: image!, height: 30, width: 30)
              : const SizedBox.shrink(),
          image != null
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox.shrink(),
          SimpleText(text, enumText: EnumText.extraBold,fontSize: 18.5,),
          const Spacer(),
          imageTwo != null
              ? Image(image: imageTwo!, height: 30, width: 30)
              : const SizedBox.shrink(),
          value != null
              ? SimpleText(value!, fontSize: 16.0)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
