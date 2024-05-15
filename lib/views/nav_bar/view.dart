import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/views/qiblah_details/view.dart';

import 'home/home.dart';
import 'more/more_page.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 2;
  List screens = const [
    MorePage(),
    QiblahDetails(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          unselectedItemColor: ColorManager.blueColor,
          selectedItemColor: ColorManager.goldenColor,
          items: const [
            BottomNavigationBarItem(
              tooltip: 'الإعدادات',
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              tooltip: 'القبلة',
              icon: Icon(
                Icons.mosque,
                size: 25,
              ),
              label: '_____',
            ),
            BottomNavigationBarItem(
              tooltip: 'الرئيسية',
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: '_____',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 10.0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
