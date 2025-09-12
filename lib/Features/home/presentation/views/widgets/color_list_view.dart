import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/Features/home/presentation/views/widgets/color_item.dart';
import 'package:notes_app/core/utils/constants.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedItem = 0;
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
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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
