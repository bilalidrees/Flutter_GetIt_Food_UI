import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';


class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
   // print(_controller.isCompleted);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SimpleAppBar(title: AppString.termsAndCondition),
        body: WebView(
          initialUrl: 'https://flutter.dev/',
          onProgress: (value){
            print(value);
          },
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller){
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}