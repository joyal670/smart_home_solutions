// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_widgets.dart';

class SmartProductsScreen extends StatelessWidget {
  const SmartProductsScreen(
      {super.key, required this.data6, required this.data2});

  final data6;
  final data2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: TextWidget(
          title: "Smart Home Products",
          textStyle: TextStyle(
              color: colorBlack, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            height20,
            SizedBox(
              height: 30,
              child: SmartCategory(data2: data2),
            ),
            height25,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      color: colorWildSand,
                      child: InkWell(
                        onTap: () {
                          showFilterDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.tune, color: colorBlack),
                            width10,
                            TextWidget(
                              title: 'Filter',
                              textStyle: TextStyle(color: colorBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                width15,
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      color: colorWildSand,
                      child: InkWell(
                        onTap: () {
                          showSortBy(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sort, color: colorBlack),
                            width10,
                            TextWidget(
                              title: 'Sort by',
                              textStyle: TextStyle(color: colorBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            height20,
            Expanded(child: SmartProducts(data: data6)),
            height40
          ],
        ),
      ),
    );
  }
}

void showSortBy(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        color: colorWhite,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'SORT BY',
              style: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            height5,
            ListTile(
              onTap: () {
                print("object");
              },
              leading: Icon(Icons.local_fire_department),
              title: Text('Popularity'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.new_releases),
              title: Text('Latest'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.money_off),
              title: Text('Discount'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.vertical_align_bottom),
              title: Text('Price: High to Low'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.vertical_align_top),
              title: Text('Price: Low to High'),
            ),
          ],
        ),
      );
    },
  );
}

void showFilterDialog(BuildContext context) {
  // Set up a controller for the animation
  final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: Navigator.of(context),
  );

  // Define the tween for the slide animation
  final Tween<Offset> _offsetTween = Tween(
    begin: Offset(-1.0, 0.0),
    end: Offset(0.0, 0.0),
  );

  // Create the animation using the tween and controller
  final Animation<Offset> _offsetAnimation = _offsetTween.animate(controller);

  // Start the animation when the dialog is shown
  controller.forward();

  controller.forward();

  showGeneralDialog(
    context: context,
    barrierColor: colorWhite, // Background color
    barrierDismissible: false,
    barrierLabel: 'Dialog',
    transitionDuration: Duration(milliseconds: 500),

    pageBuilder: (context, __, ___) {
      List<String> filters = [
        'SecurityCameras',
        'Smart Lights',
        'Smart Speakers',
        'SmartHome'
      ];

      return SlideTransition(
        position: _offsetAnimation,
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: colorBlack,
                title: TextWidget(
                    title: 'Filters', textStyle: TextStyle(color: colorWhite)),
                leading: IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(colorBlack)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 28,
                    color: colorWhite,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      title: 'Reset'.toUpperCase(),
                      textStyle: TextStyle(color: colorWhite),
                    ),
                  )
                ],
              ),
              ListView(
                padding: EdgeInsets.all(12),
                shrinkWrap: true,
                //direction: Axis.vertical,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    shape: Border(),
                    title: Text("Category",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    //  leading: Icon(Icons.category),
                    initiallyExpanded: true,
                    expandedAlignment: Alignment.topLeft,
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      ChipWidget1(filters: filters),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    shape: Border(),
                    title: Text("Manufactures",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    //  leading: Icon(Icons.category),
                    initiallyExpanded: false,
                    expandedAlignment: Alignment.topLeft,
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      ChipWidget2(filters: filters),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    shape: Border(),
                    title: Text("Price",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    //  leading: Icon(Icons.category),
                    initiallyExpanded: false,
                    expandedAlignment: Alignment.topLeft,
                    childrenPadding: EdgeInsets.all(10),
                    children: [
                      PriceSlider(),
                    ],
                  ),
                  height30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(colorBlack),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                            title: "Show result".toUpperCase(),
                            textStyle: TextStyle(
                              color: colorWhite,
                            ))),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  ).whenComplete(() {
    // Dispose the animation controller when the dialog is closed
    controller.reverse();
  });
}

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 40);

  double sliderValue = 0;
  TextEditingController startController = TextEditingController(text: "0");
  TextEditingController endController = TextEditingController(text: "40");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _currentRangeValues,
          max: 100,
          activeColor: colorBlack,
          divisions: 5,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
              startController.text =
                  _currentRangeValues.start.round().toString();
              endController.text = _currentRangeValues.end.round().toString();
            });
          },
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Min :",
                ),
                width5,
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: colorGrey)),
                  child: Center(
                    child: Text(
                      startController.text.toString(),
                    ),
                  ),
                ),
              ],
            ),
            width30,
            Row(
              children: [
                Text(
                  "Max :",
                ),
                width5,
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: colorGrey)),
                  child: Center(
                    child: Text(
                      endController.text.toString(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ChipWidget2 extends StatefulWidget {
  const ChipWidget2({
    super.key,
    required this.filters,
  });

  final List<String> filters;

  @override
  State<ChipWidget2> createState() => _ChipWidget2State();
}

class _ChipWidget2State extends State<ChipWidget2> {
  List<String> exerciseFilters = [
    'Apaniot',
    'Others',
  ];
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 3.0,
          children: exerciseFilters.map((String exercise) {
            return FilterChip(
              labelStyle: TextStyle(color: colorBlack, fontSize: 12),
              labelPadding: EdgeInsets.all(2),
              label: Text(exercise),
              selected: selectedFilters.contains(exercise),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedFilters.add(exercise);
                  } else {
                    selectedFilters.remove(exercise);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ChipWidget1 extends StatefulWidget {
  const ChipWidget1({
    super.key,
    required this.filters,
  });

  final List<String> filters;

  @override
  State<ChipWidget1> createState() => _ChipWidget1State();
}

class _ChipWidget1State extends State<ChipWidget1> {
  List<String> exerciseFilters = [
    'Security Cameras',
    'Smart Lights',
    'Smart Speakers',
    'SmartHome',
    'Video Doorbells'
  ];
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 3.0,
          children: exerciseFilters.map((String exercise) {
            return FilterChip(
              labelStyle: TextStyle(color: colorBlack, fontSize: 12),
              labelPadding: EdgeInsets.all(2),
              label: Text(exercise),
              selected: selectedFilters.contains(exercise),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedFilters.add(exercise);
                  } else {
                    selectedFilters.remove(exercise);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
