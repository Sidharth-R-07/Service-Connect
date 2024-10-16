part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required bool isLoading,
    required LocationModel? location,
    required FailureOrSuccess? result,
  }) = _LocationState;

  factory LocationState.initial() => const LocationState(
        isLoading: false,
        location: null,
        result: null,
      );
}
