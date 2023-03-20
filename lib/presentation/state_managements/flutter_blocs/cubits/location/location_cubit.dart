import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/params/location_address_params.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../domain/usecases/geolocator/get_current_address.dart';
import '../../../../../domain/usecases/geolocator/get_current_position.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetCurrentPositionUseCase _getCurrentPositionUseCase;
  final GetCurrentAddressUseCase _getCurrentAddressUseCase;

  LocationCubit(this._getCurrentPositionUseCase,this._getCurrentAddressUseCase) : super(LocationState());

  _getAddress(double lat, double long) async {
    var eitherPositionOrFailure = await _getCurrentAddressUseCase(LocationAddressParams(latitude: lat, longitude: long));
    var newState = eitherPositionOrFailure.fold(
            (l) => state,
            (r) => state.copyWith(
            address: r.displayName
        ));
    emit(newState);
    // print("ADDRESS IN CUBIT: ${newState.address}");
  }
  getCurrentCoordinateAndAddress({Function(String lat, String lng, String address)? callBackAfterFetchLocation}) async {
    var eitherPositionOrFailure = await _getCurrentPositionUseCase(NoParams());
    var newSendScanDataModel = eitherPositionOrFailure.fold(
            (l) => state,
            (r) => state.copyWith(
            latitude: r.latitude,
            longitude: r.longitude));
    emit(newSendScanDataModel);
    if(state.latitude != null && state.longitude != null){
      await _getAddress(state.latitude!, state.longitude!);
    }
    print("LATITUDE FROM CUBIT: ${state.latitude}");
    print("ADDRESS IN CUBIT: ${state.address}");
    print("STATE OF CUBIT: ${state}");

    // if(callBackAfterFetchLocation != null){
    //   callBackAfterFetchLocation(state.latitude.toString(), state.longitude.toString(), state.address ?? "");
    // }
  }
}
