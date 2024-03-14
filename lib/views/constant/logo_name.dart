import 'package:flutter/material.dart';

import '../../core/color_manager.dart';

class LogoName extends StatelessWidget {
  const LogoName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'القرآن الكريم ',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.goldenColor,
                  letterSpacing: 1.2,
                  fontFamily: 'Playfair',
                ),
              ),
              // Text(
              //   'الكريم',
              //   style: TextStyle(
              //     fontSize: 35,
              //     color: ColorManager.yellowColor,
              //     letterSpacing: 1.2,
              //     fontFamily: 'Playfair',
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/quran_logo.png',
            height: 100,
          ),
        ],
      ),
    );
  }
}
