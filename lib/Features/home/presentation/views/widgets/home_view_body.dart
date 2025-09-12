import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/note_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Notes', icon: Icons.search, onPressed: () {}),
            const SizedBox(height: 10),
            const Expanded(child: NoteListView()),
          ],
        ),
      ),
    );
  }
}
