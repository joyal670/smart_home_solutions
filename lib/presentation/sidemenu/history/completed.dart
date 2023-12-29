// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderModel {
  final String image;
  final String name;
  final String qty;
  final String order;
  final int status;

  OrderModel(
      {required this.image,
      required this.name,
      required this.qty,
      required this.order,
      required this.status});
}

class CompletedScreen extends StatefulWidget {
  CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  int selectedValue = 0;
  List<OrderModel> orderModel = [];

  @override
  Widget build(BuildContext context) {
    orderModel.clear();
    orderModel.add(
      OrderModel(
        image:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: 'Suretin mipen ruma',
        qty: "1",
        order: '#786512984',
        status: 0,
      ),
    );
    orderModel.add(
      OrderModel(
        image:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: 'PowerShot SX730 HS',
        qty: "3",
        order: '#12654893',
        status: 0,
      ),
    );
    orderModel.add(
      OrderModel(
        image:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: '20W Slimline LED',
        qty: "2",
        order: '#67798321',
        status: 1,
      ),
    );
    orderModel.add(
      OrderModel(
        image:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: 'Suretin mipen ruma',
        qty: "1",
        order: '#987412354',
        status: 0,
      ),
    );
    orderModel.add(
      OrderModel(
        image:
            'https://www.shutterstock.com/image-photo/asian-young-woman-using-smart-260nw-1931287913.jpg',
        name: '20W Slimline LED',
        qty: "2",
        order: '#67798321',
        status: 0,
      ),
    );
    return Scaffold(
      backgroundColor: colorWildSand2,
      appBar: AppBar(
        title: Text(
          'Shopping History'.toUpperCase(),
          style: TextStyle(
            color: colorBlue,
            fontSize: 12,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: colorWhite,
            child: Column(
              children: [
                Row(
                  children: [
                    width10,
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.help_outline,
                      ),
                      iconSize: 30,
                      color: colorGrey,
                    ),
                    width40,
                    SizedBox(
                      width: 250,
                      child: CupertinoSlidingSegmentedControl(
                        // selectedColor: colorBlue,
                        //   unselectedColor: colorWildSand2,
                        padding: EdgeInsets.all(2),
                        children: {
                          0: Expanded(
                            child: Text(
                              "Today",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          1: Expanded(
                            child: Text(
                              "Previous month",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        },
                        onValueChanged: (value) {
                          selectedValue = value!;

                          setState(() {});
                        },
                        groupValue: selectedValue,
                      ),
                    ),
                  ],
                ),
                height10,
                Divider(
                  thickness: 1,
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Most recent Orders',
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          VerticalDivider(),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.sort),
                              label: Text('Filter')),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          height20,
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext ctx, index) {
                return Material(
                  elevation: 0,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          titleTextStyle: TextStyle(
                            color: colorBlack,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitleTextStyle: TextStyle(
                            color: colorGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          leading: Image.network(
                            orderModel[index].image,
                          ),
                          title: Text(
                            orderModel[index].name,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height10,
                              Text(
                                'Quantity : ${orderModel[index].qty}',
                              ),
                              // height4,
                              // Text('Price : \$100'),
                              height4,
                              Row(
                                children: [
                                  Text('Order : '),
                                  Text(orderModel[index].order,
                                      style: TextStyle(color: colorBlue)),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                orderModel[index].status == 0
                                    ? 'Processing - delivery by Fri Nov 27, 2022'
                                    : "Cancelled",
                                style: TextStyle(
                                    color: orderModel[index].status == 0
                                        ? colorGrey
                                        : colorRed,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),
                            TextButton(
                                onPressed: orderModel[index].status == 0
                                    ? () {}
                                    : null,
                                child: Text('Track'))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext ctx, index) => height10,
              itemCount: orderModel.length,
            ),
          )
        ],
      ),
    );
  }
}
