import 'package:flutter/material.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}
