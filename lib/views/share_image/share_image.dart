// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_karim/core/cache_helper.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/color_manager.dart';

// ignore: must_be_immutable
class ShareImage extends StatelessWidget {
  final surahNameEn;
  final ayah;
  final surahNameAr;
  int surahNumber;

  ShareImage({
    Key? key,
    required this.surahNameEn,
    required this.ayah,
    required this.surahNameAr,
    required this.surahNumber,
  }) : super(key: key);
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            BackButton(color: Theme.of(context).textTheme.bodyLarge?.color),
        elevation: 0.0,
        title: Text(
          "Share",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () async {
          final image = await screenshotController.capture();
          saveAndShare(image!);
        },
        child: Container(
          height: 40,
          width: double.infinity,
          color: ColorManager.orangeColor,
          child: Center(
            child: Text(
              "Share Image",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Screenshot(
            controller: screenshotController,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 40,
                        child: Image.asset(
                          'assets/design.png',
                          fit: BoxFit.fill,
                          color: ColorManager.orangeColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Text(
                        ayah,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: arabicFont,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "سُورَة $surahNameAr",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: arabicFont,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          surahNameEn,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.5,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.yellowColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                surahNumber.toString(),
                                style: TextStyle(
                                  color: ColorManager.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 100,
                      width: 40,
                      child: Transform.rotate(
                        angle: 3.1,
                        child: Image.asset(
                          'assets/design.png',
                          fit: BoxFit.fill,
                          color: ColorManager.orangeColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "القران الكريم",
                      style: TextStyle(
                          color: ColorManager.orangeColor, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Mobile App",
                      style: TextStyle(
                          color: ColorManager.orangeColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytes(bytes);

    const text = "Shared from Qur'an Karim App";
    await Share.shareFiles([image.path], text: text);
  }
}
