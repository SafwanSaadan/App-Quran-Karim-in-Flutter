import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran_karim/core/color_manager.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.orangeColor,
                ),
              );
            }

            final qiblahDirection = snapshot.data;
            int qiblahDegree = qiblahDirection!.direction.toInt();

            bool qiblahLocation() {
              if (qiblahDegree >= 130 && qiblahDegree <= 150) {
                return true;
              } else {
                return false;
              }
            }

            Color shadowColor = const Color(0xffFFD700);

            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);
            return Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          qiblahLocation()
                              ? Icon(
                                  Icons.account_balance,
                                  size: 90,
                                  color: Colors.transparent,
                                  shadows: [
                                    Shadow(color: shadowColor, blurRadius: 100),
                                    Shadow(color: shadowColor, blurRadius: 100),
                                    Shadow(color: shadowColor, blurRadius: 100),
                                  ],
                                )
                              : const Icon(
                                  Icons.do_not_disturb_alt,
                                  color: Colors.transparent,
                                ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              'assets/qaaba.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.location_on_rounded,
                        size: 25,
                        color: qiblahLocation()
                            ? ColorManager.orangeColor
                            : Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 300,
                        child: AnimatedBuilder(
                          animation: animation!,
                          builder: (context, child) => Transform.rotate(
                              angle: animation!.value,
                              child: Image.asset('assets/compass.png')),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "$qiblahDegree°",
                        style: TextStyle(
                          color: ColorManager.orangeColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height:10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "ملاحظة : يرجى جعل الهاتف في وضعية أفقية وإبعاده عن أي قطع مغناطيسية "
                          "لأنها قد تتسبب في تشويش",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
