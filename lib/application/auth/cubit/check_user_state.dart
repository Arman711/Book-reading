part of 'check_user_cubit.dart';

@freezed
class CheckUserState with _$CheckUserState {
  const factory CheckUserState.initial() = _Initial;
  const factory CheckUserState.loading() = _Loading;
  const factory CheckUserState.success() = _Success;
  const factory CheckUserState.failure() = _Failure;
}
