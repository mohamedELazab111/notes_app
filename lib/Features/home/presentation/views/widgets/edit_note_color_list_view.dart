import 'package:flutter/material.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/color_item.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/utils/constants.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int selectedItem;

  @override
  void initState() {
    selectedItem = kColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                selectedItem = index;
                widget.noteModel.color = kColors[index].toARGB32();
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isSelected: selectedItem == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
