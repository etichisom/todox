import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/core/theme/color.dart';
import 'package:todox/core/util/helper.dart';
import 'package:todox/features/todo/bloc/todo_bloc.dart';
import 'package:todox/widget/custom_text_feild.dart';

enum AddTodoType { edit, create }

class TodoScreen extends StatelessWidget {
  final TodoData? todoData;
  final AddTodoType addTodoType;
  const TodoScreen({
    Key? key,
    this.todoData,
    this.addTodoType = AddTodoType.create,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(
        addTodoType: addTodoType,
        todoRepositoryImpl: context.read(),
        todoData: todoData,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 96.h,
          backgroundColor: AppColors.primary900,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
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
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocListener<TodoBloc, TodoState>(
            listener: (context, state) {
              if (state is SuccessTodoState) {
                context.pop();
              } else if (state is ErrorTodoState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('Something went wrong, check your internet')));
              }
            },
            child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                      SizedBox(
                        height: 8.h,
                      ),
                      Field(
                        initialText: state.todoData.title ?? "",
                        onChanged: (e) {
                          context
                              .read<TodoBloc>()
                              .add(AddTitleTodoEvent(e.toString()));
                        },
                        hint: "Task Title",
                        errorText: (state.todoData.title ?? '').isEmpty
                            ? "Title is required"
                            : null,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Due date',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime
                                .now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now().add(
                              const Duration(days: 1000),
                            ),
                          ).then((value) {
                            context
                                .read<TodoBloc>()
                                .add(AddDateTodoEvent(value));
                          });
                        },
                        child: Container(
                          height: 55,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: const Color(0xffE0E0E0), width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  state.todoData.date != null
                                      ? formatDate(state.todoData.date ?? "")
                                          .MMMEd
                                      : '',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Spacer(),
                                SvgPicture.asset('asset/image/date_icon.svg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Notes',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Field(
                        initialText: state.todoData.note ?? "",
                        onChanged: (e) {
                          context
                              .read<TodoBloc>()
                              .add(AddNoteTodoEvent(e.toString()));
                        },
                        maxLines: 6,
                        hint: "Notes",
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      _buildButton(context, state)
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, TodoState state) {
    if (state is LoadingTodoState) {
      return Center(
        child: SizedBox(
          height: 40.h,
          width: 40.h,
          child: const CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation(AppColors.primary900),
          ),
        ),
      );
    }
    return SizedBox(
      height: 56,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: state.todoValid
            ? () {
                context.read<TodoBloc>().add(SaveEventAdd());
              }
            : null,
        child: const Text('Save'),
      ),
    );
  }
}
