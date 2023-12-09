// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/dashboard/feeds/feedsDetails.dart';
import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../utils/dims.dart';

class NewFeedsScreen extends StatelessWidget {
  NewFeedsScreen({super.key});

  List<Model> data = [];

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height15,
                GradientText(
                  'Featured Articles',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  colors: [
                    Color(0xff0045B7),
                    Color(0xff009DE8),
                    Color(0xff00C6FF),
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
                height20,
                SizedBox(
                  height: 350,
                  child: FeedsWidget(data: data),
                ),
                height30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        title: 'Recent',
                        textStyle: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextWidget(
                        title: 'Show All',
                        textStyle: TextStyle(
                            color: colorBlue,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                  ],
                ),
                height10,
                RecentWidget(data: data),
                height100
              ],
            ),
          )),
    );
  }

  void getData() {
    data.clear();
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/a3b33dc17302c1df1b43a64e9ea90f1b.jpg",
        title: 'Aenean Ipsum tincidunt ut sed',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '45',
        sub: "Smart Home"));
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/26fb2c72a9468b1d5f7acb26129437e6.jpg",
        title: 'Aestibulum Ipsum A Ornare Car',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '12',
        sub: "Smart Device"));
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/6e1dfd99ffbf7de2d04db4ead454999c.jpg",
        title: 'Donec tellus Nulla lorem Nullam elit',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '65',
        sub: "Smart Switch"));
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/a3b33dc17302c1df1b43a64e9ea90f1b.jpg",
        title: 'Aenean Ipsum tincidunt ut sed',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '102',
        sub: "Smart Light"));
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/26fb2c72a9468b1d5f7acb26129437e6.jpg",
        title: 'Aestibulum Ipsum A Ornare Car',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '64',
        sub: "Smart Speaker"));
    data.add(Model(
        image:
            "http://apaniot.com/cache/resized/6e1dfd99ffbf7de2d04db4ead454999c.jpg",
        title: 'Donec tellus Nulla lorem Nullam elit',
        date: '03 12 2018',
        username: 'Super User',
        description:
            'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod ...',
        like: '45',
        sub: "Smart Locks"));
  }
}

class RecentWidget extends StatelessWidget {
  const RecentWidget({
    super.key,
    required this.data,
  });

  final List<Model> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctx, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: FeedsDetails(
                        data: data[index],
                      )));
            },
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(data[index].image)),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].sub.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      color: colorBlue,
                      fontWeight: FontWeight.w700),
                ),
                height3,
                Text(
                  data[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: colorBlack,
                      fontWeight: FontWeight.w400),
                ),
                height3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: colorGrey,
                      size: 18,
                    ),
                    width5,
                    Text(
                      data[index].date,
                      style: TextStyle(
                        color: colorGrey,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    width40,
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          color: colorGrey,
                          size: 16,
                        ),
                        width5,
                        Text(
                          data[index].like,
                          style: TextStyle(
                            color: colorGrey,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, index) => height15,
        itemCount: data.length);
  }
}

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({
    super.key,
    required this.data,
  });

  final List<Model> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: FeedsDetails(
                          data: data[index],
                        )));
              },
              child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          data[index].image,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 5,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_outline,
                              color: colorWhite,
                              size: 30,
                            )),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset('assets/profile_vector.png'),
                            ),
                            width5,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].title,
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: colorWhite,
                                      size: 18,
                                    ),
                                    width5,
                                    Text(
                                      data[index].date,
                                      style: TextStyle(
                                        color: colorWhite,
                                        fontSize: 13,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            width30
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, index) => width10,
        itemCount: data.length);
  }
}

class Model {
  final String image;
  final String title;
  final String date;
  final String username;
  final String description;
  final String sub;
  final String like;

  Model(
      {required this.image,
      required this.title,
      required this.date,
      required this.username,
      required this.sub,
      required this.like,
      required this.description});
}
