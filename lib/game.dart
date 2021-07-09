import 'dart:math';

// ignore: import_of_legacy_library_into_null_safe
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "Loose";
  int score = 80;
  ConfettiController _controllerCenterRight =
      ConfettiController(duration: const Duration(seconds: 10));

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    _controllerCenterRight.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            // do something
          },
        )
      ], elevation: 0, backgroundColor: Colors.blue.shade100),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.8),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Transform.scale(
                        scale: 4,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/87115354?v=4"),
                        ),
                      ),
                    ),
                    Text(
                      "Winner!!!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Credited with Rupees 100",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Text("Button"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(mediaQuery, 60, 0, 0),
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirectionality: BlastDirectionality.explosive,
                  // don't specify a direction, blast randomly
                  // start again as soon as the animation is finished
                  colors: const [
                    Colors.greenAccent,
                    Colors.blueAccent,
                    Colors.pinkAccent,
                    Colors.orangeAccent,
                    Colors.purpleAccent,
                    Colors.black,
                    Colors.grey,
                    Colors.redAccent,
                    Colors.amberAccent,
                    Colors.cyanAccent
                  ], // manually specify the colors to be used
                  // createParticlePath: drawStar, // define a custom shape/path.

                  shouldLoop: true,
                  emissionFrequency: 0.05,
                  numberOfParticles: 10,
                  gravity: 0.2,
                  maxBlastForce: 2,
                  minBlastForce: 1,
                  particleDrag: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
