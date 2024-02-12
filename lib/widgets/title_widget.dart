import 'dart:math';

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 155,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const Text(
              'Real Estate \nis Hard.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF363732), //글씨
                fontSize: 50,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: pi * 355 / 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(230, 223, 213, 0.7),
                    border:
                        Border.all(color: const Color(0xFFF4F5F0), width: 2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                    child: Text('Let us help you!'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
