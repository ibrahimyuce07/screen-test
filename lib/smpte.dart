import 'package:flutter/material.dart';
import 'package:screen_tester/main.dart';


class SMPTEPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //add svg image
        child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }
            },
          child: Image.asset('images/smpte_color_bars.webp',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
    );
  }
}
