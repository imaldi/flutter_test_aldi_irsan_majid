import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/widgets/MyTextField.dart';

import '../../data/models/user_model.dart';
import '../state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';
import 'package:go_router/go_router.dart';

class EditEmployeeScreen extends StatefulWidget {
  final int id;
  const EditEmployeeScreen(this.id,{Key? key}) : super(key: key);

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  var nameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var addressCtrl = TextEditingController();
  var phoneNumberCtrl = TextEditingController();
  var gender = "L";
  @override
  void initState() {
    super.initState();
    // User? user;
    context.read<EmployeeBloc>().add(ReadOneEmployeeEvent(UserParams(User(id: widget.id))));
    // if(){}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: BlocConsumer<EmployeeBloc, EmployeeState>(
        listener: (c,s){
          if(s is ReadOneEmployeeSucces){
            nameCtrl.text = s.employee.name ?? "";
            emailCtrl.text = s.employee.email ?? "";
            passwordCtrl.text = s.employee.password ?? "";
            addressCtrl.text = s.employee.address ?? "";
            phoneNumberCtrl.text = s.employee.phoneNumber ?? "";
            gender = s.employee.gender ?? "L";
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Form Registrasi"),
              Text("ID: ${widget.id}"),
              MyTextField(controller:nameCtrl,decoration: InputDecoration(label: Text("Nama")),),
              MyTextField(controller:emailCtrl,decoration: InputDecoration(label: Text("Email")),),
              MyTextField(
                controller: passwordCtrl,
                decoration: InputDecoration(label: Text("Password")),),
              MyTextField(controller:addressCtrl,decoration: InputDecoration(label: Text("Address")),),
              // MyTextField(controller:genderCtrl, decoration: InputDecoration(label: Text("Gender")),),
              MyTextField(
                controller: phoneNumberCtrl,
                decoration: InputDecoration(label: Text("Phone Number")),),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Gender"),
                          DropdownButton(
                            hint: Text("GBENDER"),
                              value: gender,
                              items: const [
                                DropdownMenuItem(
                                    value: "L",
                                    child: Text("L")),
                                DropdownMenuItem(
                                    value: "P",
                                    child: Text("P"))
                              ], onChanged: (val){
                            setState(() {
                              gender = val ?? "L";
                            });
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(onPressed: () {
                context.read<EmployeeBloc>().add(UpdateEmployeeEvent(UserParams(User(
                  id: widget.id,
                  name: nameCtrl.text,
                  email: emailCtrl.text,
                  password: passwordCtrl.text,
                  address: addressCtrl.text,
                  phoneNumber: phoneNumberCtrl.text,
                  gender: gender,
                ))));
                context.pop();
              }, child: Text("Add Employee"))
            ],);
        },
      ),
    ),),);
  }
}
