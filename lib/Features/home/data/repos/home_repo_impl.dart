import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Features/home/data/repos/home_repo.dart';
import 'package:notes_app/core/errors/failure.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/utils/constants.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, void>> addNote({required NoteModel note}) async {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      return right(null);
    } catch (e) {
      if (e is HiveError) {
        return left(LocalFailure.fromHiveError(e));
      } else {
        return left(LocalFailure(e.toString()));
      }
    }
  }

  @override
  List<NoteModel> fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    List<NoteModel> notes = noteBox.values.toList();
    return notes;
  }
}
