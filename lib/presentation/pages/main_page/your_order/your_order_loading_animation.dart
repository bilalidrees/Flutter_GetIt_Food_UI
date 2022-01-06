import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';

class OrderProgressLoadingAnimation extends StatefulWidget {
  final double progress;
  const OrderProgressLoadingAnimation(this.progress,{Key? key}) : super(key: key);

  @override
  _OrderProgressLoadingAnimationState createState() => _OrderProgressLoadingAnimationState();
}

class _OrderProgressLoadingAnimationState extends State<OrderProgressLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: false)
      ..addListener(() {

        if (widget.progress >= 1.0) {
          animationController.stop();
          animationController.dispose();
        }
      });
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      animationController,
    );

    super.initState();
  }


  final List<_DesContainer> list = const [_DesContainer(),_DesContainer(),_DesContainer(),_DesContainer()];
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            // tileMode: TileMode.mirror,
              stops: [animation.value * widget.progress, widget.progress],
              colors: const [AppColor.mainGreen, Colors.white]).createShader(rect),
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list.map((e) => e).toList(),
      ),

    );
  }
}

class _DesContainer extends StatelessWidget {
  const _DesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 10,
        width: 75,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: .1)));
  }
}