import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todox/core/route/routes.dart';
import 'package:todox/core/theme/app_theme.dart';
import 'package:todox/features/auth/data/repository/auth_repo_impl.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';
import 'core/config/contant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TodoXApp());
}

class TodoXApp extends StatelessWidget {
  final router = AppRoute.router;

  TodoXApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TodoRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(),
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp.router(
              theme: appTheme,
              title: APPNAME,
              debugShowCheckedModeBanner: false,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
