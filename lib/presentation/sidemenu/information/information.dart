// ignore_for_file: prefer_const_constructors

import 'package:apaniot/presentation/sidemenu/information/aboutus.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        elevation: 1,
        title: TextWidget(title: 'Information', textStyle: TextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("About Us"),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: AboutUsScreen()));
              },
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Our Company"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Recent News"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Our Projects"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("All Services"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Smart Home"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Online Store"),
              onTap: () {},
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
