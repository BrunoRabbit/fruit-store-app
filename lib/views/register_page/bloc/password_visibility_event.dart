part of 'password_visibility_bloc.dart';

class PasswordVisibilityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeVisibility extends PasswordVisibilityEvent {
  final bool isObscureText;
  ChangeVisibility(this.isObscureText);

  @override
  List<Object> get props => [isObscureText];
}
