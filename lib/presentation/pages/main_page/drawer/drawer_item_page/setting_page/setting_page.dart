import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const List<String> language = ['English', 'Urdu'];
  late final ValueNotifier<String> dropDown;
  late final ValueNotifier<bool> notification;
  late final ValueNotifier<bool> email;

  @override
  void initState() {
    dropDown = ValueNotifier(language[0]);
    notification = ValueNotifier(false);
    email = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    dropDown.dispose();
    notification.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const SimpleAppBar(title: AppString.settings),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 95,bottom: 15,left: 25,right: 25),
                  child: SimpleText(AppString.changeLanguage,enumText: EnumText.extraBold,),
                ),
                RoundedBorderContainer(
                  child: ValueListenableBuilder<String>(
                    valueListenable: dropDown,
                    builder: (context, value, child) =>
                        DropdownButtonHideUnderline(
                      child: DropdownButton<String>(

                        isExpanded: true,
                        value: dropDown.value,
                        icon: const Icon(Icons.arrow_drop_down_sharp,size: 44,),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          dropDown.value = newValue!;
                        },
                        items: language
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SimpleText(value,enumText: EnumText.extraBold,fontSize: 16),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                RoundedBorderContainer(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: notification,
                    builder: (context, value, child) => CheckboxListTile(
                      activeColor: AppColor.mainGreen,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const SimpleText(
                        AppString.receivePushNotifications,
                        textAlign: TextAlign.start,
                        enumText: EnumText.extraBold,
                        fontSize: 16,
                      ),
                      value: value,
                      onChanged: (value) {
                        notification.value = value!;
                      },
                    ),
                  ),
                ),
                RoundedBorderContainer(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: email,
                    builder: (context, value, child) => CheckboxListTile(
                      activeColor: AppColor.mainGreen,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const SimpleText(
                        AppString.receiveOffersByEmail,
                        textAlign: TextAlign.start,
                        enumText: EnumText.extraBold,
                        fontSize: 16,
                      ),
                      value: value,
                      onChanged: (value) {
                        email.value = value!;
                      },
                    ),
                  ),
                ),
                const Center(
                  child: SimpleText('Version: 21.2220.1',enumText: EnumText.extraBold,vertical: 15,),
                ),
              ],
            ),
          )),
    );
  }
}

class RoundedBorderContainer extends StatelessWidget {
  final Widget? child;

  const RoundedBorderContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(left: 15,right: 15),
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(25.0)),
      child: child!,
    );
  }
}
