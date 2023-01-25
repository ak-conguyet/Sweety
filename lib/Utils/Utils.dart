
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

void startActivity(BuildContext context, Widget target)=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>target));

void startActivityWithFinishCurrent(BuildContext context, Widget target)=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>target),((route) => false));