import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  final Color? backgrondColor;

  const CustomPage(
      {Key? key, required this.child, this.backgrondColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: child,
          ),
        ),
      ),
    );
  }
}
