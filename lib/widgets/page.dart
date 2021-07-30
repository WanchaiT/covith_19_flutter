import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final Widget child;

  const CustomPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: child,
      ),
    );
  }
}
