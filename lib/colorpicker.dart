import 'package:flutter/material.dart';
import 'package:screen_tester/main.dart';

class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  @override
  void initState() {
    // TODO: implement initState
    //navigate to my home page
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

