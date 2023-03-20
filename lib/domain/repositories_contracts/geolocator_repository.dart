import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/models/open_street_map_response.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentPosition();
  Future<Either<Failure, OpenStreetMapResponse>> getCurrentAddress(double latitude, double longitude);
}