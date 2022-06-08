part of 'password_visibility_bloc.dart';

class PasswordVisibilityState extends Equatable {
  final bool isObscureText;

  const PasswordVisibilityState(this.isObscureText);

  @override
  List<Object?> get props => [isObscureText];
}
