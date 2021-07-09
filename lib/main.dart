//import 'package:confetti_example/widget/all_confetti_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Confetti Widget';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MyHomePage(),
      );
}
