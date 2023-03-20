
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories_contracts/geolocator_repository.dart';


class GetCurrentPositionUseCase extends UseCase<Position, NoParams>{
  LocationRepository repository;
  GetCurrentPositionUseCase(this.repository);
  @override
  Future<Either<Failure, Position>> call(NoParams params) async {
        print("UseCase Position Called");
        return await repository.getCurrentPosition();
  }

}