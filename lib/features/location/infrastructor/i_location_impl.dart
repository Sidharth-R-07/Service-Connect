import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:service_connect/core/failures/failures.dart';
import 'package:service_connect/core/services/location_services.dart';
import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/location/domain/i_location_facade.dart';
import 'package:service_connect/features/location/domain/model/location_model.dart';

@LazySingleton(as: ILocationFacade)
class ILocationImpl implements ILocationFacade {
  final LocationServices _locationServices;

  ILocationImpl(this._locationServices);
  @override
  FutureResult<LocationModel> getCurrentLocation() async {
    try {
      final location = await _locationServices.getCurrentLocation();

      if (location != null) {
        return right(location);
      } else {
        return left(
            const MainFailure.serverFailure(errorMsg: 'Location not found'));
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }
}
