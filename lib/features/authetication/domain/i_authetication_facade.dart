import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/authetication/domain/model/user_model.dart';

abstract class IAutheticationFacade {
  //LOGIN WITH EMAIL AND PASSWORD
  FutureResult<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError('loginWithEmailAndPassword() is not implemented');
  }

  //CREATE NEW USER
  FutureResult<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError('createNewUser() is not implemented');
  }

  //LOGOUT
  FutureResult<bool> logout() async {
    throw UnimplementedError('logout() is not implemented');
  }
}
