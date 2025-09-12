import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:notes_app/core/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.textStyle30),
        CustomIconButton(icon: icon, onPressed: onPressed),
      ],
    );
  }
}
