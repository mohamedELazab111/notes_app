import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/fetch_all_notes/fetch_all_notes_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/note_item.dart';
import 'package:notes_app/core/models/note_model.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllNotesCubit, FetchAllNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<FetchAllNotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: NoteItem(noteModel: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
