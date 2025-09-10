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
      var noteBox = Hive.box(kNotesBox);
      await noteBox.add(note);
      return right(null);
    } on Exception catch (e) {
      if (e is HiveError) {
        return left(LocalFailure.fromHiveError(e));
      } else {
        return left(LocalFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Box<NoteModel>>> deleteNote({
    required NoteModel note,
  }) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Box<NoteModel>>> editNote({required NoteModel note}) {
    // TODO: implement editNote
    throw UnimplementedError();
  }
}
