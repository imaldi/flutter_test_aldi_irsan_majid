import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/params/location_address_params.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/open_street_map_response.dart';
import '../../repositories_contracts/geolocator_repository.dart';


class GetCurrentAddressUseCase extends UseCase<OpenStreetMapResponse, LocationAddressParams>{
  LocationRepository repository;
  GetCurrentAddressUseCase(this.repository);
  @override
  Future<Either<Failure, OpenStreetMapResponse>> call(LocationAddressParams params) async {
    print("UseCase Current Address Called");
    return await repository.getCurrentAddress(params.latitude, params.longitude);
  }

}