import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';

class IrregularSquareView extends StatelessWidget {
  IrregularSquareView({super.key});

// #F4F5F0 배경
// #363732 글씨
// #FF725E 상자 1
// #EABC66 상자 2
// #A1A280 상자 3

  final List<int> randIntList = <int>[1, 2, 3, 4, 5]..shuffle();
  final List<Color> randColorList = <Color>[
    const Color(
      0xFFFF725E,
    ),
    const Color(
      0xFFEABC66,
    ),
    const Color(
      0xFFA1A280,
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF4F5F0),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                      child: TitleWidget(),
                    ),
                    ...List<dynamic>.generate(
                      randIntList.length,
                      (int index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipPath(
                          clipper: IrregularRectClipper(
                            arcRadius: 14,
                            isLeftTopSideStick: randIntList[index] % 4 == 0,
                            isLeftBottomSideStick: randIntList[index] % 4 == 1,
                            isRightTopSideStick: randIntList[index] % 4 == 2,
                            isRightBottomSideStick: randIntList[index] % 4 == 3,
                          ),
                          child: Container(
                            color: randColorList[index % 3],
                            width: MediaQuery.of(context).size.width - 40,
                            height: (MediaQuery.of(context).size.width - 40) /
                                5 *
                                3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class IrregularRectClipper extends CustomClipper<Path> {
  final double arcRadius;

  final bool isLeftTopSideStick;
  final bool isRightTopSideStick;
  final bool isLeftBottomSideStick;
  final bool isRightBottomSideStick;

  double fromTopLeftX;
  double fromTopLeftY;
  double fromTopRightX;
  double fromTopRightY;
  double fromBottomLeftX;
  double fromBottomLeftY;
  double fromBottomRightX;
  double fromBottomRightY;

  IrregularRectClipper({
    required this.arcRadius,
    this.isLeftTopSideStick = false,
    this.isRightTopSideStick = false,
    this.isLeftBottomSideStick = false,
    this.isRightBottomSideStick = false,
    this.fromTopLeftX = 0,
    this.fromTopLeftY = 0,
    this.fromTopRightX = 0,
    this.fromTopRightY = 0,
    this.fromBottomLeftX = 0,
    this.fromBottomLeftY = 0,
    this.fromBottomRightX = 0,
    this.fromBottomRightY = 0,
  });

  @override
  Path getClip(Size size) {
    if (isLeftTopSideStick) {
      fromBottomLeftY = size.height;
      fromBottomRightX = size.width - (Random().nextDouble() * 150 + 50);
      fromBottomRightY = size.height - (Random().nextDouble() * 150 + 50);
      fromTopRightX = size.width - (Random().nextDouble() * 150 + 50);
    }

    if (isLeftBottomSideStick) {
      fromBottomLeftY = size.height;
      fromBottomRightX = size.width - (Random().nextDouble() * 100 + 50);
      fromBottomRightY = size.height;
      fromTopRightX = size.width - (Random().nextDouble() * 100 + 50);
      fromTopRightY = Random().nextDouble() * 100 + 50;
    }

    if (isRightTopSideStick) {
      fromTopLeftX = Random().nextDouble() * 100 + 50;
      fromBottomLeftX = Random().nextDouble() * 100 + 50;
      fromBottomLeftY = size.height - (Random().nextDouble() * 100 + 50);
      fromBottomRightX = size.width;
      fromBottomRightY = size.height;
      fromTopRightX = size.width;
    }

    if (isRightBottomSideStick) {
      fromTopLeftX = Random().nextDouble() * 100 + 50;
      fromTopLeftY = Random().nextDouble() * 100 + 50;
      fromBottomLeftX = Random().nextDouble() * 100 + 50;
      fromBottomLeftY = size.height;
      fromBottomRightX = size.width;
      fromBottomRightY = size.height;
      fromTopRightX = size.width;
    }

    final Path path = Path()
      ..moveTo(
        fromTopLeftX,
        fromTopLeftY,
      )
      ..lineTo(
        fromBottomLeftX,
        fromBottomLeftY,
      )
      ..lineTo(
        fromBottomRightX,
        fromBottomRightY,
      )
      ..lineTo(
        fromTopRightX,
        fromTopRightY,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
