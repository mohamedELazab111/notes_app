import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/Features/home/presentation/manager/fetch_all_notes/fetch_all_notes_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/home_view.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/core/utils/simple_bloc_observer.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchAllNotesCubit(HomeRepoImpl())..fetchAllNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        ),
        home: const HomeView(),
      ),
    );
  }
}
