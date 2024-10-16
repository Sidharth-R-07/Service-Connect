import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:service_connect/core/failures/failures.dart';
import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/location/domain/i_location_facade.dart';
import 'package:service_connect/features/location/domain/model/location_model.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationFacade _iLocationFacade;
  LocationBloc(this._iLocationFacade) : super(LocationState.initial()) {
    //GET CURRENT LOCATION
    on<_GetCurrentLocation>(_getCurrentLocation);
  }

  Future<void> _getCurrentLocation(
      _GetCurrentLocation event, Emitter<LocationState> emit) async {
    emit(state.copyWith(isLoading: true));
    final location = await _iLocationFacade.getCurrentLocation();
    location.fold(
      (l) => emit(state.copyWith(isLoading: false, result: left(l))),
      (r) =>
          emit(state.copyWith(isLoading: false, location: r, result: right(r))),
    );
  }
}
