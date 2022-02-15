import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_tester/smpte.dart';

import 'about.dart';
import 'gradient.dart';
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
  bool _fullscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: Container(
          color: _colorContainer.withOpacity(0.5),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                onTap: () {
                  navigateToHome(context);
                },
              ),
              ListTile(
                title: Text('Random Colors'),
                onTap: () {
                  // navigateToHome(context);
                  setRandomColor();
                },
              ),
              ListTile(
                title: Text('Primary Colors'),
                onTap: () {
                  // navigateToHome(context);
                  setPrimaryColors();
                },
              ),
              ListTile(
                title: Text('Black and White'),
                onTap: () {
                  // navigateToHome(context);
                  setBlackAndWhite();
                },
              ),
              ListTile(
                title: Text('Gradient'),
                onTap: () {
                  setState(() {
                    navigateToGradient(context);
                  });
                },
              ),
              ListTile(
                title: Text('Pick a Color'),
                onTap: () {
                  navigateToColorPicker(context);
                },
              ),
              ListTile(
                title: Text('SMPTE color bars'),
                onTap: () {
                  navigateToSMPTE(context);
                },
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  navigateToAbout(context);
                },
              ),
              ListTile(
                title: Text('Fullscreen'),
                onTap: () {
                  setState(() {
                    if (_fullscreen) {
                      SystemChrome.setEnabledSystemUIOverlays([]);
                      _fullscreen = false;
                    } else {
                      SystemChrome.setEnabledSystemUIOverlays(
                          SystemUiOverlay.values);
                      _fullscreen = true;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: new InkWell(
                onTap: () {
                  titleStateSelector();
                },
                onLongPress: () {
                  navigateToHome(context);
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

  void navigateToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
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
      Colors.black,
      Colors.white
    ];
    setState(() {
      if (_colorContainer == primaryColors[0]) {
        _colorContainer = primaryColors[1];
      } else if (_colorContainer == primaryColors[1]) {
        _colorContainer = primaryColors[2];
      } else if (_colorContainer == primaryColors[2]) {
        _colorContainer = primaryColors[3];
      } else if (_colorContainer == primaryColors[3]) {
        _colorContainer = primaryColors[4];
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

  void navigateToGradient(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GradientPage()),
    );
  }

  void navigateToColorPicker(BuildContext context) {}

  void navigateToSMPTE(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SMPTEPage()),
    );
  }
}

