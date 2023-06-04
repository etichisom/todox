import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todox/core/exceptions/app_excpetion.dart';
import 'package:todox/features/auth/data/repository/auth_repo_impl.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepositoryImpl;
  AuthBloc({required this.authRepositoryImpl}) : super(InitialAuthState()) {
    on<AuthEventLogin>((event, emit) async {
      try {
        emit(LoadingAuthState());
        await authRepositoryImpl.signInWithGoogle();
        emit(InitialAuthState());
      } catch (e) {
        emit(ErrorAuthState(e.toString()));
      }
    });
  }
}
