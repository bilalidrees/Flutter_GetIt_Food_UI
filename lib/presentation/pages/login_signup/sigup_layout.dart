import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody_yo/dependency_injector.dart';
import 'package:foody_yo/presentation/blocs/signupbloc/sign_up_bloc.dart';
import 'package:foody_yo/presentation/pages/login_signup/phone_number.dart';
import 'package:foody_yo/presentation/pages/login_signup/pin_code.dart';
import 'package:foody_yo/presentation/widgets/plain_textfield.dart';

import '../enums.dart';
import 'info_field.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  final signUpBloc = sl<SignUpBloc>();

  @override
  void dispose() {
    signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(

        bloc: signUpBloc,
        builder: (context, state) {
          if (state is SignUpPhonePage) {
            return const PhoneNumber();
            return const PinPutTest();
          } else if (state is SignUpOTPPage) {
            return const PinPutTest();
          } else if (state is SignUpInFoPage) {
            return const InFoField();
          } else {
            return const Center(child: Text('Some Thing Went Wrong'));
          }
        });
  }
}
