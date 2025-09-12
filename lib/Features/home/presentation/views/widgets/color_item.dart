import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 34,
            child: CircleAvatar(radius: 30, backgroundColor: color),
          )
        : CircleAvatar(radius: 34, backgroundColor: color);
  }
}
