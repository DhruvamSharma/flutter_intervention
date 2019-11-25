import 'package:flutter/material.dart';

class CustomHorizontalDivider extends StatelessWidget {

  final double width;
  final Color color;
  CustomHorizontalDivider({@required this.width, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: 0.2,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {

  final double height;
  final Color color;
  CustomVerticalDivider({@required this.height, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.2,
        height: height,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}

