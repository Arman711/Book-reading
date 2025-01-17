part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) = _SignUpWithEmailAndPassword;
  const factory AuthEvent.logIn({
    required String email,
    required String password,
  }) = _LogIn;
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.checkIfUserSignedIn() = _CheckIfUserSignedIn;
}
