class LocationModel {
  final double latitude;
  final double longitude;
  final String? locality;
  final String? country;
  final String? city;
  final String? state;

  LocationModel({
    this.locality,
    this.country,
    this.city,
    this.state,
    required this.latitude,
    required this.longitude,
  });
}
