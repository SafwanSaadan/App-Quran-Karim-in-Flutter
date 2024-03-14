import 'package:flutter/material.dart';
import 'package:quran_karim/core/cache_helper.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/core/helper_methods.dart';
import 'package:quran_karim/views/constant/basmala.dart';
import 'package:quran_karim/views/constant/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../share_image/share_image.dart';

// ignore: must_be_immutable
class SurahPage extends StatefulWidget {
  final surah;
  final arabic;
  final surahName;
  int ayah;

  SurahPage({
    Key? key,
    this.surah,
    this.arabic,
    this.surahName,
    required this.ayah,
  }) : super(key: key);

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpToAyah();
    });
    super.initState();
  }

  jumpToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  Row ayahBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea singleSuraBuilder(lengthOfSurah) {
    int previousVerses = 0;
    if (widget.surah + 1 != 1) {
      for (int i = widget.surah - 1; i >= 0; i--) {
        previousVerses = previousVerses + numberOfVerses[i];
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:
              BackButton(color: Theme.of(context).textTheme.bodyLarge?.color),
          elevation: 0.0,
          title: Text(
            "سُورَة ${widget.arabic[previousVerses]['sura_name_ar']}",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 30,
              color: ColorManager.yellowColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/quran_logo.png',
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ScrollablePositionedList.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            (index != 0) ||
                                    (widget.surah == 0) ||
                                    (widget.surah == 8)
                                ? const Text('')
                                : const ReturnBasmalah(),
                            Container(
                              decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.color
                                    : Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: PopupMenuButton(
                                  tooltip: "",
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ayahBuilder(index, previousVerses),
                                  ),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          onTap: () {
                                            saveBookMark(
                                                widget.surah + 1, index);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.bookmark_add,
                                                color: ColorManager.yellowColor,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text('Bookmark'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () async {
                                            navigateTo(
                                                page: await ShareImage(
                                              ayah: widget.arabic[index +
                                                  previousVerses]['aya_text'],
                                              surahNameEn: widget.arabic[
                                                      index + previousVerses]
                                                  ['sura_name_en'],
                                              surahNameAr: widget.arabic[
                                                      index + previousVerses]
                                                  ['sura_name_ar'],
                                              surahNumber: widget.arabic[index +
                                                  previousVerses]['sura_no'],
                                            ));
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.share,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Share'),
                                            ],
                                          ),
                                        ),
                                      ]),
                            ),
                          ],
                        );
                      },
                      itemScrollController: itemScrollController,
                      itemPositionsListener: itemPositionsListener,
                      itemCount: lengthOfSurah,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = numberOfVerses[widget.surah];
    return Scaffold(body: singleSuraBuilder(lengthOfSura));
  }
}
