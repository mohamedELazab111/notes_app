import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_error_message.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'Content',
            maxlines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              if (state is AddNoteFailure) {
                return CustomErrorMessage(errMessage: state.errMessage);
              } else {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formatedCurrentDate = DateFormat(
                        'dd-mm-yyyy',
                      ).format(currentDate);
                      NoteModel note = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedCurrentDate,
                        color: Colors.blue.toARGB32(),
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
