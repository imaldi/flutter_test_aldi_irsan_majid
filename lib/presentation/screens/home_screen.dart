import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/route_path_consts/route_path_consts.dart';
import 'package:go_router/go_router.dart';

import '../state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hallooo"),),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            var employeeState = context.read<EmployeeBloc>().state;
            print("employeeState: $employeeState");
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Selamat datang di Mobile Legends"),
                ElevatedButton(onPressed: () {
                  context.go(detailScreen);
                }, child: Text("Move to Detail"))
              ],
            ),);
          },
        ));
  }
}
