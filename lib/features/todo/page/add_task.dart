import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/core/theme/color.dart';
import 'package:todox/core/util/validator.dart';
import 'package:todox/widget/custom_text_feild.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  final TodoData? todoData;
   AddTask({Key? key, this.todoData}) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 96.h,
        backgroundColor:AppColors.primary900 ,
        leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:  Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset(
              'asset/image/back_button.svg',
              height: 48,
              width: 48,
            ),
          ),
        ),
        title: Text(
          'Add New Task',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
        centerTitle: true,

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Save')),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Task Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8.h,),
              Field(
                hint: "Task Title",
                validate: FieldValidator.required(message: "Title is required"),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8.h,),
                        Field(
                          onTap: (){

                          },
                          hint: "Date",
                          suffixIcon: SvgPicture.asset('asset/image/date_icon.svg'),
                          validate: FieldValidator.required(message: "Date is required"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8.h,),
                        Field(
                          onTap: (){

                          },
                          suffixIcon: SvgPicture.asset('asset/image/time_icon.svg'),
                          hint: "Time",
                          validate: FieldValidator.required(message: "Date is required"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Notes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8.h,),
              Field(
                maxLines: 6,
                hint: "Notes",
                validate: FieldValidator.required(message: "Title is required"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
