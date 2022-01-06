import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/main_page/filter_page/sort_body.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import '../../enums.dart';

class PriceBody extends StatefulWidget {
  const PriceBody({Key? key}) : super(key: key);

  @override
  State<PriceBody> createState() => _PriceBodyState();
}

class _PriceBodyState extends State<PriceBody> {
  final _sizedBox = const SizedBox(height: 30);
  ValueNotifier<EnumFilterOption> valueNotifier =
      ValueNotifier(EnumFilterOption.optionOne);

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  Widget filterChip(bool isSelected, String dollar) => ChoiceChip(
        label: SimpleText(
          dollar,
          enumText: EnumText.extraBold,
          fontSize: 20,
          color: Colors.white,
        ),
        selected: true,
        backgroundColor: AppColor.transparent,
        selectedColor: AppColor.mainGreen,
        shape: const StadiumBorder(side: BorderSide()),
        onSelected: (value) {
          print('$dollar $value');
          setState(() {
            isSelected = !value;
          });
        },
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 12),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimpleText(AppString.sort,
              enumText: EnumText.semiBold, fontSize: 28),
          _sizedBox,
          ValueListenableBuilder<EnumFilterOption>(
            valueListenable: valueNotifier,
            builder: (context, selectedOption, child) {
              return Column(
                children: [
                  FoodyRadioButtonTrailing<EnumFilterOption>(
                    text: AppString.recommended,
                    value: EnumFilterOption.optionOne,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      valueNotifier.value = value!;
                    },
                  ),
                  FoodyRadioButtonTrailing<EnumFilterOption>(
                    text: AppString.topRated,
                    value: EnumFilterOption.optionTwo,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      valueNotifier.value = value!;
                    },
                  ),
                  FoodyRadioButtonTrailing<EnumFilterOption>(
                    text: AppString.fastestDelivery,
                    value: EnumFilterOption.optionThree,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      valueNotifier.value = value!;
                    },
                  ),
                  FoodyRadioButtonTrailing<EnumFilterOption>(
                    text: AppString.distance,
                    value: EnumFilterOption.optionFour,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      valueNotifier.value = value!;
                    },
                  ),
                ],
              );
            },
          ),
          const Divider(thickness: 2.5),
          const SimpleText(AppString.price,
              enumText: EnumText.semiBold, fontSize: 28),
          _sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: FilterClass.list
                .map((e) => filterChip(e.isSelected, e.string))
                .toList(),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const SimpleText(
                      'Clear All',
                      fontSize: 30,
                      enumText: EnumText.extraBold,
                    )),
                BigButton(
                    width: 250,
                    height: 60,
                    fontSize: 22,
                    text: 'Apply Filter',
                    onPressed: () {
                      //Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
