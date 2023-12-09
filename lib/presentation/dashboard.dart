// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard/home/homepage.dart';
import 'package:apaniot/presentation/dashboard/feeds/newfeeds.dart';
import 'package:apaniot/presentation/dashboard/notifications/notifications.dart';
import 'package:apaniot/presentation/dashboard/smarthome/smart_home.dart';
import 'package:apaniot/presentation/sidemenu/contactus.dart';
import 'package:apaniot/presentation/sidemenu/information/information.dart';
import 'package:apaniot/presentation/sidemenu/support/support.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final pages = [
    SmartHomeScreen(),
    HomePageScreen(),
    NewFeedsScreen(),
    NotificationsScreen()
  ];

  int currentPage = 0;
  late TabController tabController;
  bool isShown = true;

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  late ScrollController _scrollController;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: colorWhite,

            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height20,
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                  ),
                  Text(
                    'Mitch Koko',
                    style: GoogleFonts.bebasNeue(fontSize: 35),
                  ),
                  height5
                ],
              ),
            ),

            // leading: InkWell(
            //     onTap: () {
            //       _key.currentState!.openDrawer();
            //     },
            //     child: Icon(Icons.vertical_distribute)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 28,
                ),
              ),
              width10,
              InkWell(
                onTap: () {
                  _key.currentState!.openEndDrawer();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.asset(
                    'assets/profile_vector.png',
                  ),
                ),
              ),
              width20
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: colorWhite,
          child: Container(
            decoration: BoxDecoration(color: colorWhite),
            child: Column(
              // padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'http://apaniot.com/images/apainot-black-2.png',
                        width: 150,
                      ),
                      TextWidget(
                          title: "We are with you in your need! Stay with us.",
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: colorBlue)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Profile',
                              style: TextStyle(
                                color: colorBlack,
                              ),
                            ),
                            leading: Icon(
                              Icons.account_box,
                              color: colorBlack,
                            ),
                            onTap: () {
                              // Then close the drawer
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text(
                              'Our Information',
                              style: TextStyle(
                                color: colorBlack,
                              ),
                            ),
                            leading: Icon(
                              Icons.info,
                              color: colorBlack,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: InformationScreen()));
                            },
                            trailing: Icon(
                              Icons.arrow_right,
                              color: colorBlack,
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Our Support',
                              style: TextStyle(
                                color: colorBlack,
                              ),
                            ),
                            leading: Icon(
                              Icons.support,
                              color: colorBlack,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: SupportScreen()));
                            },
                            trailing: Icon(
                              Icons.arrow_right,
                              color: colorBlack,
                            ),
                          ),
                          ExpansionTile(
                            title: Text("Quick Links"),
                            leading: Icon(Icons.link),
                            children: [
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Living Room"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Bedroom"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Bathroom"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Outdoor"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Office"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Garage"),
                                onTap: () {},
                              ),
                              ListTile(
                                visualDensity:
                                    VisualDensity(vertical: -4), // to compact
                                titleTextStyle:
                                    TextStyle(fontSize: 14, color: colorBlack),
                                title: Text("Kitchen Room"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            'https://img.icons8.com/ios-glyphs/30/facebook-new.png',
                            width: 30,
                            height: 30,
                          ),
                          Image.network(
                            'https://img.icons8.com/ios-glyphs/30/google-logo--v1.png',
                            width: 30,
                            height: 30,
                          ),
                          Image.network(
                            'https://img.icons8.com/ios-glyphs/30/instagram-new.png',
                            width: 30,
                            height: 30,
                          ),
                          Image.network(
                            'https://img.icons8.com/ios-glyphs/30/youtube-play.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                      height10,
                      TextWidget(
                          title: "Hotline: (+971) 52 428 9977",
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: colorBlue)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: FrostedBottomBar(
          opacity: 1,
          sigmaX: 5,
          sigmaY: 5,
          bottomBarColor: colorBlack,
          child: TabBar(
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.blue, width: 4),
              insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
            ),
            tabs: [
              TabsIcon(
                  icons: Icons.developer_board,
                  color: currentPage == 0 ? colorWhite : colorGrey),
              TabsIcon(
                  icons: Icons.home,
                  color: currentPage == 1 ? colorWhite : colorGrey),
              TabsIcon(
                  icons: Icons.rss_feed,
                  color: currentPage == 2 ? colorWhite : colorGrey),
              TabsIcon(
                  icons: Icons.queue_play_next,
                  color: currentPage == 3 ? colorWhite : colorGrey),
            ],
          ),
          borderRadius: BorderRadius.circular(500),
          duration: const Duration(milliseconds: 800),
          hideOnScroll: true,
          reverse: true,
          body: (context, controller) => TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const BouncingScrollPhysics(),
              children: pages),
        ));
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
