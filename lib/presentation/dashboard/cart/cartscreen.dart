// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:apaniot/utils/colors.dart';
import 'package:apaniot/utils/dims.dart';
import 'package:flutter/material.dart';

class modelClass {
  String image;
  String name;
  int price;
  int qty;

  modelClass(
      {required this.image,
      required this.name,
      required this.qty,
      required this.price});
}

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<modelClass> model = [
    modelClass(
        image:
            'http://apaniot.com/cache/resized/fa7482224fd75f2ffab22644b509cb79.jpg',
        name: 'Suretin mipen ruma',
        qty: 1,
        price: 45),
    modelClass(
      image:
          'http://apaniot.com/cache/resized/70c9c19173be5d7bfc6efcf98cd3a16c.jpg',
      name: 'PowerShot SX730 HS',
      qty: 2,
      price: 60,
    ),
    modelClass(
      image:
          'http://apaniot.com/cache/resized/8b68426735c87e6b20cbc49041c30a84.jpg',
      name: '20W Slimline LED',
      qty: 1,
      price: 12,
    ),
    modelClass(
        image:
            'http://apaniot.com/cache/resized/fa7482224fd75f2ffab22644b509cb79.jpg',
        name: 'Suretin mipen ruma',
        qty: 1,
        price: 45),
    modelClass(
      image:
          'http://apaniot.com/cache/resized/70c9c19173be5d7bfc6efcf98cd3a16c.jpg',
      name: 'PowerShot SX730 HS',
      qty: 2,
      price: 60,
    ),
    modelClass(
      image:
          'http://apaniot.com/cache/resized/8b68426735c87e6b20cbc49041c30a84.jpg',
      name: '20W Slimline LED',
      qty: 1,
      price: 12,
    )
  ];

  @override
  Widget build(BuildContext context) {
    int price = 0;

    for (var element in model) {
      int q = element.qty;
      int t = element.price;
      int f = t * q;
      price = price + f;
    }

    double finalP = price + 24.20 + 40.00;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: colorWhite,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: model.isEmpty ? null : () {},
          child: Text(
            model.isEmpty ? "Empty Cart" : 'Checkout',
            style: TextStyle(color: colorWhite),
          ),
          style: TextButton.styleFrom(
              backgroundColor: model.isEmpty ? colorWildSand : colorBlue,
              minimumSize: Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ListView.separated(
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorWildSand2,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: colorGrey,
                        // ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        titleTextStyle: TextStyle(
                            color: colorBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        subtitleTextStyle: TextStyle(
                          color: colorGrey,
                          fontSize: 14,
                        ),
                        leading: Image.network(
                          model[index].image,
                          width: 100,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                        title: Text(
                          model[index].name,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height5,
                            Text(
                              '\$${model[index].price.toString()}',
                              style: TextStyle(fontSize: 15),
                            ),
                            height4,
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      int q = model[index].qty;
                                      q--;

                                      if (q <= 1) {
                                        q = 1;
                                      }

                                      model[index].qty = q;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                  ),
                                  iconSize: 20,
                                ),
                                Container(
                                    width: 40,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: colorGrey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child:
                                            Text(model[index].qty.toString()))),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      model[index].qty++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  iconSize: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              model.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete_outline,
                          ),
                          iconSize: 20,
                          color: colorRed,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext ctx, index) {
                  return height10;
                },
                itemCount: model.length),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height15,
                Text(
                  'Price Breakdown',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorGrey),
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Base Price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taxes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      model.isEmpty ? '\$0' : '\$24.20',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cleaning Fee',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      model.isEmpty ? '\$0' : '\$40.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                height15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        width10,
                        Icon(
                          Icons.info_outline,
                          color: colorGrey,
                          size: 17,
                        )
                      ],
                    ),
                    Text(
                      model.isEmpty ? '\$0' : '\$$finalP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
