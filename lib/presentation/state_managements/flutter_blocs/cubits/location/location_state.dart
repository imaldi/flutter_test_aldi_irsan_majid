part of 'location_cubit.dart';

class LocationState extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? address;

  const LocationState({this.latitude, this.longitude, this.address});

  @override
  List<Object?> get props => [latitude, longitude, address];

  LocationState copyWith({double? latitude, double? longitude, String? address}) {
    return LocationState(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address);
  }
}
