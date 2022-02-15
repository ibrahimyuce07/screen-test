import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_tester/smpte.dart';
import 'about.dart';
import 'colorpicker.dart';
import 'colors.dart';
import 'gradient.dart';
import 'hardware.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Test',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _colorContainer = Colors.red;
  String _titleState = 'random';
  bool _fullscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green
                ]
                    ),
              ),
        /////

        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            //title text 'Screen Test'
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Display Test',
                  style: GoogleFonts.ubuntu(
                    fontSize: 50,
                    color: Colors.amber,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black45,
                        offset: Offset(5, 5),
                      ),
                    ],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorsPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),



                  child: ListTile(
                    title: Text(
                      'Test Colors',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Check dead pixels, light bleeding, scratches, etc.',
                      //text opacity: 0.5,
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.color_lens,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GradientPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),
                  child: ListTile(
                    title: Text(
                      'Gradient Colors',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Generate random gradient color',
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.gradient,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SMPTEPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellowAccent.withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),
                  child: ListTile(
                    title: Text(
                      'SMPTE Color Bars',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Display SMPTE pattern',
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.graphic_eq,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ColorPickerPage()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),
                  child: ListTile(
                    title: Text(
                      'Color Picker',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Pick a color to display',
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.colorize,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HardwareInfoPage()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.shade600.withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),
                  child: ListTile(
                    title: Text(
                      'Hardware Info',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Check device and screen info',
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.hardware,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent..withOpacity(0.8),
                        blurRadius: 22,
                      ),
                        ],
                      ),
                  child: ListTile(
                    title: Text(
                      'About',
                      style: GoogleFonts.ubuntu(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'About this app and how to use it',
                      style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    ),
                    trailing: Icon(
                      Icons.info,
                      color: Color(0xFF303030),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
          ],
        ),






        ////

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
