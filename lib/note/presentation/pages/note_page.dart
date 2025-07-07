import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mosnad/core/helpers/navigateTo.dart';
import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/core/widget/text_form_field_widget.dart';
import 'package:mosnad/note/presentation/riverpod/note_riverpod.dart';
import 'package:mosnad/note/presentation/widgets/list_card.dart';

import '../../../core/widget/auto_size_text_widget.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import 'add_note_page.dart';

class NotePage extends ConsumerWidget {
   NotePage({super.key});
  TextEditingController search =TextEditingController();

  @override
  Widget build(BuildContext context,ref) {
    var state = ref.watch(localBasketProvider);

    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 120.h,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Padding(
          padding:  EdgeInsets.only( bottom: 38.h),
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        flexibleSpace: Padding(
          padding:  EdgeInsets.only( bottom: 8.h,left: 14.w,right: 14.w),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextFormFieldWidget(
              type: TextInputType.text,
              controller:search ,
              hintText: "Search",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding:  EdgeInsets.all(10.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeTextWidget(
                text: "All Notes",
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              20.verticalSpace,
              state.data?.isEmpty == true?SizedBox():
              ListCardWidget(getAllNotes: state.data??[]),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () async {
            navigateTo(context, AddNotePage());
          }),
    );
  }
}
