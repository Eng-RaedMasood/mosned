import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widget/auto_size_text_widget.dart';

class CatagoriesChoiceWidget extends StatelessWidget {
   CatagoriesChoiceWidget({super.key,required this.onTap,required this.isCatagories,required this.catagories});
  Function() onTap;
  bool isCatagories;
  String catagories;
  @override
  Widget build(BuildContext context) {
    return                   Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,

          height: 40.sp,
          decoration: BoxDecoration(
            color: AppColors.greySwatch.shade100,
            borderRadius: BorderRadius.circular(20),
            border:isCatagories==true? Border.all(color: Colors.green): Border.all(color: Colors.white),
          ),
          child: AutoSizeTextWidget(text: catagories),

        ),
      ),
    )
    ;
  }
}
