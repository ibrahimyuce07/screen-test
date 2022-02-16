import 'dart:async';
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
  late bool _fullscreen = true;

  @override
  void initState() {
    super.initState();
    _fullscreen = true;
    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFCCCC99 ),
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onDoubleTap: () {
                  setState(() {
                   if(_fullscreen){
                     SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                     _fullscreen = false;
                   }else{
                     SystemChrome.setEnabledSystemUIOverlays([]);
                     _fullscreen = true;
                   }
                  });
                },
                child: Icon(Icons.fullscreen, size: 45, color: Color(0xff22385F),)),
          ],
        ),

            SizedBox(height: 15),



            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorsPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Solid Colors',
                        style: GoogleFonts.ubuntu(fontSize: 26,  color: Color(0xFFCCCC99), fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 1,
                              color: Colors.white,
                              //color: Color(0xFFfacf5a),
                            ),
                          ],
                        ),
                        ),
                    ),

                    trailing: Icon(
                      Icons.color_lens,
                     color: Color(0xFFCCCC99 ),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GradientPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Gradient Colors',
                        style: GoogleFonts.ubuntu(fontSize: 25,  color: Color(0xFFCCCC99 ), fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 1,
                              color: Colors.white,
                              //color: Color(0xFFfacf5a),
                            ),
                          ],
                        ),                  ),
                    ),
                    // subtitle: Text(
                    //   'Generate random gradient color',
                    //   style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    // ),
                    trailing: Icon(
                      Icons.gradient,
                      color: Color(0xFFCCCC99 ),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SMPTEPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'SMPTE Color Bars',
                        style: GoogleFonts.ubuntu(fontSize: 25, color: Color(0xFFCCCC99 ), fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 1,
                              color: Colors.white,
                              //color: Color(0xFFfacf5a),
                            ),
                          ],
                        ),                 ),
                    ),
                    // subtitle: Text(
                    //   'Display SMPTE pattern',
                    //   style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    // ),
                    trailing: Icon(
                      Icons.graphic_eq,
                      color: Color(0xFFCCCC99 ),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorPickerPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'Color Picker',
                      style: GoogleFonts.ubuntu(fontSize: 25, color: Color(0xFFCCCC99 ), fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 1,
                            color: Colors.white,
                            //color: Color(0xFFfacf5a),
                          ),
                        ],
                      ),                  ),
                  ),
                  // subtitle: Text(
                  //   'Pick a color to display',
                  //   style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                  // ),
                  trailing: Icon(
                    Icons.colorize,
                    color: Color(0xFFCCCC99 ),
                    size: 40,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HardwareInfoPage()),
                // );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Hardware Info',
                        style: GoogleFonts.ubuntu(fontSize: 25, color: Color(0xFFCCCC99 ), fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 1,
                              color: Colors.white,
                              //color: Color(0xFFfacf5a),
                            ),
                          ],
                        ),                  ),
                    ),
                    // subtitle: Text(
                    //   'Check device and screen info',
                    //   style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    // ),
                    trailing: Icon(
                      Icons.perm_device_info_rounded,
                      color: Color(0xFFCCCC99 ),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(6),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff22385F),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 0.5,
                      spreadRadius: 0.8,
                      offset: Offset(3.0, 3.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'About',
                        style: GoogleFonts.ubuntu(fontSize: 25, color: Color(0xFFCCCC99 ), fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 1,
                              color: Colors.white,
                              //color: Color(0xFFfacf5a),
                            ),
                          ],
                        ),            ),
                    ),
                    // subtitle: Text(
                    //   'About this app and how to use it',
                    //   style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.black45 ),
                    // ),
                    trailing: Icon(
                      Icons.info_outline,
                      color: Color(0xFFCCCC99 ),
                      size: 40,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
            ),
            //footer text
            SizedBox(
              height: 100,
            ),

            new Column(
              children: <Widget>[
                new Container(
                  child: new Text(
                    'yucedev',
                    style: GoogleFonts.ubuntu(fontSize: 14, color: Colors.white38, fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
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

  // void navigateToHome(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MyApp()),
  //   );
  // }

  // void setBlackAndWhite() {
  //   _titleState = 'bw';
  //   List<Color> colors = [Colors.black, Colors.white];
  //   setState(() {
  //     if (_colorContainer == colors[0]) {
  //       _colorContainer = colors[1];
  //     } else {
  //       _colorContainer = colors[0];
  //     }
  //   });
  // }

  // void setPrimaryColors() {
  //   _titleState = 'primary';
  //   List<Color> primaryColors = [
  //     Colors.red,
  //     Colors.green,
  //     Colors.blue,
  //     Colors.black,
  //     Colors.white
  //   ];
  //   setState(() {
  //     if (_colorContainer == primaryColors[0]) {
  //       _colorContainer = primaryColors[1];
  //     } else if (_colorContainer == primaryColors[1]) {
  //       _colorContainer = primaryColors[2];
  //     } else if (_colorContainer == primaryColors[2]) {
  //       _colorContainer = primaryColors[3];
  //     } else if (_colorContainer == primaryColors[3]) {
  //       _colorContainer = primaryColors[4];
  //     } else {
  //       _colorContainer = primaryColors[0];
  //     }
  //   });
  // }

  // void setRandomColor() {
  //   _titleState = 'random';
  //   setState(() {
  //     _colorContainer = Color.fromARGB(255, Random().nextInt(255),
  //         Random().nextInt(255), Random().nextInt(255));
  //   });
  // }

  // void titleStateSelector() {
  //   switch (_titleState) {
  //     case 'random':
  //       setRandomColor();
  //       break;
  //     case 'primary':
  //       setPrimaryColors();
  //       break;
  //     case 'bw':
  //       setBlackAndWhite();
  //       break;
  //     default:
  //       setRandomColor();
  //   }
  // }

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
