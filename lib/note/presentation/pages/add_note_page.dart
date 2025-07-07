import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/core/widget/auto_size_text_widget.dart';
import 'package:mosnad/core/widget/primary_button_widget.dart';
import 'package:mosnad/core/widget/text_form_field_widget.dart';
import 'package:mosnad/note/data/model/note_model.dart';
import 'package:mosnad/note/presentation/riverpod/note_riverpod.dart';
import 'package:mosnad/note/presentation/widgets/alerm_widget.dart';

import '../widgets/catagories_choice_widget.dart';

class AddNotePage extends ConsumerStatefulWidget {

  AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();

  TextEditingController controller = TextEditingController();

  bool isWorkNote = false;

  bool isPersonalNote = false;

  bool isIdealNote = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title:const Text(
            "Add Note",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(14.sp),
          child: Column(
            children: [
              TextFormFieldWidget(
                controller: title,
                type: TextInputType.text,
                fillColor: AppColors.greySwatch.shade100,
                hintText: "title",
              ),
              20.verticalSpace,
              TextFormFieldWidget(
                controller: content,
                type: TextInputType.text,
                fillColor: AppColors.greySwatch.shade100,
                hintText: "content",
                maxLine: 8,
              ),
              20.verticalSpace,
              Row(
                children: [
                  CatagoriesChoiceWidget(
                    onTap: (){
                      setState(() {
                        isWorkNote = !isWorkNote;
                      });
                    } ,
                    catagories:"Work" ,
                    isCatagories:isWorkNote ,
                  ),

                  4.horizontalSpace,
                  CatagoriesChoiceWidget(
                    onTap: (){
                      setState(() {
                        isPersonalNote = !isPersonalNote;
                      });
                    } ,
                    catagories:"Personal" ,
                    isCatagories:isPersonalNote ,
                  ),
                  4.horizontalSpace,
                  CatagoriesChoiceWidget(
                    onTap: (){
                      setState(() {
                        isIdealNote = !isIdealNote;
                      });
                    } ,
                    catagories:"ideas" ,
                    isCatagories:isIdealNote ,
                  ),
                ],
              ),
              20.verticalSpace,

              ReminderPage(),
              20.verticalSpace,
              PrimaryButtonWidget(
                text: "Add Note",
                onPressed: (){
                  final add = NoteModel1(
                    note:content.text,
                    ideas:isIdealNote? "ideas":"",
                    personal:isPersonalNote? "personal":"",
                    work:isWorkNote? "work":"",
                    title: title.text,
                  );

                  ref
                      .read(localBasketProvider.notifier)
                      .functionAddToBasket(noteModel: add);
                  ref
                      .read(localBasketProvider.notifier)
                      .functionGetAllBasket();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
