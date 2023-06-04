import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todox/features/todo/page/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return AddTask();
                    });
              },
              child: const Text('Add New Task')),
        ),
      ),
    );
  }
}
