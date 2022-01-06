part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpNext extends SignUpEvent {
  const SignUpNext();
}

class SignUpOTP extends SignUpEvent {
  const SignUpOTP();
}

class SignUpInFo extends SignUpEvent {
  const SignUpInFo();
}
