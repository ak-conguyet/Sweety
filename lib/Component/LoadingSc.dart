
import 'package:flutter/material.dart';

class LoadingAni extends StatelessWidget {
  const LoadingAni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
