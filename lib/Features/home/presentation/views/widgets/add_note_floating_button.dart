import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/core/utils/constants.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: kPrimaryColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const AddNoteBottomSheet();
          },
        );
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
