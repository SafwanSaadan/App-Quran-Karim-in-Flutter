import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/views/nav_bar/qiblah/qiblah.dart';

class QiblahDetails extends StatefulWidget {
  const QiblahDetails({Key? key}) : super(key: key);

  @override
  State<QiblahDetails> createState() => _QiblahDetailsState();
}

class _QiblahDetailsState extends State<QiblahDetails> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (hasPermission) {
          return const QiblahScreen();
        } else {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "القبلة",
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              centerTitle: false,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'الرجاء تشغيل الموقع',
                    style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.orangeColor,
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    openAppSettings();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'سماح',
                      style: TextStyle(
                          color: ColorManager.goldenColor, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      future: getPermission(),
    );
  }
}
