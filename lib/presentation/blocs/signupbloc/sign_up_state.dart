part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {
  const SignUpState();
}

class SignUpPhonePage extends SignUpState {
  const SignUpPhonePage();
}

class SignUpOTPPage extends SignUpState {
  const SignUpOTPPage();
}

class SignUpInFoPage extends SignUpState {
  const SignUpInFoPage();
}