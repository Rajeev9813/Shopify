import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jutta_junction/Controller/cart_controller.dart';
import 'package:jutta_junction/pages/product_Detail/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../Dashboard/Product.dart';
import '../../models/catelog.dart';

class Product_Detail extends StatelessWidget {
  final Product product;
  final cartController = Get.put(CartController());
  Product_Detail({key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> _cart = [];
    return Scaffold(
      resizeToAvoidBottomInset: false,

      