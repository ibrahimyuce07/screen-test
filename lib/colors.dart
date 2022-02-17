import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Test',
      home: MyColorsPage(),
    );
  }
}

class MyColorsPage extends StatefulWidget {
  @override
  _MyColorsPageState createState() => _MyColorsPageState();
}

class _MyColorsPageState extends State<MyColorsPage> {
  Color _colorContainer = Colors.red;
  String _titleState = 'random';

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
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
                  titleStateSelector();
                },
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  }
                },
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select a color profile:'),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  child: Text('Random'),
                                  onPressed: () {
                                    setRandomColor();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('RGB'),
                                  onPressed: () {
                                    setPrimaryColors();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('B & W'),
                                  onPressed: () {
                                    setBlackAndWhite();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ],
                        );
                      });
                },
                child: Container(
                  color: _colorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  void setBlackAndWhite() {
    _titleState = 'bw';
    List<Color> colors = [Colors.black, Colors.white];
    setState(() {
      if (_colorContainer == colors[0]) {
        _colorContainer = colors[1];
      } else {
        _colorContainer = colors[0];
      }
    });
  }

  void setPrimaryColors() {
    _titleState = 'primary';
    List<Color> primaryColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
    ];
    setState(() {
      if (_colorContainer == primaryColors[0]) {
        _colorContainer = primaryColors[1];
      } else if (_colorContainer == primaryColors[1]) {
        _colorContainer = primaryColors[2];
      } else {
        _colorContainer = primaryColors[0];
      }
    });
  }

  void setRandomColor() {
    _titleState = 'random';
    setState(() {
      _colorContainer = Color.fromARGB(255, Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255));
    });
  }

  void titleStateSelector() {
    switch (_titleState) {
      case 'random':
        setRandomColor();
        break;
      case 'primary':
        setPrimaryColors();
        break;
      case 'bw':
        setBlackAndWhite();
        break;
      default:
        setRandomColor();
    }
  }
}
