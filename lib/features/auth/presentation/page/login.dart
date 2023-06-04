import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todox/features/auth/bloc/auth_bloc.dart';
import 'package:todox/widget/svg_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AuthBloc(authRepositoryImpl: context.read()),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SvgButton(
                text: 'Sign in with Google',
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEventLogin());
                },
                asset: 'asset/image/logos_google-icon.svg',
              ),
            ),
          );
        }),
      ),
    );
  }
}
