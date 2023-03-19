import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hallooo"),),
        body: Center(child: Column(
          children: [
            Text("Selamat datang di Mobile Legends"),
            ElevatedButton(onPressed: (){
              context.go('/detail');
            }, child: Text("Move to Detail"))
          ],
        ),));
  }
}
