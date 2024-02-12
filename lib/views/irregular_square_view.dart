import 'package:flutter/material.dart';
import '../widgets/irregular_square_widget.dart';
import '../widgets/title_widget.dart';

class IrregularSquareView extends StatelessWidget {
  IrregularSquareView({super.key});

// #F4F5F0 배경
// #363732 글씨
// #FF725E 상자 1
// #EABC66 상자 2
// #A1A280 상자 3

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
                      7,
                      (int index) => Stack(
                        children: <Widget>[
                          IrregularSquareWidget(
                            randomInt: index,
                            randomColor: randColorList[index % 3],
                          ),
                          const Positioned(
                            bottom: 55,
                            right: 40,
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 35,
                            ),
                          ),
                          Positioned(
                            left: 40,
                            bottom: 30,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'The first time real estate guide',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF363732), //글씨
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
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
