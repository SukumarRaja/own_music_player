import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/font_size.dart';
import 'text.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.only(top: AppFontSize.paddingSizeLarge),
        padding: const EdgeInsets.only(left: AppFontSize.paddingSizeDefault),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor.withOpacity(.3),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).hintColor.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0.3, 0.6),
              )
            ]),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/search.svg',
                height: 20, width: 20, color: Theme.of(context).hintColor),
            const SizedBox(width: AppFontSize.paddingSizeDefault),
            CommonText(
              text: text,
              fontSize: AppFontSize.fontSizeLarge,
              fontWeight: FontWeight.w400,
              fontColor: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
