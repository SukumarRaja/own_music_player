import 'package:flutter/material.dart';

import '../../../controllers/theme.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Icon(Icons.print, color: Theme.of(context).primaryColor),
                const SizedBox(width: 15),
                CommonText(
                  text: "Theme Settings",
                  fontColor: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w300,
                  fontSize: AppFontSize.fontSizeLarge,
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.only(left: 50.0),
              child: _isExpanded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildColumn(context, title: "Theme", subTitle: "Light",
                            onTap: () async {
                          await ThemeController.to.toggleTheme();
                          ThemeController.to.loadCurrentTheme();
                        }),
                        const SizedBox(height: 15),
                      ],
                    )
                  : const SizedBox
                      .shrink(), // Use an empty widget when not expanded
            ),
          ),
        ),
      ],
    );
  }

  buildColumn(BuildContext context,
      {required String title,
      required String subTitle,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontColor: Theme.of(context).hintColor,
            fontWeight: FontWeight.w300,
            fontSize: AppFontSize.fontSizeLarge,
          ),
          CommonText(
            text: subTitle,
            fontColor: Theme.of(context).hintColor,
            fontSize: AppFontSize.fontSizeSmall,
          ),
        ],
      ),
    );
  }
}
