import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/core/widget/auto_size_text_widget.dart';
import 'package:mosnad/note/data/model/note_model.dart';
import 'package:mosnad/note/presentation/riverpod/note_riverpod.dart';

import 'card_widget.dart';

class ListCardWidget extends StatefulWidget {
  final List<NoteModel1> getAllNotes;

  const ListCardWidget( {super.key,required this.getAllNotes,});

  @override
  State<ListCardWidget> createState() => _ListCardWidgetState();
}

class _ListCardWidgetState extends State<ListCardWidget> {
  @override
  Widget build(BuildContext context) {
  // void _togglePin(int index) {
  //
  //   setState(() {
  //     widget.getAllNotes[index].isPinned = !widget.getAllNotes[index].isPinned!;
  //     widget.getAllNotes.sort((a, b) => b.isPinned.toString().compareTo(a.isPinned.toString()));
  //   });
  // }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.getAllNotes.length,
      itemBuilder: (context, index) {
      return Padding(
        padding:  EdgeInsets.only(top: 10.0.sp),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.greySwatch.shade50,
            borderRadius: BorderRadius.circular(14.sp),
          ),
          child: CardWidget(
            title:   widget.getAllNotes[index].title.toString(),
            content: widget.getAllNotes[index].note.toString(),
            id:widget.getAllNotes[index].id! ,

          ),
        ),
      );
    },);
  }
}

