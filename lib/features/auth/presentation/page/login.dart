import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todox/features/auth/bloc/auth_bloc.dart';
import 'package:todox/widget/svg_button.dart';
import 'package:todox/core/theme/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary900,
      body: BlocProvider(
        create: (_) => AuthBloc(authRepositoryImpl: context.read()),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome To TodoX',
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )).animate().fade().scale(),
                  SizedBox(
                    height: 30.h,
                  ),
                  SvgButton(
                    text: 'Sign in with Google',
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthEventLogin());
                    },
                    asset: 'asset/image/logos_google-icon.svg',
                  ).animate().slideY()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
