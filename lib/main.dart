import 'package:flutter/material.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/detail_screen.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
part './core/routes/app_routes.dart';
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Test Aldi',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}