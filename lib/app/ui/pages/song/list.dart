import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/song.dart';
import '../../../themes/font_size.dart';
import '../../../utility/utility.dart';
import '../../widgets/common/image_card.dart';
import '../../widgets/common/text.dart';
import '../../widgets/song_list/song_card.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key, required this.permaUrl, required this.type});

  final String permaUrl, type;

  @override
  Widget build(BuildContext context) {
    // songDecode(
    //     mediaUrl:
    //         "ID2ieOjCrwfgWvL5sXl4B1ImC5QfbsDylQJoo/iq8zOBwQ28V3Q4Q9ZPyyMVFFJjS2Cf3/hRzwHn9CaCt3XGcxw7tS9a8Gtq");
    return GetBuilder(
        init: SongController(),
        initState: (_) {
          SongController.to.getSongList(
              token: "${getTokenFromPermaUrl(url: permaUrl)}", type: type);
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              actions: [
                Icon(
                  Icons.download,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.share,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 15),
              ],
            ),
            body: Obx(() => SongController.to.loading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  height: 160,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CommonCachedImageCard(
                                          image:
                                              "${SongController.to.songData['image'] ?? SongController.to.artistSongData['image']}"))),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text:
                                        "${SongController.to.songData['title'] ?? SongController.to.artistSongData['name']}",
                                    fontColor: Colors.white,
                                    fontSize: AppFontSize.fontSizeExtraLarge,
                                    fontWeight: FontWeight.w700,
                                    maxLines: 2,
                                  ),
                                  SongController
                                                  .to.songData['list_count'] ==
                                              "0" ||
                                          SongController
                                                  .to.songData['list_count'] ==
                                              null
                                      ? const SizedBox.shrink()
                                      : CommonText(
                                          text:
                                              "${SongController.to.songData['list_count']} songs",
                                          fontColor: Colors.grey,
                                          // fontSize: AppFontSize.fontSizeLarge,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'regular',
                                        ),
                                  CommonText(
                                    text:
                                        "${SongController.to.songData['year'] ?? "${numberFormatter(value: SongController.to.artistSongData['subtitle'].toString().split(' ')[2])} Listeners"}",
                                    fontColor: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'regular',
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          margin: const EdgeInsets.all(8.0),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30.0),
                                            ),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              CommonText(
                                                text: "Play",
                                                fontColor:
                                                    Theme.of(context).cardColor,
                                                fontSize:
                                                    AppFontSize.fontSizeLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Icon(
                                          Icons.shuffle,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        CommonText(
                          text: 'Songs',
                          fontSize: AppFontSize.fontSizeExtraLarge,
                          fontWeight: FontWeight.w700,
                        ),

                        ///common response data
                        Obx(
                          () => SongController.to.songData['list'] == null
                              ? const SizedBox.shrink()
                              : SongController.to.songData['list'].length ==
                                      0
                                  ? SongCard(
                                      data: SongController.to.songData)
                                  : Expanded(
                                      child: ListView.builder(
                                          itemCount: SongController
                                              .to.songData['list'].length,
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            var data = SongController
                                                .to.songData['list'][index];
                                            return SongCard(data: data);
                                          }),
                                    ),
                        ),

                        ///artist data songs
                        Obx(
                          () => SongController
                                      .to.artistSongData['topSongs'] ==
                                  null
                              ? const SizedBox.shrink()
                              : SongController.to.artistSongData['topSongs']
                                          .length ==
                                      0
                                  ? SongCard(
                                      data:
                                          SongController.to.artistSongData)
                                  : Expanded(
                                      child: ListView.builder(
                                          itemCount: SongController
                                              .to
                                              .artistSongData['topSongs']
                                              .length,
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            var data = SongController.to
                                                    .artistSongData['topSongs']
                                                [index];
                                            return SongCard(data: data);
                                          }),
                                    ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )),
          );
        });
  }
}
