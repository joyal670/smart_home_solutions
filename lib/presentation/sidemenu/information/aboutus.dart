// ignore_for_file: prefer_const_constructors

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          height20,
          TextWidget(
              title: 'Welcome to Apaniot™ Smart Home Products',
              textStyle: TextStyle(
                  color: colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          height20,
          TextWidget(
              title:
                  'Since the inception of YOU & ME Planet Information Technology LLC in 2013, we have been continuously striving to deliver 360-degree services in the field of hardware and software development. we have leapfrogged the technological evolution by engaging not only in website development but also carrying out the turnkey projects of computer networks. Our focus is to assist in developing software applications from scratch to optimize their businesses',
              textStyle: TextStyle(color: colorGrey)),
          height20,
          TextWidget(
              title:
                  'We provide the best home automation systems provide an easy and secure way to control all of your smart home systems. The best home automation systems are essential to any growing smart home. We now have more smart devices in our homes than ever before, from lighting systems such as Hue to internet-connected thermostats, fridges, and more, so controlling them all easily can be a bit of a nightmare.',
              textStyle: TextStyle(color: colorGrey)),
          height20,
          TextWidget(
              title:
                  'After we did long research about smart home products we come up with a wide range of smart home products. such as smart switches, smart curtains, smart sensors, smart cameras, smart locks',
              textStyle: TextStyle(color: colorGrey)),
          height40,
          Image.network(
            'http://apaniot.com/images/2022/06/18/apaniot.jpg',
            height: 350,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
