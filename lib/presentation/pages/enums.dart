enum EnumText { light, regular, semiBold, bold, extraBold }

enum EnumSignup { phoneNumber, pinCode, infoField }

enum EnumCancelOrderOption {
  optionOne,
  optionTwo,
  optionThree,
  optionFour,
  optionFive
}

enum EnumCraving { pickUp, delivery }
class TempAuth{
  final bool guest;
  final EnumCraving enumCraving;
  const TempAuth(this.guest,this.enumCraving);
}

enum EnumFilterOption {
  optionOne,
  optionTwo,
  optionThree,
  optionFour, }
