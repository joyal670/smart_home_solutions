// ignore_for_file: prefer_const_constructors

import 'package:apaniot/presentation/sidemenu/contactus.dart';
import 'package:apaniot/presentation/sidemenu/support/feedback.dart';
import 'package:apaniot/presentation/sidemenu/support/gallery.dart';
import 'package:apaniot/presentation/sidemenu/support/helpcenter.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        elevation: 1,
        title: TextWidget(title: 'Support', textStyle: TextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Customer Feedback"),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: FeedbackScreen()));
              },
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
            ),
            ListTile(
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Contact Us"),
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ContactUsScreen()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Gallery"),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: GalleryScreen()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Corporate Blog"),
              onTap: () {},
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Help center"),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HelpCenterScreen()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: colorBlack,
              ),
              titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
              title: Text("Latest news"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
