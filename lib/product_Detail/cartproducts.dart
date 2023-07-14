import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jutta_junction/Controller/cart_controller.dart';
import 'package:jutta_junction/Dashboard/Product.dart';
import 'package:jutta_junction/pages/chatbot/ChatPage.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 450,
      child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: ((BuildContext context, int index) {
            return CartProductCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          })),
    ));
  }
}

