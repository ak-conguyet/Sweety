import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Component/CustomLoginButton.dart';
import 'Component/CustomTextFile.dart';
import 'MyColors.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({super.key});

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: MyColors.color2,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(MediaQuery.of(context).size.width/5))
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width/2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sweety',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    Image.asset('images/donut.png'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5,5),
                          blurRadius: 5
                      )
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(hintText:'Username or Email' ),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText: 'Password'),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText:'Username or Email' ),
                    const SizedBox(height: 20,),
                    CustomTextField(hintText: 'Password'),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},
                        child:const Text('SIGN UP'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.color4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}