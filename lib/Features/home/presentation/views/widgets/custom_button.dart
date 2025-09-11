import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/core/utils/text_styles.dart';
import 'package:notes_app/core/widgets/custom_loading_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLoading = false});
  final VoidCallback onTap;
  final bool isLoading;
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
        child: isLoading
            ? const CustomLoadingIndicator()
            : const Center(child: Text('Add', style: TextStyles.textStyle20)),
      ),
    );
  }
}
