import 'package:flutter/material.dart';
import 'package:quran_karim/core/color_manager.dart';
import 'package:quran_karim/views/nav_bar/view.dart';

import '../../core/helper_methods.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  _goNext() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    navigateTo(page: const NavBarView(), withHistory: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: AssetImage("assets/quran_logo.png"),
                fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'القرآن الكريم',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.goldenColor,
                    letterSpacing: 1.2,
                    fontFamily: 'Playfair',
                  ),
                ),
                // Text(
                //   'الكريم',
                //   style: TextStyle(
                //     fontSize: 30,
                //     color: ColorManager.yellowColor,
                //     letterSpacing: 1.2,
                //     fontFamily: 'Playfair',
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
