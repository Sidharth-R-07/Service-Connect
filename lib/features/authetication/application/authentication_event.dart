part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.togglePasswordVisibility() =
      _TogglePasswordVisibility;

  const factory AuthenticationEvent.toggleRememberMe() = _ToggleRememberMe;

  const factory AuthenticationEvent.loginWithEmailAndPassword({
    required String email,
    required String password,
  }) = _LoginWithEmailAndPassword;

  const factory AuthenticationEvent.signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) = _SignUpWithEmailAndPassword;

  const factory AuthenticationEvent.logOut() = _LogOut;

  const factory AuthenticationEvent.setUser(UserModel? user) = _SetUser;

  const factory AuthenticationEvent.clearLogoutResult() = _ClearLogoutResult;
}
