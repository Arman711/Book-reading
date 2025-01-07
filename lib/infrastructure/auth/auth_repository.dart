import 'dart:developer';
import 'package:book_reading/domain/auth/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either<String, Unit>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    log('---- + $email');
    log(password);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(
          'Password is to weak',
        );
      } else if (e.code == 'email-already-in-use') {
        return const Left(
          'Email already in use',
        );
      } else {
        log(e.toString());
        return Left(e.code);
      }
    } catch (e) {
      return const Left(
        'Failed to sign up',
      );
    }
  }

  @override
  Future<Either<String, Unit>> login(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } catch (e) {
      return const Left(
        'Failed to log in',
      );
    }
  }

  @override
  Future<Either<String, Unit>> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return const Left(
          'Sign in with google is failure',
        );
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(
        credential,
      );
      return const Right(unit);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Unit>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
