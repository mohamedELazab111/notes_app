import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(child: Text('Add', style: TextStyles.textStyle20)),
      ),
    );
  }
}
