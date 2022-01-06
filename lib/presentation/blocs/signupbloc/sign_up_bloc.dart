import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpPhonePage()) {
    on<SignUpNext>((event, emit) =>emit(const SignUpOTPPage()));
    on<SignUpInFo>((event, emit) =>emit(const SignUpInFoPage()));

  }

  @override
  void onEvent(SignUpEvent event) {
    super.onEvent(event);
    print(event);
  }

}
