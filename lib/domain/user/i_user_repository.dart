import 'package:book_reading/domain/user/entity/app_user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IUserRepository {
  Future<Either<String, Unit>> createUser({
    required AppUser user,
  });

  Future<Either<String, Unit>> deleteUser({
    required String id,
  });

  Future<Either<String, AppUser>> getUser({required String userId});
}
