part of 'fetch_all_notes_cubit.dart';

@immutable
sealed class FetchAllNotesState {}

final class FetchAllNotesInitial extends FetchAllNotesState {}

final class FetchAllNotesSuccess extends FetchAllNotesState {}
