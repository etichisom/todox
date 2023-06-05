import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todox/features/auth/data/repository/auth_repo_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'auth_bloc_test.mocks.dart';
import 'package:todox/features/auth/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

@GenerateMocks([AuthRepositoryImpl])
void main() {
  group('', () {
    late MockAuthRepositoryImpl authRepositoryImpl;
    late AuthBloc authBloc;

    setUp(() {
      authRepositoryImpl= MockAuthRepositoryImpl();
      authBloc = AuthBloc(
          authRepositoryImpl: authRepositoryImpl
      );
    });

    test('initial state is correct', () {
      expect(authBloc.state, isA<InitialAuthState>());
    });


    blocTest(
      'save task',
      setUp: () {
        when(authRepositoryImpl.signInWithGoogle())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => authBloc,
      act: (bloc) => authBloc.add(AuthEventLogin()),
      expect: () => [
        isA<LoadingAuthState>(),
        isA<InitialAuthState>()
      ],
    );

  });


}
