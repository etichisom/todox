import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/core/theme/color.dart';
import 'package:todox/core/util/extension.dart';
import 'package:todox/core/util/helper.dart';
import 'package:todox/features/home/bloc/home_bloc.dart';
import 'package:todox/features/todo/page/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        todoRepositoryImpl: context.read(),
      )..add(LoadTodoRequestEvent()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Pending",
                ),
              ],
            ),
            title: const Text('My Task List'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return const TodoScreen();
                        });
                  },
                  child: const Text('Add New Task')),
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is LoadingHomeState) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primary900),
                ),
              );
            }
            if (state is LoadedHomeState) {
              return TabBarView(
                children: [
                  _todoList(state.allTodo, context, ''),
                  _todoList(state.completedTodo, context, "Completed"),
                  _todoList(state.pendingTodo, context, "Pending"),
                ],
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }

  Widget _todoList(List<TodoData> todos, BuildContext context, String title) {
    if (todos.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/gif/animation_500_lii28jc2.gif',
            height: 200,
          ),
          Text(
            title.isEmpty ? 'Add a todo' : 'No $title todo',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            var data = todos[index];
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: (index == todos.length - 1 || index == 0)
                      ? BorderRadius.only(
                          bottomLeft: index == todos.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                          bottomRight: index == todos.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                          topLeft: index == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          topRight: index == 0
                              ? const Radius.circular(10)
                              : Radius.zero)
                      : null),
              child: Column(
                children: [
                  ListTile(
                    trailing: GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return TodoScreen(
                              todoData: data,
                              addTodoType: AddTodoType.edit,
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.edit),
                    ),
                    leading: Checkbox(
                      activeColor: AppColors.primary900,
                      value: data.status,
                      onChanged: (e) {
                        context.read<HomeBloc>().add(
                              EditTodoHomeEvent(
                                todoData: data,
                                status: e ?? false,
                              ),
                            );
                      },
                    ),
                    title: Text(
                      (data.title ?? "").capitalizeFirstChar(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          decoration:
                              data.status ? TextDecoration.lineThrough : null),
                    ),
                    subtitle: Text(
                      formatDate(data.date ?? "").MMMEd,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  index == todos.length - 1
                      ? const SizedBox()
                      : const Divider(),
                ],
              ),
            );
          }),
    );
  }
}
