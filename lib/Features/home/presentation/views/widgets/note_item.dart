import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Features/home/presentation/views/edit_note_view.dart';
import 'package:notes_app/core/utils/text_styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNoteView();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text('Flutter Tips', style: TextStyles.textStyle26),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'welcome to notes app hope you would enjoy it',
                  style: TextStyles.textStyle18.copyWith(
                    color: Colors.black.withValues(alpha: .4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                'Sept9.2025',
                style: TextStyles.textStyle16.copyWith(
                  color: Colors.black.withValues(alpha: .4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
