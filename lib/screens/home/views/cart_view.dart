import 'package:flutter/material.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}
