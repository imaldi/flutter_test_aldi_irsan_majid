import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/route_path_consts/route_path_consts.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/data/models/user_model.dart';
import 'package:go_router/go_router.dart';

import '../state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(ReadAllEmployeeEvent(NoParams()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hallooo"),),
        body: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (c,s){
            if(s is CreateEmployeeSucces || s is UpdateEmployeeSucces || s is DeleteEmployeeSucces){
              c.read<EmployeeBloc>().add(ReadAllEmployeeEvent(NoParams()));
            }
          },
          builder: (context, state) {
            // var employeeState = context.read<EmployeeBloc>().state;
            print("employeeState: $state");
            if(state is EmployeeLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            // if(state is EmployeeListEmpty){
            //   return const Center(child: Text("Belum ada Karyawan"),);
            // }
            if(state is ReadAllEmployeeSucces){
              return
                ListView.builder(
                    itemCount: state.employeeList.length,
                    itemBuilder: (c,i){
                  return Card(
                    child: ListTile(
                      onTap: (){
                        context.push("/home/edit_employee",extra: state.employeeList[i].id);
                      },
                      title: Text(state.employeeList[i].name ?? "-"),
                      trailing: InkWell(onTap: (){
                        context.read<EmployeeBloc>().add(DeleteEmployeeEvent(UserParams(User(id: state.employeeList[i].id))));
                      },
                      child: Icon(Icons.delete),
                      ),
                    ),

                  );

                });
                // Center(child: Text(state.employeeList.toString()),);
            }
            return const Center(child: Text("Belum ada Karyawan"),);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.push("/home/add_employee");
          },
          child: Icon(Icons.add),
        ),
    );

  }
}
