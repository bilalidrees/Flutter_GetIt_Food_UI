import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/blocs/signupbloc/sign_up_bloc.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/number_textfied.dart';
import 'package:foody_yo/presentation/widgets/plain_textfield.dart';

import '../../../dependency_injector.dart';


class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const  SizedBox(height: 150),
        const NumberTextField(textInputType: TextInputType.number),
        const Spacer(flex: 2),
        BigButton(text: AppString.next, onPressed: (){
          sl<SignUpBloc>().add(const SignUpNext());
        }),
        const Spacer(),
      ],
    );
  }
}