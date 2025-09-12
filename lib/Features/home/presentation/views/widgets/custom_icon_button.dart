import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .17),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(icon: Icon(icon, size: 25), onPressed: onPressed),
    );
  }
}
