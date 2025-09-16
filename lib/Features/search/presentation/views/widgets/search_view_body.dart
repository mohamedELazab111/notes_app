import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(hint: 'Search'),
        Text('Enter the note title'),
      ],
    );
  }
}
