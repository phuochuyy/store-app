import 'package:flutter/material.dart';

class TCircularLoader extends StatelessWidget {
  final double size;
  final Color color;

  TCircularLoader(double d, MaterialColor blue, {this.size = 50.0, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
