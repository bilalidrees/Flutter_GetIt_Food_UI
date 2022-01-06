import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import 'challenge_reward_page.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  late final PageController _controller;
  static const List<String> _taskList = ['1', '2', '3', '4', '5'];
  late ValueNotifier<int> pageNotifier;

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.55, initialPage: 0);
    pageNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity * 0.6,
          height: MediaQuery.of(context).size.height * 0.46,
          child: ValueListenableBuilder<int>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const   Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 40),
                  child:  Points(),
                ),
                Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _taskList.length,
                      controller: _controller,
                      padEnds: false,
                      onPageChanged: (value) {
                        pageNotifier.value = value;
                      },
                      itemBuilder: (context, index) =>
                          const Align(child: TaskContainer())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _taskList
                      .asMap()
                      .map((i, element) => MapEntry(
                          i,
                          AnimatedContainer(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 10,
                            width: 10,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            decoration: BoxDecoration(
                              color: value == i
                                  ? AppColor.mainGreen
                                  : AppColor.whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(width: 0.5),
                            ),
                          )))
                      .values
                      .toList(),
                ),
              ],
            ),
            valueListenable: pageNotifier,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            decoration: const BoxDecoration(color: AppColor.lightGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SimpleText(
                  AppString.howsItWorks,
                  textAlign: TextAlign.start,
                  enumText: EnumText.regular,
                  vertical: 10,
                  horizontal: 15,
                  fontSize: 30,
                ),
                Row(
                  children: const [
                    Expanded(child: HowItWordStep('1', AppString.step1)),
                    Expanded(child: HowItWordStep('2', AppString.step2)),
                    Expanded(child: HowItWordStep('3', AppString.step3)),
                  ],
                ),
                const SimpleText(AppString.backToTop,
                    vertical: 30, enumText: EnumText.semiBold),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
