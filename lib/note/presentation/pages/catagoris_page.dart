import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mosnad/core/theme/app_colors.dart';
import 'package:mosnad/core/widget/text_form_field_widget.dart';
import 'package:mosnad/note/presentation/riverpod/note_riverpod.dart';
import 'package:mosnad/note/presentation/widgets/list_card.dart';

class CatagoriesPage extends ConsumerWidget {
   CatagoriesPage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    var state = ref.watch(localBasketProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Catagories",
            style: TextStyle(color: Colors.white),
          )),
      body: DefaultTabController(
        length: 3,

        child: Column(
          children: [
            Container(

              margin: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp),
              decoration: BoxDecoration(
                color: AppColors.greySwatch.shade50,
                borderRadius: BorderRadius.circular(25.sp),
              ),
              child: TabBar(

                physics: const BouncingScrollPhysics(),
                unselectedLabelColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                  color: AppColors.primaryColor,
                ),

                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Work"),
                    ),

                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Personal"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Ideas"),
                    ),
                  ),

                ],
                onTap: (index){
                 if(index==0){
                   ref.read(localBasketProvider.notifier).functionCatagoris(catag: "work");
                 }else if(index == 1){
                   ref.read(localBasketProvider.notifier).functionCatagoris(catag: "personal");
                 }
                 else if(index == 2){
                   ref.read(localBasketProvider.notifier).functionCatagoris(catag: "ideas");
                 }
                },
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return TabBarView(

                    physics: const NeverScrollableScrollPhysics(),
                    children: [

                      /// Class Get All My Offers
                      RefreshIndicator(
                        color: AppColors.primaryColor,
                        child:Padding(
                          padding: EdgeInsets.all(14.sp),
                          child: ListCardWidget(getAllNotes: state.data??[]),
                        ),
                        onRefresh: () {
                          return Future.value();
                        },
                      ),

                      /// Class Get All My Waiting Offers
                      RefreshIndicator(
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(14.sp),
                          child: ListCardWidget(getAllNotes: state.data??[]),
                        ),
                        onRefresh: () {
                          return Future.value();
                        },
                      ),

                      /// Class Get All My Last Offers
                      RefreshIndicator(
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding:  EdgeInsets.all(14.sp),
                          child: ListCardWidget(getAllNotes: state.data??[]),
                        ),
                        onRefresh: () {
                          return Future.value();

                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
