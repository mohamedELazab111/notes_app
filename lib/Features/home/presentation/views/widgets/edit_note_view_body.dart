import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(height: 30),
            CustomTextField(hint: 'Title'),
            SizedBox(height: 16),
            CustomTextField(hint: 'Content', maxlines: 5),
          ],
        ),
      ),
    );
  }
}
