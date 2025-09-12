import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Features/home/presentation/manager/fetch_all_notes/fetch_all_notes_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/edit_note_view.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/utils/text_styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(noteModel: noteModel);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteModel.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(noteModel.title, style: TextStyles.textStyle26),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyles.textStyle18.copyWith(
                    color: Colors.black.withValues(alpha: .4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<FetchAllNotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(FontAwesomeIcons.trash, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                noteModel.date,
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
