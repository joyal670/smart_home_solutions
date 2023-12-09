// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          height20,
          TextWidget(
              title: 'Feel free to drop us a message',
              textStyle: TextStyle(
                color: colorBlack,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          height30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 17,
                ),
                width5,
                TextWidget(
                  title: 'name'.toUpperCase(),
                  textStyle: TextStyle(color: colorBlack, fontSize: 12),
                ),
              ],
            ),
          ),
          height3,
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: colorBlue.withOpacity(0.05),
                label: TextWidget(
                    title: 'Enter your name',
                    textStyle: TextStyle(color: colorGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
          height15,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  size: 17,
                ),
                width5,
                TextWidget(
                  title: 'Email'.toUpperCase(),
                  textStyle: TextStyle(color: colorBlack, fontSize: 12),
                ),
              ],
            ),
          ),
          height3,
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: colorBlue.withOpacity(0.05),
                label: TextWidget(
                    title: 'Enter your email',
                    textStyle: TextStyle(color: colorGrey)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
          height15,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.message,
                  size: 17,
                ),
                width5,
                TextWidget(
                  title: 'Message'.toUpperCase(),
                  textStyle: TextStyle(color: colorBlack, fontSize: 12),
                ),
              ],
            ),
          ),
          height3,
          SizedBox(
            height: 200,
            child: TextFormField(
              keyboardType: TextInputType.name,
              maxLines: 200,
              decoration: InputDecoration(
                  constraints:
                      const BoxConstraints(maxHeight: 70, minHeight: 35),
                  filled: true,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorBlue.withOpacity(0.05),
                  label: TextWidget(
                      title: '(Optional)',
                      textStyle: TextStyle(color: colorGrey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ),
          height40,
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colorBlue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
              onPressed: () {},
              child: TextWidget(
                  title: "Submit".toUpperCase(),
                  textStyle: TextStyle(
                    color: colorWhite,
                  ))),
        ],
      ),
    );
  }
}
