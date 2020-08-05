import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Producer: Tlaster"),
          Text("Powered by Flutter"),
        ],
      ),
    );
  }
}
