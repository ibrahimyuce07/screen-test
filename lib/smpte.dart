import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_tester/main.dart';


class SMPTEPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Test',
      home: MySMPTEPage(),
    );
  }
}

class MySMPTEPage extends StatefulWidget {
  const MySMPTEPage({Key? key}) : super(key: key);

  @override
  _MySMPTEPageState createState() => _MySMPTEPageState();
}

class _MySMPTEPageState extends State<MySMPTEPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //add svg image
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          child: Image.asset(
            'images/SMPTE_Color_Bars_16x9.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
    );
  }
}
