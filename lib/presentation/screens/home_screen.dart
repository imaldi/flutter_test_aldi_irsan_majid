import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/route_path_consts/route_path_consts.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/view_consts/sizes.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/helper/toast_helper/my_toast.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/data/models/user_model.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/cubits/location/location_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_location/trust_location.dart';

import '../state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';
import '../state_managements/flutter_blocs/cubits/internet_connection/internet_connection_cubit.dart';

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
    context.read<InternetConnectionCubit>().checkConnection();
    context.read<LocationCubit>().getCurrentCoordinateAndAddress();
    TrustLocation.start(5);
    _checkMockLocation();
  }

  _checkMockLocation() async {
    try {
      TrustLocation.onChange.listen((values) async {
        print("MOCK LOCATION: ${values.isMockLocation}");
        await context.read<LocationCubit>().updateLocationStateFromMock(LocationState(
            latitude: double.parse(values.latitude ?? "0"),
            longitude: double.parse(values.longitude ?? "0"),
            // address: values.add,
            isMockLocation: values.isMockLocation));
      });
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print("State Auth in HomeScreen: ${state.runtimeType}");
        if (state is AuthLogoutSuccess || state is NoCachedLogin) {
          context.pushReplacement("/$loginScreen");
        }
      },
      child: BlocListener<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (!state.isOnline) {
            myToast("Koneksi Internet Terputus");
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Daftar Karyawan"),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: sizeMedium),
                child: InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(AuthLogoutEvent());
                    },
                    child: Icon(Icons.logout)),
              )
            ],
          ),
          body: BlocConsumer<EmployeeBloc, EmployeeState>(
            listener: (c, s) {
              if (s is CreateEmployeeSucces ||
                  s is UpdateEmployeeSucces ||
                  s is DeleteEmployeeSucces) {
                if (s is CreateEmployeeSucces) {
                  myToast("Success Create Employee");
                }
                if (s is UpdateEmployeeSucces) {
                  myToast("Success Update Employee");
                }
                if (s is DeleteEmployeeSucces) {
                  myToast("Success Delete Employee");
                }
                c.read<EmployeeBloc>().add(ReadAllEmployeeEvent(NoParams()));
              }
            },
            builder: (context, state) {
              // var employeeState = context.read<EmployeeBloc>().state;
              print("employeeState: $state");
              if (state is EmployeeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // if(state is EmployeeListEmpty){
              //   return const Center(child: Text("Belum ada Karyawan"),);
              // }
              if (state is ReadAllEmployeeSucces) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocConsumer<LocationCubit, LocationState>(
                          listener: (c, s) {
                        var isMockLocation = s.isMockLocation;

                        if (isMockLocation != null && isMockLocation) {
                          myToast("Mock Location Detected");
                        }
                      }, builder: (context, state) {
                        // var state = context.watch<LocationCubit>().state;
                        var address = state.address;
                        var lat = state.latitude;
                        var lng = state.longitude;
                        var isMockLocation = state.isMockLocation;

                        print(
                            "address print: ${context.watch<LocationCubit>().state}");
                        return Padding(
                          padding: const EdgeInsets.all(sizeMedium),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lokasi Saat Ini: $address"),
                              Text("\nLatitude Saat Ini: $lat"),
                              Text("Longitude Saat Ini: $lng"),
                              Text("\nIs Mock Location: $isMockLocation"),
                            ],
                          ),
                        );
                      }),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.employeeList.length,
                          itemBuilder: (c, i) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  context.push("/home/edit_employee",
                                      extra: state.employeeList[i].id);
                                },
                                title: Text(state.employeeList[i].name ?? "-"),
                                trailing: InkWell(
                                  onTap: () {
                                    context.read<EmployeeBloc>().add(
                                        DeleteEmployeeEvent(UserParams(User(
                                            id: state.employeeList[i].id))));
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                );
                // Center(child: Text(state.employeeList.toString()),);
              }
              return const Center(
                child: Text("Belum ada Karyawan"),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push("/home/add_employee");
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
