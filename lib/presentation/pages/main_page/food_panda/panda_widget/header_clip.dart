import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

import '../../../enums.dart';
import '../colors.dart';
import '../example_data.dart';
import 'custom_shape.dart';

class HeaderClip extends StatelessWidget {
const HeaderClip({
Key? key,
required this.data,
required this.context,
}) : super(key: key);

final PageData data;
final BuildContext context;

@override
Widget build(BuildContext _) {
  final textTheme = Theme.of(context).textTheme;
  return ClipPath(
    clipper: CustomShape(),
    child: Stack(
      children: [
        Container(
          height: 275,
          color: AppColor.mainGreen,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/transparent.png',
            image: data.backgroundUrl,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: 275,
          color: scheme.secondary.withOpacity(0.7),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
          ),
          child: Column(
            children: [
              Text(
                data.title,
                style: textTheme.headline5?.copyWith(
                  color: scheme.surface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: scheme.surface),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const SimpleText(
                    'Delivery' + ' 20 min',fontSize: 14,color: AppColor.whiteTextColor,
                    enumText: EnumText.light,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    size: 16,
                    color: scheme.surface,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    data.rate.toString(),
                    style: textTheme.caption?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: scheme.surface,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    "(" + data.rateQuantity.toString() + ")",
                    style: textTheme.caption?.copyWith(
                      color: scheme.surface,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
}