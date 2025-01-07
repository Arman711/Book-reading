import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const _Initial()) {
    on<_SignUpWithEmailAndPassword>(signUpWithEmailAndPassword);
    on<_LogIn>(logIn);
    on<_SignInWithGoogle>(signInWithGoogle);
  }

  Future<void> signUpWithEmailAndPassword(
      // ignore: library_private_types_in_public_api
      _SignUpWithEmailAndPassword event,
      Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final response = await _authRepository.signUpWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (message) {
        emit(
          AuthState.failure(
            message: message,
          ),
        );
      },
      (_) {
        emit(
          const AuthState.success(),
        );
      },
    );
  }

  Future<void> logIn(
    // ignore: library_private_types_in_public_api
    _LogIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final response = await _authRepository.login(
      email: event.email,
      password: event.password,
    );

    response.fold(
      (message) {
        emit(
          AuthState.failure(
            message: message,
          ),
        );
      },
      (_) {
        emit(
          const AuthState.success(),
        );
      },
    );
  }

  Future<void> signInWithGoogle(
    // ignore: library_private_types_in_public_api
    _SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final response = await _authRepository.signUpWithGoogle();

    response.fold(
      (message) {
        emit(
          AuthState.failure(
            message: message,
          ),
        );
      },
      (_) {
        emit(
          const AuthState.success(),
        );
      },
    );
  }
}
