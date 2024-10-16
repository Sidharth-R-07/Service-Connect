import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.serverFailure({required String errorMsg}) =
      ServerFailure;

  const factory MainFailure.dataNotFount({required String errorMsg}) =
      DataNotFount;
  const factory MainFailure.locationFailure({required String errorMsg}) =
      _LocationFailure;
  const factory MainFailure.permissionDenied({required String errorMsg}) =
      _PermissionDenied;

  const factory MainFailure.authenticationFailure({required String errorMsg}) =
      AuthenticationFailure;
}
