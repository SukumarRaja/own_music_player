import 'package:flutter/material.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image});
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(AppFontSize.paddingSizeExtraLarge),
            child: Image.asset(image),
          )),
      Expanded(
        flex: 1,
        child: CommonText(
          text: title,
          fontSize: AppFontSize.fontSizeOverLarge,
          fontWeight: FontWeight.bold,
          // fontColor: Theme.of(context).primaryColor,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ),
      Expanded(
        flex: 1,
        child: CommonText(
          text: description,
          fontSize: AppFontSize.fontSizeLarge,
          fontColor: Theme.of(context).hintColor,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      )
    ]);
  }
}
