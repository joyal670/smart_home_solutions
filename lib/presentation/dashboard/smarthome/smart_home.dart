// ignore_for_file: prefer_const_constructors

import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/SmartDeviceBox .dart';

class SmartHomeScreen extends StatefulWidget {
  const SmartHomeScreen({super.key});

  @override
  State<SmartHomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SmartHomeScreen>
    with TickerProviderStateMixin {
  // padding constants
  final double horizontalPadding = 10;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "assets/light-bulb.png", true],
    ["Smart AC", "assets/air-conditioner.png", false],
    ["Smart TV", "assets/smart-tv.png", false],
    ["Smart Fan", "assets/fan.png", false],
    ["Smart Fan", "assets/fan.png", false],
  ];

  List<cModel> data = [];
  late AnimationController _animationController;

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  void initState() {
    getData();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();
    super.initState();
  }

  void getData() {
    data.clear();
    data.add(cModel(
        url: 'https://img.icons8.com/living-room',
        name: "Living room",
        isSelected: true));
    data.add(cModel(
        url: "https://img.icons8.com/bedroom",
        name: "Bedroom",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/kitchen--v1",
        name: "Kitchen",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/shower",
        name: "Bathroom",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/seesaw--v1",
        name: "Outside",
        isSelected: false));
    data.add(cModel(
        url: 'https://img.icons8.com/living-room',
        name: "Living room",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/bedroom",
        name: "Bedroom",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/kitchen--v1",
        name: "Kitchen",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/shower",
        name: "Bathroom",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/shower",
        name: "Bathroom",
        isSelected: false));
    data.add(cModel(
        url: "https://img.icons8.com/seesaw--v1",
        name: "Outside",
        isSelected: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,

              // // welcome home
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Welcome Home,",
              //       style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
              //     ),
              //     Text(
              //       'Mitch Koko',
              //       style: GoogleFonts.bebasNeue(fontSize: 35),
              //     ),
              //   ],
              // ),

              // height25,

              SizedBox(
                height: 100,
                child: Category(
                    data: data, animationController: _animationController),
              ),

              const SizedBox(height: 25),

              Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),

              // smart devices grid
              Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 10),

              // grid
              GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
