part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();
}

class EmployeeInitial extends EmployeeState {
  @override
  List<Object> get props => [];
}

class EmployeeLoading extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class CreateEmployeeSucces extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class ReadAllEmployeeSucces extends EmployeeState {
  final List<User> employeeList;
  const ReadAllEmployeeSucces(this.employeeList);
  @override
  List<Object?> get props => [];
}

class ReadOneEmployeeSucces extends EmployeeState {
  final User employee;
  const ReadOneEmployeeSucces(this.employee);
  @override
  List<Object?> get props => [employee];
}

class UpdateEmployeeSucces extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class DeleteEmployeeSucces extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class EmployeeCRUDFailed extends EmployeeState {
  final String message;
  const EmployeeCRUDFailed(this.message);
  @override
  List<Object?> get props => [message];
}