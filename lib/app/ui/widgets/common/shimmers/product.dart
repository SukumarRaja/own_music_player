import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../themes/font_size.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Shimmer(
          duration: const Duration(milliseconds: 1800),
          enabled: true,
          color: Colors.grey,
          colorOpacity: .2,
          child: Padding(
            padding: const EdgeInsets.all(AppFontSize.paddingSizeSmall),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 80,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[300]),
              ),
              const SizedBox(height: AppFontSize.paddingSizeExtraSmall),
              Container(
                height: 10,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: AppFontSize.paddingSizeExtraSmall),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 10,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 25,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
