import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/errors/failure.dart';
import 'package:notes_app/core/models/note_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> addNote({required NoteModel note});
  Future<Either<Failure, Box<NoteModel>>> editNote({required NoteModel note});
  Future<Either<Failure, Box<NoteModel>>> deleteNote({required NoteModel note});
}
