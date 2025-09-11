import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:notes_app/Features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/core/utils/constants.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: kPrimaryColor,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => AddNoteCubit(HomeRepoImpl()),
              child: const AddNoteBottomSheet(),
            );
          },
        );
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
