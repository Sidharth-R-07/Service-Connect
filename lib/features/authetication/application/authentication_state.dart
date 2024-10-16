part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required bool obscurePassword,
    required bool rememberMe,
    required bool submitLoading,
    required FailureOrSuccess<UserModel?>? result,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() => const AuthenticationState(
        obscurePassword: true,
        rememberMe: false,
        submitLoading: false,
        result: null,
      );
}
