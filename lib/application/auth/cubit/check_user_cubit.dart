import 'package:bloc/bloc.dart';
import 'package:book_reading/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_user_state.dart';
part 'check_user_cubit.freezed.dart';

class CheckUserCubit extends Cubit<CheckUserState> {
  IAuthRepository _auth;
  CheckUserCubit(this._auth) : super(const _Initial());

  Future<void> checkIfUserSignedIn() async {
    final response = _auth.checkIfUserSignedIn();
    response
        ? emit(
            const CheckUserState.success(),
          )
        : emit(
            const CheckUserState.failure(),
          );
  }
}
