import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'text.dart';

class NoData extends StatelessWidget {
  const NoData({super.key, required this.text, this.imageSize = 300});

  final String text;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/no-data.svg',
            height: imageSize,
          ),
          CommonText(
            text: text,
            fontFamily: 'regular',
          )
        ],
      ),
    );
  }
}
