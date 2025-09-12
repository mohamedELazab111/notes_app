import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/edit_note_view_body.dart';
import 'package:notes_app/core/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(noteModel: noteModel));
  }
}
