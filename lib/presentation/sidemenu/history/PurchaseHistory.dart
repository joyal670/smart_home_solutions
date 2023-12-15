// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apaniot/presentation/sidemenu/history/cancelled.dart';
import 'package:apaniot/presentation/sidemenu/history/completed.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  PurchaseHistoryScreen({super.key});

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping History'.toUpperCase(),
          style: TextStyle(
            color: colorBlue,
            fontSize: 12,
          ),
        ),
        bottom: TabBar(
          indicatorColor: colorBlue,
          controller: _tabController,
          labelColor: colorBlue,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              //  icon: Icon(Icons.directions_car),
              text: 'Completed',
            ),
            Tab(
              text: "Cancelled",
              // icon: Icon(Icons.directions_transit),
            ),
          ],
        ),
      ),
      body: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            CompletedScreen(),
            CancelledScreen(),
          ],
        ),
      ),
    );
  }
}
