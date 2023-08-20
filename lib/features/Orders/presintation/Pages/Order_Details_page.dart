import 'package:flutter/material.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';

class Order_Details_page extends StatefulWidget {
  const Order_Details_page({Key? key}) : super(key: key);
  @override
  State<Order_Details_page> createState() => _Order_Details_pageState();
}

class _Order_Details_pageState extends State<Order_Details_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: Center(
              child: Text(
                'تفاصيل الطلب',
                style: AppTheme.textTheme.headline2,
              ))),
    );
  }
}
