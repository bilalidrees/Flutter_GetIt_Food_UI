import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class PlainTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? textInputType;
  const PlainTextField({Key? key, this.hintText,this.textInputType}) : super(key: key);

  @override
  State<PlainTextField> createState() => _PlainTextFieldState();
}

class _PlainTextFieldState extends State<PlainTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: '+92');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 320,
        child: TextField(
         // controller: _controller,
          keyboardType: widget.textInputType,
          onChanged: (value){
            //print(value.substring(1));
          },
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainGreen,width: 1.75),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainGreen,width: 1.75),
              ),
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.only(left: 15),
              hintStyle: const TextStyle(color: Colors.black,fontSize: 24)),
        ));
  }
}
