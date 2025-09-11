import 'package:dartz/dartz.dart';
import 'package:notes_app/core/errors/failure.dart';
import 'package:notes_app/core/models/note_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> addNote({required NoteModel note});
  List<NoteModel> fetchAllNotes();
}
