import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/main_page/filter_page/sort_body.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/foody_tab_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../enums.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage>
    with SingleTickerProviderStateMixin {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final _sizedBox = const SizedBox(height: 30);
  ValueNotifier<EnumFilterOption> valueNotifier =
      ValueNotifier(EnumFilterOption.optionOne);
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    controller.addListener(() {
      if(controller.index==0){
        itemScrollController.scrollTo(index: 0, duration: const Duration(milliseconds: 500));
      }else{
        itemScrollController.scrollTo(index: 1, duration: const Duration(milliseconds: 500));
      }
      itemPositionsListener.itemPositions.addListener(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() { });
    valueNotifier.dispose();
    super.dispose();
  }

  bool choice = false;
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodyTabAppBar(
        appbarSize: 150,
        tabController: controller,
        title: AppString.filter,
        tabBar: const [
          SimpleText(AppString.sort, fontSize: 26),
          SimpleText(AppString.price, fontSize: 26)
        ],
      ),
      body: ScrollablePositionedList.builder(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
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
                const Divider(
                  thickness: 2.5,
                  height: 50,
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        if (e.isSelected) {
                          list.add(e.string);
                        } else {
                          list.remove(e.string);
                        }
                      }),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 12),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 250,
                ),
                Align(
                  alignment: Alignment.center,
                  child: list.isEmpty
                      ? BigButton(
                          width: 250,
                          height: 60,
                          text: AppString.apply,
                          onPressed: () {
                            //Navigator.pop(context);
                          })
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  list.removeRange(0, list.length);
                                  //update values
                                  for (var i in FilterClass.list) {
                                    setState(() {
                                      i.isSelected = false;
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
                                text: ' ( ${list.length.toString()} ) ' +
                                    AppString.apply,
                                onPressed: () {
                                  //Navigator.pop(context);
                                }),
                          ],
                        ),
                ),
              ],
            );
          }
        },
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }
}
