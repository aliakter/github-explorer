import 'package:flutter/material.dart';

class CustomLoadingIn extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? strokeWidth;
  const CustomLoadingIn({super.key, this.color = Colors.green, this.height, this.width, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(strokeWidth: strokeWidth, color: color),
      ),
    );
  }
}
