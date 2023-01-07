import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({Key? key, required this.icon, required this.text}) : super(key: key);
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin:const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey
          ),
          borderRadius:const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        children: [
          Padding(
            padding:const EdgeInsets.all(10),
            child: Image.asset(
              icon,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
