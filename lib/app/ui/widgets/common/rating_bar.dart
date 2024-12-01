import 'package:flutter/material.dart';
import '../../../themes/font_size.dart';
import 'text.dart';

class CommonRatingBar extends StatelessWidget {
  final dynamic rating;
  final double size;
  final int? ratingCount;

  const CommonRatingBar(
      {super.key,
      required this.rating,
      required this.ratingCount,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> starList = [];

    int realNumber = rating!.floor();
    int partNumber = ((rating! - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        starList.add(Icon(Icons.star,
            color: Theme.of(context).primaryColor, size: size));
      } else if (i == realNumber) {
        starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star,
                  color: Theme.of(context).primaryColor, size: size),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount != null
        ? starList.add(Padding(
            padding:
                const EdgeInsets.only(left: AppFontSize.paddingSizeExtraSmall),
            child: CommonText(
              text: '($ratingCount)',
              fontSize: size * 0.8, fontColor: Theme.of(context).disabledColor,
              // textDirection: TextDirection.ltr,
            ),
          ))
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
