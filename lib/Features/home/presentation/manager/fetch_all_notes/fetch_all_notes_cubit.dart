import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import 'package:notes_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/core/models/note_model.dart';

part 'fetch_all_notes_state.dart';

class FetchAllNotesCubit extends Cubit<FetchAllNotesState> {
  FetchAllNotesCubit(this.homeRepo) : super(FetchAllNotesInitial());
  final HomeRepo homeRepo;
  List<NoteModel>? notes;
  fetchAllNotes() {
    notes = HomeRepoImpl().fetchAllNotes();
    emit(FetchAllNotesSuccess());
  }
}
