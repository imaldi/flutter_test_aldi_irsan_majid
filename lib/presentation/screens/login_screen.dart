import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/helper/toast_helper/my_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/view_consts/sizes.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/data/models/user_model.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/widgets/MyTextField.dart';

import '../../core/resources/consts/route_path_consts/route_path_consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthLoginSuccess){
          context.pushReplacement("/$homeScreen");
        }
        if(state is AuthLoginFailed){
          print("Failure: ${state.message}");
          myToast("Login Gagal");
        }
      },
      builder: (context, state) {
        var authBloc = context.read<AuthBloc>();
        print("State Auth in LoginScreen: ${state.runtimeType}");

        return Scaffold(body: Center(child: Padding(
          padding: const EdgeInsets.all(sizeMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login Screen"),
              MyTextField(
                controller: emailCtrl,
                decoration: InputDecoration(label: Text("Email")),
              ),
              MyTextField(
                controller: passwordCtrl,
                decoration: InputDecoration(label: Text("Password")),
              ),
              ElevatedButton(onPressed: () {
                authBloc.add(AuthLoginEvent(UserParams(User(
                    email: emailCtrl.text,
                    password: passwordCtrl.text))));
              }, child: Text("Login"))
            ],
          ),
        ),),);
      },
    );
  }
}
