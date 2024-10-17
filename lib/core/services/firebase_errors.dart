import 'dart:developer';

import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseErrors {
  String getMessage(String code) {
    log('Error code: $code');
    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Email and password sign-in is not enabled.';

      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'invalid-credential':
        return 'Email or password is incorrect.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
