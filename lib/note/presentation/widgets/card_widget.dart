import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mosnad/core/widget/auto_size_text_widget.dart';

import '../../../core/widget/primary_button_widget.dart';
import '../riverpod/note_riverpod.dart';

class CardWidget extends ConsumerWidget {
  final String title;
  final String content;
  final int id;

  const CardWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.id});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeTextWidget(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                6.verticalSpace,
                AutoSizeTextWidget(
                  text: content,
                  fontSize: 15,
                ),
                10.verticalSpace,
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ref
                  .read(localBasketProvider.notifier)
                  .functionDeleteASingleItemFromTheBasket(id: id);
              ref.read(localBasketProvider.notifier).functionGetAllBasket();
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
            iconSize: 25.sp,
          ),

        ],
      ),
    );
  }
}
