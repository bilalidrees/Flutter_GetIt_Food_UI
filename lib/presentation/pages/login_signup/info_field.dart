import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/blocs/signupbloc/sign_up_bloc.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/plain_textfield.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import '../../../dependency_injector.dart';
import '../enums.dart';

class InFoField extends StatelessWidget {
  const InFoField({Key? key}) : super(key: key);
  final _sizedBox = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        const PlainTextField(hintText: AppString.firstName),
        _sizedBox,
        const PlainTextField(hintText: AppString.lastName),
        _sizedBox,
        const PlainTextField(hintText: AppString.email),
        _sizedBox,
        const PlainTextField(hintText: AppString.password),
        _sizedBox,
         const PlainTextField(hintText: AppString.confirmPassword),
        const Spacer(),
        BigButton(text: AppString.signUp, onPressed: (){
          Navigator.pushNamed(context, RouteString.main,arguments: const TempAuth(true,EnumCraving.delivery));

        }),
        const Spacer(),
      ],
    );
  }
}
