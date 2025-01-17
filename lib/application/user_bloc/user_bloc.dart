import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/user/i_user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  IUserRepository repo;
  UserBloc(this.repo) : super(const _Initial()) {
    on<_CreateUser>(createUser);
    on<_DeleteUser>(deleteUser);
  }

  Future<void> createUser(_CreateUser event, Emitter<UserState> emit) async {
    emit(
      const UserState.loading(),
    );
    final response = await repo.createUser();
    response.fold(
      (message) {
        emit(
          UserState.failure(
            message: message,
          ),
        );
      },
      (_) {
        emit(
          const UserState.success(),
        );
      },
    );
  }

  Future<void> deleteUser(_DeleteUser event, Emitter<UserState> emit) async {
    emit(
      const UserState.loading(),
    );

    final response = await repo.deleteUser(id: event.id);

    response.fold(
      (message) {
        emit(
          UserState.failure(
            message: message,
          ),
        );
      },
      (_) {
        emit(
          const UserState.success(),
        );
      },
    );
  }
}
