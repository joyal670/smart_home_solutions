// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/dims.dart';
import '../../dashboard.dart';

class SmartCategoryScreen extends StatelessWidget {
  const SmartCategoryScreen(
      {super.key, required this.data2, required this.data4});

  final data2;
  final data4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: TextWidget(
          title: "Smart Home Category",
          textStyle: TextStyle(
              color: colorBlack, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            height20,
            SizedBox(
              height: 30,
              child: SmartCategory(data2: data2),
            ),
            height15,
            SmartTypes(data: data4),
            height40
          ],
        ),
      ),
    );
  }
}
