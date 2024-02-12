import 'package:flutter/material.dart';

import 'clippers/Irregular_rect_clipper.dart';

class IrregularSquareWidget extends StatelessWidget {
  const IrregularSquareWidget({
    required this.randomInt,
    required this.randomColor,
    super.key,
  });

  final int randomInt;
  final Color randomColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ClipPath(
          clipper: IrregularRectClipper(
            arcRoundness: 14,
            anomaly: 1.2,
            isLeftTopSideStick: randomInt % 4 == 0,
            isLeftBottomSideStick: randomInt % 4 == 1,
            isRightTopSideStick: randomInt % 4 == 2,
            isRightBottomSideStick: randomInt % 4 == 3,
          ),
          child: Container(
            color: randomColor,
            width: MediaQuery.of(context).size.width - 40,
            height: (MediaQuery.of(context).size.width - 40) * 0.55,
          ),
        ),
      );
}
