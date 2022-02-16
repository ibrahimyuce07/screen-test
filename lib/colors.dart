import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      drawer: Container(
           width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(

          child: Container(
            color: _colorContainer.withOpacity(0.7),
            child: ListView(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.color_lens, color: Colors.black,size: 28,),
                        SizedBox(width: 10,),
                        Text('Random',
                          style: GoogleFonts.ubuntu(fontSize: 24,  color: Colors.black, fontWeight: FontWeight.w600,),),
                      ],
                    ),
                    onTap: () {
                      setRandomColor();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.color_lens, color: Colors.black,size: 28,),
                        SizedBox(width: 10,),
                        Text('RGB',
                          style: GoogleFonts.ubuntu(fontSize: 24,  color: Colors.black, fontWeight: FontWeight.w600,),),
                      ],
                    ),
                    onTap: () {
                      setPrimaryColors();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.color_lens, color: Colors.black,size: 28,),
                        SizedBox(width: 10,),
                        Text('Black & White',
                          style: GoogleFonts.ubuntu(fontSize: 24,  color: Colors.black, fontWeight: FontWeight.w600,),),
                      ],
                    ),
                    onTap: () {
                      setBlackAndWhite();
                    },
                  ),
                ),
                SizedBox(height: 440,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.keyboard_return_rounded, color: Colors.black,size: 28,),
                        SizedBox(width: 10,),
                        Text('Return',
                          style: GoogleFonts.ubuntu(fontSize: 24,  color: Colors.black, fontWeight: FontWeight.w600,),),
                      ],
                    ),
                    onTap: () {
                      navigateToHome(context);
                    },
                  ),
                ),
              ],
            ),
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
