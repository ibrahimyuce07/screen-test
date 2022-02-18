import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_tester/main.dart';

import 'picker.dart';

class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ColorPickerState(),
      ),
    );

  }
}

class ColorPickerState extends StatefulWidget {

  @override
  _ColorPickerStateState createState() => _ColorPickerStateState();
}

class _ColorPickerStateState extends State<ColorPickerState> {
  PickerColors _pickerColors = PickerColors();


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
    ]);


    _pickerColors.screenPickerColor = Colors.blue;  // Material blue.
    _pickerColors.dialogPickerColor = Colors.red;   // Material red.
    _pickerColors.dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 20) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      },
      child: Column(

        children: [

          Expanded(
            child: Card(
              elevation: 2,
              child: ColorPicker(
                enableOpacity: true,
                // Use the screenPickerColor as start color.
                color: _pickerColors.screenPickerColor,
                // Update the screenPickerColor using the callback.
                onColorChanged: (Color color) =>
                    setState(() => _pickerColors.screenPickerColor = color),
                width: 64,
                height: 64,
                borderRadius: 5,
                subheading: Text(
                  'Select color shade',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
          //button to show dialog
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 70,
              width: 150,
              child: MaterialButton(
                color: _pickerColors.screenPickerColor ,
                child: Text('Pick Color'),
                onPressed: () => {
                  //navigate to colorpickerdialog page
                  //showDialog
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          Dialog(
                            insetPadding: EdgeInsets.all(0),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: _pickerColors.screenPickerColor,

                              ),
                            )
                          )
                  )
                }
              ),
            ),
          ),


        ]
      ),
    );
  }

}



