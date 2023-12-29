// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:animated_digit/animated_digit.dart';
import 'package:animated_list_item/animated_list_item.dart';
import 'package:apaniot/presentation/dashboard/screens/Category.dart';
import 'package:apaniot/presentation/dashboard/screens/Products.dart';
import 'package:apaniot/presentation/dashboard/screens/product_details.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:countup/countup.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

AnimatedDigitController controller1 = AnimatedDigitController(0);
AnimatedDigitController controller2 = AnimatedDigitController(0);
AnimatedDigitController controller3 = AnimatedDigitController(0);

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  List<cModel> data = [];
  List<aModel> data2 = [];
  late AnimationController _animationController;
  List<String> data3 = [];
  List<cModel> data4 = [];
  List<bModel> data5 = [];
  List<dModel> data6 = [];
  List<cModel> data7 = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();

    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height15,
              Image.network(
                'https://apaniot.com/wp-content/uploads/2023/12/cropped-ALOT_Group-of-Company_ALOT-Real-Estate.png',
                width: 100,
              ),
              TextWidget(
                  title: "Welcome to your smart home",
                  textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  )),
              height15,
              SliderWidget(
                data: data3,
              ),
              // SizedBox(
              //   height: 100,
              //   child: Category(
              //       data: data, animationController: _animationController),
              // ),
              height30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'Browse By Category',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    colors: [
                      Color(0xff0045B7),
                      Color(0xff009DE8),
                      Color(0xff00C6FF),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return SmartCategoryScreen(
                            data2: data2,
                            data4: data4,
                          );
                        }));
                      },
                      child: Icon(Icons.more_horiz)),
                ],
              ),
              height10,
              SmartTypes(data: data4),
              height50,
              GradientText(
                'Three Ways To Control Your Home',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                colors: [
                  Color(0xff0045B7),
                  Color(0xff009DE8),
                  Color(0xff00C6FF),
                ],
              ),
              TextWidget(
                title: "Manage your SMART HOUSE from anywhere easily.",
                textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              height20,
              SmartSliderWidget(
                data: data5,
              ),
              height40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'Smart Home Products',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    colors: [
                      Color(0xff0045B7),
                      Color(0xff009DE8),
                      Color(0xff00C6FF),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: SmartProductsScreen(
                                  data6: data6,
                                  data2: data2,
                                )));
                      },
                      child: Icon(Icons.more_horiz)),
                ],
              ),
              height2,
              TextWidget(
                title:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat",
                textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              height10,
              SmartProducts(data: data6),
              Center(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: SmartProductsScreen(
                                data6: data6,
                                data2: data2,
                              )));

                      // Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      //   return SmartProductsScreen(
                      //     data6: data6,
                      //     data2: data2,
                      //   );
                      // }));
                    },
                    child: TextWidget(
                        title: "View All",
                        textStyle: TextStyle(fontSize: 12, color: colorBlue))),
              ),
              height40,
              GradientText(
                'Watch Video Introductions',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                colors: [
                  Color(0xff0045B7),
                  Color(0xff009DE8),
                  Color(0xff00C6FF),
                ],
              ),
              TextWidget(
                title:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat",
                textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              height15,
              VideoPlayer(),
              height40,
              GradientText(
                'Home Security Systems',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                colors: [
                  Color(0xff0045B7),
                  Color(0xff009DE8),
                  Color(0xff00C6FF),
                ],
              ),
              TextWidget(
                title:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat",
                textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              height20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    counterWidget1(
                      data7: data7[0],
                    ),
                    counterWidget2(
                      data7: data7[1],
                    ),
                    counterWidget3(
                      data7: data7[2],
                    ),
                  ],
                ),
              ),
              // Security(data7: data7),
              height30,
              GradientText(
                'Hot Deal Products',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                colors: [
                  Color(0xff0045B7),
                  Color(0xff009DE8),
                  Color(0xff00C6FF),
                ],
              ),
              TextWidget(
                title:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat",
                textStyle: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              height15,
              HotDealsProducts(data: data6),
              height10,
              Center(
                child: OutlinedButton(
                    onPressed: () {},
                    child: TextWidget(
                        title: "Explore All",
                        textStyle: TextStyle(fontSize: 12, color: colorBlue))),
              ),
              height100,
            ],
          ),
        ),
      ),
    );
  }

  void getData() {
    data.clear();
    data2.clear();
    data3.clear();
    data4.clear();
    data5.clear();
    data6.clear();
    data7.clear();
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
        url: "https://img.icons8.com/seesaw--v1",
        name: "Outside",
        isSelected: false));

    data2.add(aModel(name: "All", isSelected: true));
    data2.add(aModel(name: "Smart speakerks", isSelected: false));
    data2.add(aModel(name: "smart Locks", isSelected: false));
    data2.add(aModel(name: "Smart Lights", isSelected: false));
    data2.add(aModel(name: "Security Cameras", isSelected: false));

    data3.add(
        'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
    data3.add(
        'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
    data3.add(
        'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');

    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Video Doorbells",
        isSelected: false));
    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Smart Lights",
        isSelected: false));
    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Smart Speakers",
        isSelected: false));
    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Robot Vacuum Cleaners",
        isSelected: false));
    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Security Cameras",
        isSelected: false));
    data4.add(cModel(
        url:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: "Best Smart Locks",
        isSelected: false));

    data5.add(bModel(
        title: "Best Video Doorbells",
        sub:
            "Everything is under control at a moment’s notice, no matter where you are",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg"));
    data5.add(bModel(
        title: "Best Smart Lights",
        sub:
            "Everything is under control at a moment’s notice, no matter where you are",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg"));
    data5.add(bModel(
        title: "Best Smart Locks",
        sub:
            "Everything is under control at a moment’s notice, no matter where you are",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg"));

    data6.add(dModel(
        title: "Tikam Sacen Facen",
        price: "499",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg",
        rating: "4.2",
        discount: '-20%'));
    data6.add(dModel(
        title: "Suretin mipen ruma",
        price: "856",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg",
        rating: "4.7",
        discount: '-50%'));
    data6.add(dModel(
        title: "PowerShot SX730 HS",
        price: "329",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg",
        rating: "3.7",
        discount: '-13%'));
    data6.add(dModel(
        title: "20W Slimline LED",
        price: "329",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg",
        rating: "2.4",
        discount: '-37%'));
    data6.add(dModel(
        title: "Dalicontrol 30 Mech",
        price: "548",
        image:
            "https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg",
        rating: "4.4",
        discount: '-10%'));

    data7.add(cModel(url: "8", name: "Years of experience", isSelected: false));
    data7.add(
        cModel(url: "1868", name: "Satisfied Customers ", isSelected: false));
    data7
        .add(cModel(url: "868", name: "Systems Installed ", isSelected: false));
  }
}

class counterWidget1 extends StatelessWidget {
  counterWidget1({
    super.key,
    required this.data7,
  });

  final cModel data7;

  LinearGradient linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff0045B7),
      Color(0xff009DE8),
      Color(0xff00C6FF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    //  controller1.resetValue(0);
    //  controller1.addValue(double.parse(data7.url));
    print(controller1.value);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0045B7),
            Color(0xff009DE8),
            Color(0xff00C6FF),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => linearGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: VisibilityDetector(
                    key: Key('security1'),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction > 0) {
                        controller1.resetValue(0);
                        controller1.addValue(double.parse(data7.url));
                        // Future.delayed(Duration(seconds: 1), () {
                        //   print('delayyyyyyyy');
                        // });
                      } else {
                        controller1.resetValue(0);
                      }
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      debugPrint(
                          'Widgetdd ${visibilityInfo.key} is ${visiblePercentage}% visible');
                    },
                    child: AnimatedDigitWidget(
                      controller: controller1,
                      //  value: double.parse(data7.url),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      duration: Duration(seconds: 4),
                    ),
                  ),
                ),
                GradientText(
                  data7.name,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  textAlign: TextAlign.center,
                  colors: [
                    Color(0xff0045B7),
                    Color(0xff009DE8),
                    Color(0xff00C6FF),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class counterWidget2 extends StatelessWidget {
  counterWidget2({
    super.key,
    required this.data7,
  });

  final cModel data7;

  LinearGradient linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff0045B7),
      Color(0xff009DE8),
      Color(0xff00C6FF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // controller2.resetValue(0);
    // controller2.addValue(double.parse(data7.url));
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0045B7),
            Color(0xff009DE8),
            Color(0xff00C6FF),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => linearGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: VisibilityDetector(
                    key: Key('security2'),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction > 0) {
                        controller2.resetValue(0);
                        controller2.addValue(double.parse(data7.url));
                      } else {
                        controller2.resetValue(0);
                      }
                    },
                    child: AnimatedDigitWidget(
                      controller: controller2,
                      // value: double.parse(data7.url),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      duration: Duration(seconds: 4),
                    ),
                  ),
                ),
                GradientText(
                  data7.name,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  textAlign: TextAlign.center,
                  colors: [
                    Color(0xff0045B7),
                    Color(0xff009DE8),
                    Color(0xff00C6FF),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class counterWidget3 extends StatelessWidget {
  counterWidget3({
    super.key,
    required this.data7,
  });

  final cModel data7;

  LinearGradient linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff0045B7),
      Color(0xff009DE8),
      Color(0xff00C6FF),
    ],
  );

  @override
  Widget build(BuildContext context) {
    //  controller3.resetValue(0);
    //  controller3.addValue(double.parse(data7.url));
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0045B7),
            Color(0xff009DE8),
            Color(0xff00C6FF),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => linearGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: VisibilityDetector(
                    key: Key('security3'),
                    onVisibilityChanged: (visibilityInfo) {
                      if (visibilityInfo.visibleFraction > 0) {
                        controller3.resetValue(0);
                        controller3.addValue(double.parse(data7.url));
                      } else {
                        controller3.resetValue(0);
                      }
                    },
                    child: AnimatedDigitWidget(
                      controller: controller3,
                      // value: double.parse(data7.url),
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      duration: Duration(seconds: 4),
                    ),
                  ),
                ),
                GradientText(
                  data7.name,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  textAlign: TextAlign.center,
                  colors: [
                    Color(0xff0045B7),
                    Color(0xff009DE8),
                    Color(0xff00C6FF),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HotDealsProducts extends StatelessWidget {
  HotDealsProducts({
    super.key,
    required this.data,
  });

  final List<dModel> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 320,
                height: 200,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: colorWildSand),
                    color: colorBackground,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: 100,
                          child: Image.network(
                            data[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: colorRed,
                            child: Center(
                              child: TextWidget(
                                  title: data[index].discount,
                                  textStyle: TextStyle(
                                      color: colorWhite, fontSize: 10)),
                            ),
                          ),
                        )
                      ],
                    ),
                    width10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height5,
                          TextWidget(
                              title: data[index].title,
                              textStyle: TextStyle(
                                color: colorBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              )),
                          height5,
                          RatingBar.builder(
                            initialRating: double.parse(data[index].rating),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            ignoreGestures: true,
                            // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: colorBlue,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          height5,
                          TextWidget(
                              title: '\$${data[index].price}',
                              textStyle: TextStyle(
                                color: colorBlue,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              )),
                          height5,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.done,
                                size: 17,
                                color: colorBlue,
                              ),
                              width5,
                              Expanded(
                                child: Text(
                                  'You have the opportunity to watch.',
                                  style: TextStyle(
                                    color: colorBlack,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          height4,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.done,
                                size: 17,
                                color: colorBlue,
                              ),
                              width5,
                              Expanded(
                                child: Text(
                                  'A smart house has excellent video quality.',
                                  style: TextStyle(
                                    color: colorBlack,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          height5,
                          Divider(),
                          TimerCountdown(
                            daysDescription: "Days".toUpperCase(),
                            hoursDescription: "Hours".toUpperCase(),
                            minutesDescription: "Mins".toUpperCase(),
                            secondsDescription: "Secs".toUpperCase(),
                            descriptionTextStyle: TextStyle(
                              fontSize: 10,
                              color: colorBlack,
                            ),
                            colonsTextStyle:
                                TextStyle(color: colorBlack, fontSize: 10),
                            timeTextStyle:
                                TextStyle(color: colorBlue, fontSize: 10),
                            spacerWidth: 0,
                            format:
                                CountDownTimerFormat.daysHoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                days: 5,
                                hours: 14,
                                minutes: 27,
                                seconds: 34,
                              ),
                            ),
                            onEnd: () {
                              print("Timer finished");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Security extends StatelessWidget {
  Security({
    super.key,
    required this.data7,
  });

  final List<cModel> data7;
  final AnimatedDigitController _controller =
      AnimatedDigitController(10240.987);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  AnimatedDigitController _animatedDigitController = AnimatedDigitController(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(data7.length, (index) {
          _animatedDigitController.addValue(double.parse(data7[index].url));
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff0045B7),
                    Color(0xff009DE8),
                    Color(0xff00C6FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Countup(
                        //   begin: 0,
                        //   end: 7500,
                        //   duration: Duration(seconds: 3),
                        //   separator: ',',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 22,
                        //   ),
                        // ),

                        Gradientt(
                          data7[index].url,
                          gradient: LinearGradient(colors: [
                            Color(0xff0045B7),
                            Color(0xff009DE8),
                            Color(0xff00C6FF),
                          ]),
                        ),

                        GradientText(
                          data7[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                          textAlign: TextAlign.center,
                          colors: [
                            Color(0xff0045B7),
                            Color(0xff009DE8),
                            Color(0xff00C6FF),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class Gradientt extends StatelessWidget {
  Gradientt(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  AnimatedDigitController _controller = AnimatedDigitController(0);

  @override
  Widget build(BuildContext context) {
    _controller.addValue(double.parse(text));
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: VisibilityDetector(
        key: Key('my-widget-key'),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction > 0) {
            // _controller.minusValue(double.parse(text));
            //  _controller.resetValue(double.parse(text));
            //  _controller.addValue(double.parse(text));

            _controller.addValue(double.parse(text));
          } else {
            _controller.resetValue(0);
          }
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          debugPrint(
              'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
        },
        child: AnimatedDigitWidget(
          controller: _controller,
          value: double.parse(text),
          textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          duration: Duration(seconds: 4),
        ),
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  VideoPlayer({
    super.key,
  });

  // If the requirement is just to play a single video.
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'eMvIn6R0TPU',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'http://apaniot.com/cache/resized/cb3e95bc43438e2b52616f6f9280c79c.gif',
          width: double.infinity,
          height: 200,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle,
                color: colorBlue,
                size: 40,
              )),
        ),
        YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{},
        )
      ],
    );
  }
}

class SmartSliderWidget extends StatefulWidget {
  SmartSliderWidget({super.key, required this.data});

  List<bModel> data = [];

  @override
  State<SmartSliderWidget> createState() => _SmartSliderWidgetState();
}

class _SmartSliderWidgetState extends State<SmartSliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: widget.data.length,
      options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enableInfiniteScroll: false,
          onPageChanged: (index, reas) {
            setState(() {
              _current = index;
            });
          }),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: colorBackground,
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.data[itemIndex].image,
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
                height10,
                TextWidget(
                    title: widget.data[itemIndex].title,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                Text(
                  widget.data[itemIndex].sub,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmartProducts extends StatefulWidget {
  SmartProducts({
    super.key,
    required this.data,
  });

  final List<dModel> data;

  @override
  State<SmartProducts> createState() => _SmartProductsState();
}

class _SmartProductsState extends State<SmartProducts>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      //  childAspectRatio: 1 / 1.5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(widget.data.length, (index) {
        return AnimatedListItem(
          index: index,
          length: widget.data.length,
          aniController: _animationController,
          animationType: AnimationType.zoom,
          startX: 40,
          startY: 60,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ProductDetailsScreen(
                        data: widget.data[index],
                      )));
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: colorWildSand),
                      color: colorBackground,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      // MultiImageProvider multiImageProvider = MultiImageProvider([
                      //   Image.network(
                      //     widget.data[index].image,
                      //   ).image,
                      //   Image.network(
                      //     widget.data[index].image,
                      //   ).image,
                      //   Image.network(
                      //     widget.data[index].image,
                      //   ).image,
                      //   Image.network(
                      //     widget.data[index].image,
                      //   ).image
                      // ]);

                      // showImageViewerPager(context, multiImageProvider,
                      //     onPageChanged: (page) {
                      //   print("page changed to $page");
                      // }, onViewerDismissed: (page) {
                      //   print("dismissed while on page $page");
                      // });
                      showImageDialog(context, widget.data[index]);
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              widget.data[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: colorRed,
                            child: Center(
                              child: TextWidget(
                                  title: widget.data[index].discount,
                                  textStyle: TextStyle(
                                      color: colorWhite, fontSize: 10)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                height5,
                TextWidget(
                    title: widget.data[index].title,
                    textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
                RatingBar.builder(
                  initialRating: double.parse(widget.data[index].rating),
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  ignoreGestures: true,
                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: colorBlue,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                TextWidget(
                    title: '\$${widget.data[index].price}',
                    textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}

void showImageDialog(BuildContext context, dModel data) {
  int selectedIndex = 0;
  final CarouselController _controller = CarouselController();
  List<String> imageList = [];
  imageList.add(data.image);
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');
  imageList.add(
      'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg');

  ItemScrollController _scrollController = ItemScrollController();

  imageList.add(data.image);
  bool isBookMarked = false;
  showGeneralDialog(
    context: context,
    barrierColor: colorWhite, // Background color
    barrierDismissible: false,
    barrierLabel: 'Dialog',
    transitionDuration: Duration(milliseconds: 500),

    pageBuilder: (context, animation, secondaryAnimation) {
      const double initialScale = 0.5; // Initial scale, adjust as needed
      final curvedValue = Curves.easeInOutBack.transform(animation.value);
      final scale = initialScale + (1.0 - initialScale) * curvedValue;

      return StatefulBuilder(builder: (BuildContext ctx, StateSetter setState) {
        return ScaleTransition(
          scale: animation,
          child: Material(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: imageList.length,
                  options: CarouselOptions(
                      height: double.infinity,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reas) {
                        setState(() {
                          selectedIndex = index;
                          _scrollController.scrollTo(
                              index: selectedIndex,
                              duration: Duration(seconds: 1));
                        });
                      }),
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: colorWhite),
                    child: Image.network(imageList[itemIndex],
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 5,
                  child: IconButton.filled(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(colorWildSand2)),
                      onPressed: () {
                        // if (isBookMarked) {
                        //   isBookMarked = false;
                        //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("added to favorites list"),
                        //     ),
                        //   );
                        // } else {
                        //   isBookMarked = true;
                        //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("removed from favorites list"),
                        //     ),
                        //   );
                        // }
                        setState(() {
                          isBookMarked = !isBookMarked;
                        });
                      },
                      icon: isBookMarked
                          ? Icon(
                              Icons.favorite,
                              color: colorRed,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: colorBlack,
                            )),
                ),
                Positioned(
                  top: 25,
                  left: 5,
                  child: IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(colorWildSand)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 28,
                      color: colorBlack,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 60,
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      itemCount: imageList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              _controller.jumpToPage(selectedIndex);
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            clipBehavior: Clip.hardEdge,
                            padding: EdgeInsets.all(3),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: selectedIndex == index
                                        ? colorBlack
                                        : colorMobyDick)),
                            child: Image.network(
                              imageList[index],
                              height: 60,
                              width: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
    },
  ).whenComplete(() {});
}

class SmartTypes extends StatefulWidget {
  const SmartTypes({
    super.key,
    required this.data,
  });

  final List<cModel> data;

  @override
  State<SmartTypes> createState() => _SmartTypesState();
}

class _SmartTypesState extends State<SmartTypes> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.forward();
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      //  childAspectRatio: 1 / 1.5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(widget.data.length, (index) {
        return AnimatedListItem(
          index: index,
          length: widget.data.length,
          aniController: _animationController,
          animationType: AnimationType.slide,
          startX: 40,
          startY: 60,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: colorWildSand),
                color: colorBackground,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    widget.data[index].url,
                    fit: BoxFit.fill,
                  ),
                ),
                height3,
                TextWidget(
                    title: widget.data[index].name,
                    textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SliderWidget extends StatefulWidget {
  SliderWidget({super.key, required this.data});

  List<String> data = [];

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.data.length,
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reas) {
                setState(() {
                  _current = index;
                });
              }),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: double.infinity,
            decoration: BoxDecoration(color: colorWhite),
            child: Image.network(widget.data[itemIndex],
                fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.1)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class SmartCategory extends StatefulWidget {
  const SmartCategory({
    super.key,
    required this.data2,
  });

  final List<aModel> data2;

  @override
  State<SmartCategory> createState() => _SmartCategoryState();
}

class _SmartCategoryState extends State<SmartCategory> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data2.length,
        separatorBuilder: (BuildContext ctx, index) {
          return width10;
        },
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              for (var element in widget.data2) {
                element.isSelected = false;
              }
              setState(() {
                widget.data2[index].isSelected = true;
              });
            },
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: widget.data2[index].isSelected
                        ? colorBlack
                        : colorWildSand,
                    border: Border.all(
                        color: widget.data2[index].isSelected
                            ? colorBlack
                            : colorWildSand),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  widget.data2[index].name,
                  style: TextStyle(
                      color: widget.data2[index].isSelected
                          ? colorWildSand
                          : colorBlack,
                      fontWeight: widget.data2[index].isSelected
                          ? FontWeight.w500
                          : FontWeight.normal),
                )),
          );
        });
  }
}

class Category extends StatefulWidget {
  const Category({
    super.key,
    required this.data,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final List<cModel> data;
  final AnimationController _animationController;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, index) {
          return AnimatedListItem(
            index: index,
            length: widget.data.length,
            aniController: widget._animationController,
            animationType: AnimationType.fade,
            startX: 40,
            startY: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    for (var element in widget.data) {
                      element.isSelected = false;
                    }
                    setState(() {
                      widget.data[index].isSelected = true;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: colorWildSand),
                        color: widget.data[index].isSelected
                            ? colorBlack
                            : colorBackground,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                      widget.data[index].url,
                      color: widget.data[index].isSelected
                          ? colorWhite
                          : colorBlack,
                    ),
                  ),
                ),
                height3,
                TextWidget(
                    title: widget.data[index].name,
                    textStyle: TextStyle(
                      color: colorBlack,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, index) => width20,
        itemCount: widget.data.length);
  }
}

class cModel {
  final String url;
  final String name;
  bool isSelected;

  cModel({required this.url, required this.name, required this.isSelected});
}

class aModel {
  final String name;
  bool isSelected;

  aModel({required this.name, required this.isSelected});
}

class bModel {
  final String title;
  final String sub;
  final String image;

  bModel({required this.title, required this.sub, required this.image});
}

class dModel {
  final String title;
  final String price;
  final String image;
  final String rating;
  final String discount;

  dModel(
      {required this.title,
      required this.price,
      required this.image,
      required this.rating,
      required this.discount});
}
