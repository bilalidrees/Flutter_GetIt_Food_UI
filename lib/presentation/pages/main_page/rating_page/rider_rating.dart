import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class RiderBody extends StatelessWidget {
  RiderBody({Key? key}) : super(key: key);
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(48.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  // controller: _opTextController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Rider Review",
                    labelStyle: TextStyle(
                      fontSize: 20,
                        color: myFocusNode.hasFocus
                            ? AppColor.grey
                            : AppColor.blackColor),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.blackColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.blackColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColor.blackColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: RatingBar(
                      initialRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                          full: const Icon(Icons.star,
                              color: AppColor.blackColor),
                          half: const Icon(
                            Icons.star_half,
                            color: AppColor.blackColor,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: AppColor.blackColor,
                          )),
                      onRatingUpdate: (value) {}),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteString.main,
                            arguments: const TempAuth(false, EnumCraving.delivery));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.mainGreen,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const SimpleText(
                          AppString.dismiss,
                          color: AppColor.whiteTextColor,
                          fontSize: 18,
                          enumText: EnumText.regular,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteString.main,
                            arguments: const TempAuth(false, EnumCraving.delivery));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColor.mainGreen,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const SimpleText(
                          AppString.submit,
                          color: AppColor.whiteTextColor,
                          fontSize: 18,
                          enumText: EnumText.regular,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
