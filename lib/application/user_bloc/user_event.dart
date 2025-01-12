part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.createUser({required AppUser user}) = _CreateUser;
  const factory UserEvent.deleteUser({required String id}) = _DeleteUser;
}
