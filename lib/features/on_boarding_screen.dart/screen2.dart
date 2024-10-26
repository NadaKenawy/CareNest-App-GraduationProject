import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: const Center(
        child: Text(
          "Screen 2",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
