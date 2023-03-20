import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/route_path_consts/route_path_consts.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/detail_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/create_or_edit_employee_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/home_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/login_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/splash_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite/sqflite.dart';


import 'core/resources/consts/db_keys/app_db_consts.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

part './core/routes/go_router.dart';
void main() async {
  await di.init();
  await openDatabase(dbName,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE $userTable (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT, address TEXT, gender TEXT, phone_number TEXT)');
      }
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp.router(
        title: 'Flutter Test Aldi',
        routerConfig: _router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const SplashScreen(),
        // const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}