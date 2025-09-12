import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hint,
        alignLabelWithHint: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
