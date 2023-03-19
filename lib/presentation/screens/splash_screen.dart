import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/route_path_consts/route_path_consts.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthCheckLoginEvent());
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
          context.pushReplacement(homeScreen);
        }
        if (state is AuthLoginSuccess) {
          context.pushReplacement(detailScreen);
        }
      },
      builder: (context, state) {
        return const Scaffold(body: Center(child: Text("Welcome to My App"),));
      },
    );
  }
}
