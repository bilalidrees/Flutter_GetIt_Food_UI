import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class SortBody extends StatefulWidget {
  const SortBody({Key? key}) : super(key: key);

  @override
  State<SortBody> createState() => _SortBodyState();
}

class _SortBodyState extends State<SortBody> {
  final _sizedBox = const SizedBox(height: 30);
  ValueNotifier<EnumFilterOption> valueNotifier =
      ValueNotifier(EnumFilterOption.optionOne);

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
  bool choice = false;
  List<String> list = [];
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
            children: FilterClass.list.map((e) {
              return ChoiceChip(
                label: SimpleText(
                  e.string,
                  enumText: EnumText.extraBold,
                  fontSize: 20,
                  color: e.isSelected
                      ? AppColor.whiteTextColor
                      : AppColor.blackTextColor,
                ),
                selected: e.isSelected,
                backgroundColor: AppColor.transparent,
                selectedColor: AppColor.mainGreen,
                shape: const StadiumBorder(side: BorderSide()),
                onSelected: (value) => setState(() {
                  e.isSelected = value;
                  if(e.isSelected) {
                    list.add(e.string);
                  }else{
                    list.remove(e.string);
                  }

                }),
                padding:
                    const EdgeInsets.symmetric(horizontal: 38, vertical: 12),
              );
            }).toList(),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: list.isEmpty?BigButton(
                width: 250,
                height: 60,
                text: AppString.apply,
                onPressed: () {
                  //Navigator.pop(context);
                }):Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(
                onPressed: () {
                    list.removeRange(0, list.length);
                    //update values
                    for(var i in FilterClass.list){
                      setState(() {
                        i.isSelected=false;
                      });
                    }
                },
                child: const SimpleText(
                  'Clear All',
                  fontSize: 30,
                  enumText: EnumText.extraBold,
                )),
            BigButton(
                width: 250,
                height: 60,
                text: ' ( ${list.length.toString()} ) '+AppString.apply,
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

class FoodyRadioButtonTrailing<T> extends StatelessWidget {
  final String text;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const FoodyRadioButtonTrailing(
      {Key? key,
      required this.value,
      required this.text,
      this.groupValue,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: SimpleText(text,
          textAlign: TextAlign.start, enumText: EnumText.regular),
      trailing: Radio<T>(
        activeColor: AppColor.mainGreen,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

class FilterClass {
  final String string;
  bool isSelected;

  FilterClass({required this.string, required this.isSelected});

  static List<FilterClass> list = [
    FilterClass(isSelected: false, string: '\$'),
    FilterClass(isSelected: false, string: '\$\$'),
    FilterClass(isSelected: false, string: '\$\$\$')
  ];

}
