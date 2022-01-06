import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/image_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final ValueNotifier<bool> valueNotifier = ValueNotifier(false);
  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(
            title: AppString.paymentMethod, isSpacer: false, isBackArrow: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showModal(context);
                },
                child: Row(
                  children: const [
                    Image(image: ImageString.card, width: 30, height: 30),
                    SizedBox(width: 10),
                    SimpleText(
                      AppString.creditOrDebitCard,
                      fontSize: 22,
                      enumText: EnumText.extraBold,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.mainGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Image(image: ImageString.cash, width: 30, height: 30),
                    const SizedBox(width: 10),
                    const SimpleText(
                      AppString.cash,
                      fontSize: 22,
                      enumText: EnumText.extraBold,
                    ),
                    const Spacer(),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          color: AppColor.mainGreen,
                          borderRadius: BorderRadius.circular(20)),
                      child: const SimpleText(
                        AppString.primary,
                        color: AppColor.whiteTextColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 8,
                          color: AppColor.mainGreen.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showModal(BuildContext context) async {
    return showModalBottomSheet(
        backgroundColor: AppColor.transparent,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) =>
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: Container(
                height: 410,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20))),
                child: Column(
                  children: [
                    const PaymentTextField(hintText: AppString.cardNumber,vertical: 20,horizontal: 20,),
                    const SizedBox(height: 25.0),
                    Row(
                      children:const [
                         Expanded(child: PaymentTextField(
                          hintText: AppString.mmyy,
                          textAlign: TextAlign.center,)),
                         SizedBox(width: 25.0),
                         Expanded(child: PaymentTextField(
                          hintText: AppString.cvc,
                          image: ImageString.cvc,
                          textAlign: TextAlign.center,)),

                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: valueNotifier,
                          builder: (context,value,child){
                            return AnimatedContainer(
                              alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: value?AppColor.mainGreen:Colors.grey[400],shape: BoxShape.circle),
                                duration: const Duration(milliseconds: 800), child: IconButton(
                              onPressed: (){
                                valueNotifier.value =!value;
                              },
                              icon: Icon(Icons.check,color: value?AppColor.whiteColor:AppColor.blackColor,),
                            ));
                          },
                        ),
                        const SizedBox(width: 25.0),
                        const  SimpleText(AppString.saveMyCard),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                    const Spacer(flex: 3),
                    BigButton(text: AppString.done, onPressed: (){Navigator.pop(context);}),
                    const SimpleText(AppString.wellKeepYourPaymentDetailsSafe,enumText: EnumText.bold,),
                  ],
                ),
              ),
            ));
  }
}

class PaymentTextField extends StatelessWidget {
  final String? hintText;
  final TextAlign textAlign;
  final double vertical;
  final double horizontal;
  final ImageProvider? image;
  const PaymentTextField(
      {Key? key, this.hintText, this.textAlign = TextAlign.start,this.horizontal=0,this.vertical=12,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      style: Theme
          .of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontSize: 28,),
      decoration: InputDecoration(
        suffixIcon: image==null? null: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image(image: image!,height: 30,width: 30),
        ),
        contentPadding: EdgeInsets.only(top: vertical,bottom: vertical,left: horizontal,right: horizontal),
        hintText: hintText,
        hintStyle:  Theme
            .of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: AppColor.blackColor,fontSize: 28,fontWeight: FontWeight.w100),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.mainGreen,width: 3),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
