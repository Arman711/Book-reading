import 'package:book_reading/domain/user/entity/app_user.dart';
import 'package:book_reading/domain/user/i_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryImpl implements IUserRepository {
  @override
  Future<Either<String, Unit>> createUser() async {
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;
    try {
      // final userData = user.toJson();
      final String userId = _auth.currentUser!.uid;
      final String? email = _auth.currentUser!.email;

      await _firestore.collection('users').doc(userId).set(AppUser(
            id: userId,
            bookCollection: [],
            email: email as String,
          ).toJson());
      return const Right(unit);
    } catch (e) {
      return const Left('Failure to create user');
    }
  }

  @override
  Future<Either<String, Unit>> deleteUser({required String id}) async {
    final _firestore = FirebaseFirestore.instance;

    try {
      await _firestore.collection('users').doc(id).delete();

      return const Right(unit);
    } catch (e) {
      return const Left(
        'Deleting user failure',
      );
    }
  }

  @override
  Future<Either<String, AppUser>> getUser({required String userId}) async {
    final _firestore = FirebaseFirestore.instance;
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        AppUser appUser = AppUser.fromJson(
          userDoc.data() as Map<String, dynamic>,
        );
        return Right(appUser);
      } else {
        return const Left(
          'User not found',
        );
      }
    } catch (e) {
      return const Left(
        'User not found',
      );
    }
  }
}
