// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/colors.dart';
import '../../../utils/common_widgets.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          height25,
          TextWidget(
              title: 'Give feedback',
              textStyle: TextStyle(
                color: colorBlack,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
          height30,
          TextWidget(
              title: 'Email address (optional)',
              textStyle:
                  TextStyle(color: colorBlack, fontWeight: FontWeight.bold)),
          height10,
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: colorBlue.withOpacity(0.05),
                label: TextWidget(
                    title: 'Enter your email address',
                    textStyle: TextStyle(color: colorGrey)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          height30,
          TextWidget(
              title: 'Rate your experience',
              textStyle: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.bold,
              )),
          height10,
          EmojiFeedback(
            animDuration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn,
            inactiveElementScale: .5,
            onChanged: (value) {
              print(value);
            },
          ),
          height30,
          TextWidget(
              title: 'Comment, if any?',
              textStyle: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.bold,
              )),
          height10,
          SizedBox(
            height: 200,
            child: TextFormField(
              keyboardType: TextInputType.name,
              maxLines: 200,
              decoration: InputDecoration(
                  constraints:
                      const BoxConstraints(maxHeight: 70, minHeight: 35),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorBlue.withOpacity(0.05),
                  label: TextWidget(
                      title: 'Say something here...',
                      textStyle: TextStyle(color: colorGrey)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          height20,
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colorBlue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
              onPressed: () {
                showDia(context);
              },
              child: TextWidget(
                  title: "Sent".toUpperCase(),
                  textStyle: TextStyle(
                    color: colorWhite,
                  ))),
        ],
      ),
    );
  }

  void showDia(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
              Lottie.asset('assets/Animation.json'),
              TextWidget(
                  title: 'Thank you!',
                  textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              TextWidget(
                title:
                    'By making your voice heard, you helps us to improve our services.',
                textStyle: TextStyle(
                  color: colorGrey,
                  fontSize: 13,
                ),
                align: TextAlign.center,
              ),
              height10,
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext ctx) {
                      return DashboardScreen();
                    }), (route) => false);
                  },
                  child: TextWidget(
                      title: 'go back home'.toUpperCase(),
                      textStyle:
                          TextStyle(decoration: TextDecoration.underline)))
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        );
      },
    );
  }
}
