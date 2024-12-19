import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_music_player/app/themes/font_size.dart';
import 'package:own_music_player/app/ui/widgets/common/text.dart';

import '../../controllers/auth.dart';
import '../widgets/common/textform_field.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              CommonText(
                text: "Search",
                fontColor: Colors.white,
                fontSize: AppFontSize.fontSizeExtraLarge,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextFormField(
              hintText: 'search',
              controller: AuthController.to.name,
              prefix: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onChanged: (data) {
                // ProductController.to.search.addListener(() {
                //   if (debounceTimer != null) {
                //     debounceTimer!.cancel();
                //   }
                //   debounceTimer =
                //       Timer(const Duration(milliseconds: 500), () {
                //         ProductController.to.searchProduct();
                //       });
                // });

                return null;
              },
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
