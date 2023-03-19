import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/delete_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/read_one_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/update_employee_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../data/models/user_model.dart';
import '../../../../../domain/usecases/employee/create_employee_usecase.dart';
import '../../../../../domain/usecases/employee/read_all_employee_usecase.dart';

part 'employee_event.dart';

part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final CreateEmployeeUsecase _createEmployeeUsecase;
  final ReadAllEmployeeUsecase _readAllEmployeeUsecase;
  final ReadOneEmployeeUsecase _readOneEmployeeUsecase;
  final UpdateEmployeeUsecase _updateEmployeeUsecase;
  final DeleteEmployeeUsecase _deleteEmployeeUsecase;

  EmployeeBloc(
      this._createEmployeeUsecase,
      this._readAllEmployeeUsecase,
      this._readOneEmployeeUsecase,
      this._updateEmployeeUsecase,
      this._deleteEmployeeUsecase)
      : super(EmployeeInitial()) {
    on<CreateEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      var result = await _createEmployeeUsecase(event.param);
      var newState = result.fold(
          (l) => EmployeeCRUDFailed(l.runtimeType.toString()),
          (r) => CreateEmployeeSucces());
      emit(newState);
    });
    on<ReadAllEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      var result = await _readAllEmployeeUsecase(event.param);
      var newState = result.fold(
          (l) {
            if(l is DataNotFoundFailure){
              return EmployeeListEmpty();
            }
            return EmployeeCRUDFailed(l.runtimeType.toString());
          },
          (r) => ReadAllEmployeeSucces(r));
      emit(newState);
    });
    on<ReadOneEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      var result = await _readOneEmployeeUsecase(event.param);
      var newState = result.fold(
          (l) {
            if(l is DataNotFoundFailure){
              return EmployeeNotFound();
            }
            return EmployeeCRUDFailed(l.runtimeType.toString());
          },
          (r) => ReadOneEmployeeSucces(r));
      emit(newState);
    });
    on<UpdateEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      var result = await _updateEmployeeUsecase(event.param);
      var newState = result.fold(
          (l) => EmployeeCRUDFailed(l.runtimeType.toString()),
          (r) => UpdateEmployeeSucces());
      emit(newState);
    });
    on<DeleteEmployeeEvent>((event, emit) async {
      emit(EmployeeLoading());
      var result = await _deleteEmployeeUsecase(event.param);
      var newState = result.fold(
          (l) => EmployeeCRUDFailed(l.runtimeType.toString()),
          (r) => DeleteEmployeeSucces());
      emit(newState);
    });
  }
}
