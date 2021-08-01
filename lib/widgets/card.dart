import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget content;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  const CustomCard({
    Key? key,
    required this.content,
    this.color = Colors.white,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: color),
      child: content,
      margin: margin,
    );
  }
}
