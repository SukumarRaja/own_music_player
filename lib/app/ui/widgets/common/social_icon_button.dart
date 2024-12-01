import 'package:flutter/material.dart';
import '../../../themes/font_size.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: AppFontSize.paddingSizeSmall, horizontal: 8),
      padding: const EdgeInsets.symmetric(
          vertical: AppFontSize.paddingSizeSmall,
          horizontal: AppFontSize.paddingSizeSmall),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.090),
          borderRadius: BorderRadius.circular(AppFontSize.radiusDefault)),
      child: Image.asset(
        'assets/images/$image',
        height: 30,
      ),
    );
  }
}
