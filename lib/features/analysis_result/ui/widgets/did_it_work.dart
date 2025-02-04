import 'package:flutter/material.dart';

class DidItWork extends StatelessWidget {
  const DidItWork({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Did it work?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Icon(Icons.check_circle, color: Colors.green, size: 24),
        SizedBox(width: 8),
        Icon(Icons.cancel, color: Colors.red, size: 24),
      ],
    );
  }
}
