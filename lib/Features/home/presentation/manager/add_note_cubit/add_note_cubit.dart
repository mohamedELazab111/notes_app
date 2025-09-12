import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import 'package:notes_app/core/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.homeRepo) : super(AddNoteInitial());
  final HomeRepo homeRepo;
  Color color = const Color(0xffAC3931);
  addNote(NoteModel note) async {
    note.color = color.toARGB32();
    emit(AddNoteLoading());
    var result = await homeRepo.addNote(note: note);
    result.fold(
      (failure) {
        emit(AddNoteFailure(failure.errMessage));
      },
      (notes) {
        emit(AddNoteSuccess());
      },
    );
  }
}
