part of 'auth_bloc.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String serverError;
  ErrorAuthState(this.serverError);
}
