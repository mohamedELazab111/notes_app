import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/add_note_floating_button.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddNoteFloatingButton(),
      body: HomeViewBody(),
    );
  }
}
