import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_connect/core/failures/failures.dart';
import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/authetication/domain/i_authetication_facade.dart';
import 'package:service_connect/features/authetication/domain/model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAutheticationFacade _autheticationFacade;
  AuthenticationBloc(this._autheticationFacade)
      : super(AuthenticationState.initial()) {
    //TOGGLE PASSWORD VISIBILITY
    on<_TogglePasswordVisibility>(_togglePasswordVisiblity);

    //TOGGLE REMEMBER ME
    on<_ToggleRememberMe>(_toggleRememberMe);

    //LOGIN WITH EMAIL AND PASSWORD
    on<_LoginWithEmailAndPassword>(_loginWithEmailAndPassword);

    //SIGN UP WITH EMAIL AND PASSWORD
    on<_SignUpWithEmailAndPassword>(_signUpWithEmailAndPassword);

    //LOGOUT
    on<_LogOut>(_logOut);

    //SET USER
    on<_SetUser>(_setUser);
  }

  void _setUser(
    _SetUser event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(user: event.user));
  }

  void _logOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(
      submitLoading: true,
      result: null,
    ));
    final result = await _autheticationFacade.logout();
    emit(state.copyWith(
      submitLoading: false,
    ));
  }

  Future<void> _signUpWithEmailAndPassword(
    _SignUpWithEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(
      submitLoading: true,
      result: null,
    ));
    final result = await _autheticationFacade.signUpWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    emit(state.copyWith(submitLoading: false, result: result));
  }

  Future<void> _loginWithEmailAndPassword(
    _LoginWithEmailAndPassword event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(
      submitLoading: true,
      result: null,
    ));
    final result = await _autheticationFacade.loginWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    emit(state.copyWith(submitLoading: false, result: result));
  }

  void _toggleRememberMe(
    _ToggleRememberMe event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  void _togglePasswordVisiblity(
    _TogglePasswordVisibility event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }
}
