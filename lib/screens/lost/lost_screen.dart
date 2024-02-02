import 'package:flutter/material.dart';

class LostScreen extends StatelessWidget {
  const LostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost Screen'),
      ),
      body: const Center(
        child: Text('Lost Screen'),
      ),
    );
  }
}
