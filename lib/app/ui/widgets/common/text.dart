import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontColor = Colors.black,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis,
      this.textDecoration = TextDecoration.none,
      this.maxLines,
      this.fontFamily});

  final String text;
  final String? fontFamily;
  final double fontSize;
  final int? maxLines;
  final double? letterSpacing;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          fontFamily: fontFamily ?? "medium",
          letterSpacing: letterSpacing),
    );
  }
}
