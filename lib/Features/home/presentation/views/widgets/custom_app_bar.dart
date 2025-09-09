import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_search_icon.dart';
import 'package:notes_app/core/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.textStyle30),
        CustomSearchIcon(icon: icon),
      ],
    );
  }
}
