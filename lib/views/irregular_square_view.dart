import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/title_widget.dart';

class IrregularSquareView extends StatelessWidget {
  const IrregularSquareView({super.key});

// #F4F5F0 배경
// #363732 글씨
// #FF725E 상자 1
// #EABC66 상자 2
// #A1A280 상자 3

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
                      5,
                      (int index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipPath(
                          clipper: IrregularRectClipper(
                            fromTopLeftX: Random().nextDouble() * 100,
                            fromTopLeftY: Random().nextDouble() * 100,
                            fromBottomLeftX: Random().nextDouble() * 100,
                            fromBottomLeftY: Random().nextDouble() * 100,
                            fromBottomRightX: Random().nextDouble() * 100,
                            fromBottomRightY: Random().nextDouble() * 100,
                            fromTopRightX: Random().nextDouble() * 100,
                            fromTopRightY: Random().nextDouble() * 100,
                          ),
                          child: Container(
                            color: Colors.amber,
                            width: MediaQuery.of(context).size.width - 40,
                            height: (MediaQuery.of(context).size.width - 40) /
                                5 *
                                4,
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
  final double fromTopLeftX;
  final double fromTopLeftY;
  final double fromTopRightX;
  final double fromTopRightY;
  final double fromBottomLeftX;
  final double fromBottomLeftY;
  final double fromBottomRightX;
  final double fromBottomRightY;

  IrregularRectClipper({
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
    final Path path = Path()
      ..moveTo(
        0 + fromTopLeftX,
        0 + fromTopLeftY,
      )
      ..lineTo(
        0 + fromBottomLeftX,
        size.height - fromBottomLeftY,
      )
      ..lineTo(
        size.width - fromBottomRightX,
        size.height - fromBottomRightY,
      )
      ..lineTo(
        size.width - fromTopRightX,
        0 + fromTopRightY,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
