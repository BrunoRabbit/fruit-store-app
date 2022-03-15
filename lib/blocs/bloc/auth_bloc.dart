import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fruit_store_app/data/repositories/auth_repository.dart';
import 'package:fruit_store_app/models/auth_detail_model.dart';

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
    // When User Presses the SignIn Button,
    // we will send the [SignInRequested] event to the AuthBloc to handle it
    // and emit the Authenticated State if the user is authenticated
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
    // When User Presses the SignUp Button,
    // we will send the [SignUpRequested] event to the AuthBloc to handle it
    // and emit the Authenticated State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the Google Login Button,
    // we will send the [GoogleSignInRequest] event to the AuthBloc
    // to handle it and emit the Authenticated State if the user is
    // authenticated
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
    // When User Presses the SignOut Button,
    // we will send the [SignOutRequested] event to the AuthBloc to handle it
    // and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
