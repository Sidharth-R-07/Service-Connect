import 'package:service_connect/core/utils/typedef/app_typedef.dart';
import 'package:service_connect/features/location/domain/model/location_model.dart';

abstract class ILocationFacade {
  //GET CURRENT LOCATION
  FutureResult<LocationModel> getCurrentLocation();
}
