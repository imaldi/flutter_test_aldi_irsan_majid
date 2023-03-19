part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

class CreateEmployeeEvent extends EmployeeEvent {
  final UserParams param;
  const CreateEmployeeEvent(this.param);

  @override
  List<Object?> get props => [param];
}

class ReadAllEmployeeEvent extends EmployeeEvent {
  final NoParams param;
  const ReadAllEmployeeEvent(this.param);

  @override
  List<Object?> get props => [param];
}

class ReadOneEmployeeEvent extends EmployeeEvent {
  final UserParams param;
  const ReadOneEmployeeEvent(this.param);

  @override
  List<Object?> get props => [param];
}

class UpdateEmployeeEvent extends EmployeeEvent {
  final UserParams param;
  const UpdateEmployeeEvent(this.param);

  @override
  List<Object?> get props => [param];
}

class DeleteEmployeeEvent extends EmployeeEvent {
  final UserParams param;
  const DeleteEmployeeEvent(this.param);

  @override
  List<Object?> get props => [param];
}