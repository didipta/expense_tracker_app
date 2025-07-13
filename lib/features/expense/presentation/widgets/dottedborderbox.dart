import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedBorderBox extends StatelessWidget {
  final Widget child;
  const DottedBorderBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      child: child,

    );
  }
}
