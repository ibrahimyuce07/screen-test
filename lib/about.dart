import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'stargazer',
          textColor: Color(0xFFCCCC99).withAlpha(100),
          backgroundColor: Color(0xff22385F),
          email: 'kjdhsf@gmail.com',
          textFont: 'Sail',
        ),
        backgroundColor: Color(0xFFCCCC99),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ContactUs(
              cardColor: Color(0xFFCCCC99).withAlpha(100),
              textColor: Color(0xff22385F),
              email: 'kjdhsf@gmail.com',
              companyName: 'Screen Test App',
              companyColor: Color(0xff22385F),
              dividerThickness: 2,
              website:
                  'https://play.google.com/store/apps/dev?id=4702834448373247638',
              tagLine: 'stargazer',
              taglineColor: Color(0xff22385F),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Container(
                  child: Center(
                      child: Text(

                'Screen Test App is a simple app that helps you test your Android '
                'device for screen defects like dead pixels, burn-in, backlight bleeding,'
                ' or color casts.',
                        textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xff22385F),
                  ),

                ),
              ))),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Container(
                child: Icon(
                  Icons.keyboard_return_rounded,
                  size: 50,
                  color: Color(0xff22385F),
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
