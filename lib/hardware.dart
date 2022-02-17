import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class HardwareInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Device Info',
                                style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
              backgroundColor: Colors.white70,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                 //naviagte to MyApp
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
            body: HardwareInfo()));
  }
}

class HardwareInfo extends StatefulWidget {
  @override
  _HardwareInfoState createState() => _HardwareInfoState();
}

class _HardwareInfoState extends State<HardwareInfo> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  //TODO: device refresh rate, gradient colors, color picker,
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  @override
  Widget build(BuildContext context) {


    return Container(
        //listview to display all the hardware info
        child: ListView(children: <Widget>[

          //screen aspect ratio

          Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                title: Text(
                  '${MediaQuery.of(context).size.width.floor()} x ${MediaQuery.of(context).size.height.floor()}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: Colors.white,
                        //color: Color(0xFFfacf5a),
                      ),
                    ],
                  ),
                ),
                subtitle: Text('Aspect Ratio',
                    style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
              )),

      //screen dpi https://pub.dev/packages/flutter_screenutil/install



      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['brand'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Brand',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

          Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                title: Text(
                  '${_deviceData['product'].toString().toUpperCase()}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: Colors.white,
                        //color: Color(0xFFfacf5a),
                      ),
                    ],
                  ),
                ),
                subtitle: Text('Product',
                    style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
              )),

      //hardware
      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['hardware'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Hardware',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      //display
      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['display'].toString()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Display',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),



      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['version.sdkInt'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('SDK',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['version.release'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Release',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),
          Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                title: Text(
                  '${_deviceData['version.securityPatch'].toString().toUpperCase()}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: Colors.white,
                        //color: Color(0xFFfacf5a),
                      ),
                    ],
                  ),
                ),
                subtitle: Text('Security Patch',
                    style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
              )),

      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['version.incremental'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Incremental',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['version.codename'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Codename',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      //bootloader
      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['bootloader'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Bootloader',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      //host
      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['host'].toString().toUpperCase()}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Host',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

//isPhysicalDevice
      Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            title: Text(
              '${_deviceData['isPhysicalDevice'].toString() == 'true' ? 'Yes' : 'No'}',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 1,
                    color: Colors.white,
                    //color: Color(0xFFfacf5a),
                  ),
                ],
              ),
            ),
            subtitle: Text('Physical Device',
                style: TextStyle(fontSize: 20.0), textAlign: TextAlign.end),
          )),

      //product


      //supportedAbis
    ]));
  }
}

/**
 * import 'dart:async';
    import 'dart:io';

    import 'package:device_info_plus/device_info_plus.dart';
    import 'package:flutter/foundation.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
    import 'package:screen_tester/main.dart';

    class AboutPage extends StatelessWidget {

    var _count = 0;
    @override
    Widget build(BuildContext context)
    {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Screen Test',
    home: MyAboutPage(title: 'Flutter Demo Home Page'),
    );
    }
    }

    class MyAboutPage extends StatefulWidget {
    const MyAboutPage({Key? key, required String title}) : super(key: key);

    @override
    _MyAboutPageState createState() => _MyAboutPageState();
    }

    class _MyAboutPageState extends State<MyAboutPage> {
    static final _deviceDataPlugin _deviceDataPlugin = _deviceDataPlugin();
    Map<String, dynamic> _deviceData = <String, dynamic>{};

    @override
    void initState() {
    super.initState();
    initPlatformState();
    }

    Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
    if (Platform.isAndroid) {
    deviceData = _readAndroidBuildData(await _deviceDataPlugin.androidInfo);
    }
    } on PlatformException {
    deviceData = <String, dynamic>{
    'Error:': 'Failed to get platform version.'
    };
    }

    if (!mounted) return;

    setState(() {
    _deviceData = deviceData;
    });
    }
    //TODO: device refresh rate, gradient colors, color picker,
    Map<String, dynamic> _readAndroidBuildData(Android_deviceData build) {
    return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'androidId': build.androidId,
    'systemFeatures': build.systemFeatures,
    };
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
    title: Text('About Screen Test App'),
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    //about text
    FittedBox(
    child: Text(
    'This app is a test app for the Screen Tester plugin for Flutter.',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    ),

    SizedBox(
    height: 20,
    ),
    //about your device
    FittedBox(
    child: Text(
    // 'Your device: ${_deviceData['display']} \n'
    //     'Your device: ${_deviceData['type']} \n'
    // // MediaQuery.of(context).devicePixelRatio
    // 'Your device/pixel ratio: ${MediaQuery.of(context).devicePixelRatio} \n'
    //     'Your device/pixel ratio: ${MediaQuery.of(context).size} \n'
    //     'Your device/pixel ratio: ${MediaQuery.of(context).platformBrightness} \n'
    //     //get screen width in mm
    //                     'Your device/pixel ratio: ${MediaQuery.of(context).size.width.toInt()} \n'
    //                     'Your device/pixel ratio: ${MediaQuery.of(context).size.width} \n'
    //how many pixels in height
    'Device Screen Width: ${(MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).toInt()} px\n'
    'Device Screen Height: ${(MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio).toInt()} px\n'
    //get device brand
    'Device Brand: ${_deviceData['brand']} \n'
    //get device model
    'Device Model: ${_deviceData['model']} \n'
    'Your device/pixel ratio: ${MediaQuery.of(context).devicePixelRatio} \n'
    //Screen to Body Ratio
    'Screen to Body Ratio: ${MediaQuery.of(context).size.width / MediaQuery.of(context).size.height} \n'

    ,


    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    ),
    //button to return MyApp page
    RaisedButton(
    color: Colors.blue,
    child: Text('Return'),

    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),
    );
    },
    ),
    ],
    ),
    ),
    );
    }
    }
 */
