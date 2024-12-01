import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/font_size.dart';
import 'text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final Widget? actionWidget;

  const CommonAppBar(
      {super.key,
      required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonText(text: title),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Theme.of(context).textTheme.bodyLarge!.color,
              onPressed: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.pop(context),
            )
          : const SizedBox(),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppFontSize.paddingSizeLarge),
          child: actionWidget ?? const SizedBox(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
