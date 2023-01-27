
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,{required ContentType contentType, required String title, required String message} ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        )));
}

Future<T?> startActivity<T>(BuildContext context, Widget target){
  return Navigator.of(context).push<T>(
    PageRouteBuilder(
      pageBuilder: (context,animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOutQuad,));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    )
  );
}

void startActivityAndFinishCurrent(BuildContext context, Widget target){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>target),(route)=>false);
}