import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import 'package:notes_app/core/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.homeRepo) : super(AddNoteInitial());
  final HomeRepo homeRepo;
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    var result = await homeRepo.addNote(note: note);
    result.fold(
      (failure) {
        emit(AddNoteFailure(failure.errMessage));
      },
      (books) {
        emit(AddNoteSuccess());
      },
    );
  }
}
