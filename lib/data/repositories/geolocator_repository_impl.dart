import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import '../../domain/repositories_contracts/geolocator_repository.dart';
import '../datasources/current_location_remote_data_source.dart';
import '../models/open_street_map_response.dart';


class LocationRepositoryImpl extends LocationRepository {
  final CurrentLocationRemoteDataSource currentLocationRemoteDataSource;
  final NetworkInfo networkInfo;

  LocationRepositoryImpl(
      {required this.currentLocationRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());
    try {
      final position = await currentLocationRemoteDataSource.getCurrentLocation();
      // authLocalDataSource.cacheLoginResponse(remoteTrivia);
      print("LATITUDE FROM REPO: ${position.latitude}");
      return Right(position);
    } on LocationServiceDisabledException {
      print("LATITUDE FROM REPO: LocationServiceDisabledFailure");
      return Left(LocationServiceDisabledFailure());
    } on PermissionDeniedException {
      print("LATITUDE FROM REPO: PermissionDeniedFailure");
      return Left(PermissionDeniedFailure());
    }
  }

  @override
  Future<Either<Failure, OpenStreetMapResponse>> getCurrentAddress(double latitude, double longitude) async {
    if (!(await networkInfo.isConnected)) return Left(NoInternetFailure());
    try {
      final address = await currentLocationRemoteDataSource.getCurrentAddress(latitude, longitude);
      // authLocalDataSource.cacheLoginResponse(remoteTrivia);
      print("address: $address");
      return Right(address);
    } on LocationException {
      print("Error di request");
      return Left(LocationFailure());
    }
  }
}
