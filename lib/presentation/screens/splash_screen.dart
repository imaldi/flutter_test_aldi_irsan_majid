import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/routes/app_routes.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/detail_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/home_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';

import '../../injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var authState = context.read<AuthBloc>().add(AuthCheckLoginEvent());
    // bool isLogin = false;
    // if(authState is )

    Future.delayed(Duration(seconds: 3), () {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NoCachedLogin) {
          navigateTo(context, BlocProvider(
            create: (context) => sl<EmployeeBloc>(),
            child: const HomeScreen(),
          ));
        }
        if (state is AuthLoginSuccess) {
          navigateTo(context, BlocProvider(
            create: (context) => sl<EmployeeBloc>(),
            child: const DetailScreen(),
          ));
        }
      },
      builder: (context, state) {
        return Center(child: Text("Welcome to My App"),);
      },
    );
  }
}
