import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

// -> Bloc takes an event triggered by the user
// -> emit the State according to the Events requested by the user.
// -> [AuthRepository] is need to accessing the methods
// -> AuthEvent => do some Event(onClick button, sign in button press)
// -> AuthEvent => send the Event to AuthBloc and when (on<>) is equal
// to event, the AuthBloc will handle it
// AuthState -> after that emit to AuthState to do something

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        await authRepository.userSetup(displayName: event.displayName);

        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signInWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
