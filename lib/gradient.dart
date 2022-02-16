import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_tester/main.dart';


class GradientPage extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Test',
      home: MyGradientPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyGradientPage extends StatefulWidget {
  const MyGradientPage({Key? key, required String title}) : super(key: key);

  @override
  _MyGradientPageState createState() => _MyGradientPageState();
}

class _MyGradientPageState extends State<MyGradientPage> {
  var _color1 = Colors.red;
  var _color2 = Colors.blue;

  @override
  void initState() {
    super.initState();
    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    // Stop full screen
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: new GestureDetector(
                onTap: () {
                  changeGradient();
                },
                onPanUpdate: (details) {
                  if (details.delta.dx > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _color1,
                        _color2,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  void changeGradient() {
    setState(() {
      _color1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

}
