import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/fetch_all_notes/fetch_all_notes_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/edit_note_color_list_view.dart';
import 'package:notes_app/core/models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                widget.noteModel.subTitle =
                    subTitle ?? widget.noteModel.subTitle;
                widget.noteModel.save();
                Navigator.pop(context);
                BlocProvider.of<FetchAllNotesCubit>(context).fetchAllNotes();
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hint: widget.noteModel.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: widget.noteModel.subTitle,
              maxlines: 5,
              onChanged: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(height: 16),
            EditNoteColorListView(noteModel: widget.noteModel),
          ],
        ),
      ),
    );
  }
}
