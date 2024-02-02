import 'package:flutter/material.dart';

class NotificationPageView extends StatelessWidget {
  const NotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notifications',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}
