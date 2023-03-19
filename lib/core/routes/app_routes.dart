import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future navigateRemoveUntil<BlocType extends BlocBase>(BuildContext context, Widget widget, {BlocType? bloc}) async {
  if (bloc != null) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<BlocType>.value(
              value: bloc,
              child: widget,
            )),
            (route) => false
    );
  }
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Future navigateTo<BlocType extends BlocBase>(BuildContext context, Widget widget, {BlocType? bloc}) async {
  if (bloc != null) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<BlocType>.value(
              value: bloc,
              child: widget,
            )));
  }
  return Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Future pushReplacement<BlocType extends BlocBase>(BuildContext context, Widget widget, {BlocType? bloc}) async {
  if (bloc != null) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<BlocType>.value(
              value: bloc,
              child: widget,
            )));
  }
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

Future navigatorPop(BuildContext context) async {
  return Navigator.of(context).pop();
}
