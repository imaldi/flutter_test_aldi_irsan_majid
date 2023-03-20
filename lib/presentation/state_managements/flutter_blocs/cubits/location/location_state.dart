part of 'location_cubit.dart';

class LocationState extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool? isMockLocation;

  const LocationState({this.latitude, this.longitude, this.address, this.isMockLocation = false});

  @override
  List<Object?> get props => [latitude, longitude, address, isMockLocation];

  LocationState copyWith({double? latitude, double? longitude, String? address, bool? isMockLocation}) {
    return LocationState(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        isMockLocation: isMockLocation ?? this.isMockLocation,
      );
  }
}
