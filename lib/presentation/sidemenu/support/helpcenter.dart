// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorBlue, //change your color here
        ),
        elevation: 1,
        title: TextWidget(
            title: 'How can we help you?'.toUpperCase(),
            textStyle: TextStyle(color: colorBlue, fontSize: 12)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          height25,
          Text(
            'Getting Started',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: colorGrey,
            ),
            textAlign: TextAlign.center,
          ),
          height50,
          CupertinoSearchTextField(
            placeholder: 'Start typing your search...',
            placeholderStyle: TextStyle(fontSize: 12),
            padding: EdgeInsets.all(15),
          ),
          height40,
          Text(
            'Or choose an option',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          height40,
          Material(
            elevation: 3,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              onTap: () {},
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide.none),
              tileColor: colorWildSand2,
              leading: Icon(
                Icons.group,
                color: colorBlue,
              ),
              title: TextWidget(
                  title: 'Guides',
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          height25,
          Material(
            elevation: 3,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              onTap: () {},
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide.none),
              tileColor: colorWildSand2,
              leading: Icon(
                Icons.chat,
                color: colorBlue,
              ),
              title: TextWidget(
                  title: 'FAQs',
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          height25,
          Material(
            elevation: 3,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              onTap: () {},
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide.none),
              tileColor: colorWildSand2,
              leading: Icon(
                Icons.group,
                color: colorBlue,
              ),
              title: TextWidget(
                  title: 'Community',
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
