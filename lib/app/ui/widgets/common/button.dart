import 'package:flutter/material.dart';

import '../../../themes/font_size.dart';
import 'text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.texColor,
      this.isMargin = true,
      this.fontSize,
      this.isRadius});

  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? texColor;
  final bool isMargin;
  final double? isRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: isMargin ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(isRadius ?? 8.0),
          ),
          color: color ?? Theme.of(context).primaryColor,
        ),
        child: CommonText(
          text: text,
          fontColor: Theme.of(context).cardColor,
          fontSize: fontSize ?? AppFontSize.fontSizeLarge,
        ),
      ),
    );
  }
}
