import 'package:flutter/material.dart';

class HorizontalStepIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildStepBox(Color.fromARGB(255, 19, 35, 74), 30),
        SizedBox(width: 5),
        buildStepBox(Colors.amber, 15),
        SizedBox(width: 5),
        buildStepBox(Colors.amber, 15),
      ],
    );
  }

  Widget buildStepBox(Color color, double width) {
    return Container(
      height: 6,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
