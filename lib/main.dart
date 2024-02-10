import 'package:flutter/material.dart';
import 'views/irregular_square_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'irregular square',
        theme: ThemeData(),
        home: IrregularSquareView(),
      );
}
