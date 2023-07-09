//import
import 'package:flutter/material.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';
import 'package:like_button/like_button.dart';
import 'Product.dart';

class ItemCart extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCart({
   key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Product_Detail(product: product),
            ),
          );
        },
