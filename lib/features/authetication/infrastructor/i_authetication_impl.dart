import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:service_connect/core/failures/failures.dart';
import 'package:service_connect/core/services/firebase_errors.dart';
import 'package:service_connect/core/services/local_storage_services.dart';
import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/authetication/domain/i_authetication_facade.dart';
import 'package:service_connect/features/authetication/domain/model/user_model.dart';

@LazySingleton(as: IAutheticationFacade)
class IAutheticationImpl implements IAutheticationFacade {
  final FirebaseAuth _firebaseAuth;
  final LocalStorageServices _localStorageServices;
  final FirebaseErrors _firebaseErrors;
  IAutheticationImpl(
      this._firebaseAuth, this._localStorageServices, this._firebaseErrors);

  @override
  FutureResult<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await _localStorageServices.storeUserId(userCredential.user!.email!);
        return right(UserModel(
            id: userCredential.user!.uid, email: userCredential.user!.email!));
      } else {
        log('User not found.Please Sign up');
        return left(const MainFailure.authenticationFailure(
            errorMsg: 'User not found.Please Sign up'));
      }
    } on FirebaseAuthException catch (e) {
      log('Error: ${e.code}');
      return left(MainFailure.authenticationFailure(
          errorMsg: _firebaseErrors.getMessage(e.code)));
    } catch (e) {
      return left(MainFailure.authenticationFailure(errorMsg: e.toString()));
    }
  }

  @override
  FutureResult<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await _localStorageServices.storeUserId(userCredential.user!.email!);
        return right(UserModel(
            id: userCredential.user!.uid, email: userCredential.user!.email!));
      } else {
        return left(const MainFailure.authenticationFailure(
            errorMsg: 'User not found.Please login'));
      }
    } on FirebaseAuthException catch (e) {
      return left(MainFailure.authenticationFailure(
          errorMsg: _firebaseErrors.getMessage(e.code)));
    } catch (e) {
      return left(MainFailure.authenticationFailure(errorMsg: e.toString()));
    }
  }

  @override
  FutureResult<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _localStorageServices.clearUserId();
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(MainFailure.authenticationFailure(
          errorMsg: _firebaseErrors.getMessage(e.code)));
    } catch (e) {
      return left(MainFailure.authenticationFailure(errorMsg: e.toString()));
    }
  }
}
